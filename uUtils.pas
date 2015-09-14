unit uUtils;

interface

uses SysUtils, IBQuery, IBCustomDataSet, DBCtrlsEh, Variants, Classes, dbGridEh,
  ComCtrls;

const
  cnstGeneralbookType = 1; // загальна лытература
  cnstStudyBookType = 2; // підручники

type

  EUserNotExist = class(Exception);

    TGlobalPreference = class private FLogin: string;
    FUserPass: string;
    FLastName: string;
    FMiddleName: string;
    FFirstName: string;
    FUserId: Integer;
    FUserRole: Integer;
    FRoleId: Integer;

    FDbPath: string;

  public
    function IsConnected: Boolean;
    procedure ConnectToDb(ADbPath: string = ''; ALogin: string = '';
      APass: string = ''; ARoleId: Integer = 0);
    procedure DisconntectFromDb;
    property Login: string read FLogin;
    property UserId: Integer read FUserId;
    property DBPath: string read FDbPath;
    property RoleId: Integer read FRoleId;
    property LastName: string read FLastName;
    property MiddleName: string read FMiddleName;
    property FirstName: string read FFirstName;
  end;

function ExecSQL(ASQL: string; Aparams: array of Variant;
  IsOpen: Boolean = True): TIbQuery;
function GetNextId: Integer;

function CheckRequiredFields(ADataSet: TIBDataSet): Boolean;

procedure ReopenDataSet(ADataSet: TIBDataSet);

procedure FillComboBoxFromQuery(AComboBox: TDbComboBoxEh; ADataSet: TIbQuery);

procedure FillComboBoxFromSQL(AComboBox: TDbComboBoxEh; ASQL: String);

procedure FillStrListFromSQL(AItems, AKeyItems: TStrings; ASQL: String);

function VarIsNullEx(AValue: Variant): Boolean;

function ColumnByName(AFieldName: String; AGrid: TDBGridEh): TColumnEh;

function TreeNodeByName(ATree: TTreeView; AText: String): TTreeNode;

var
  GlobalPreference: TGlobalPreference;

implementation

uses dataMain, Db, Dialogs, EhLibIBX;

{ TGlobalPreference }

procedure TGlobalPreference.ConnectToDb(ADbPath, ALogin, APass: string;
  ARoleId: Integer);
begin
  if ADbPath <> '' then
    FDbPath := ADbPath;
  if ALogin <> '' then
    FLogin := ALogin;
  if APass <> '' then
    FUserPass := APass;
  if ARoleId <> 0 then
    FUserRole := ARoleId;
  dmMain.dbMain.Connected := False;
  dmMain.dbMain.DatabaseName := ADbPath;
  dmMain.dbMain.Connected := True;
  dmMain.ibtMain.Active := True;
  { ExecSQL(
    'select user_id, role_id, first_name, last_name, middle_name from users where login = :login and role_id = :role_id'#13 + ' and user_pass = :user_pass', ['login', ftString, FLogin, 'role_id', ftInteger, FUserRole, 'user_pass', ftString, FUserPass]);
    if dmMain.ibMain.RecordCount = 0 then
    raise EUserNotExist.Create('Користувача не знайдено в БД')
    else
    begin
    FUserId := dmMain.ibMain.FieldByName('user_id').Value;
    FRoleId := dmMain.ibMain.FieldByName('role_id').Value;
    FLastName := dmMain.ibMain.FieldByName('last_name').Value;
    FFirstName := dmMain.ibMain.FieldByName('first_name').Value;
    FMiddleName := dmMain.ibMain.FieldByName('middle_name').Value;
    end; }
end;

procedure TGlobalPreference.DisconntectFromDb;
begin

end;

function TGlobalPreference.IsConnected: Boolean;
begin
  Result := dmMain.dbMain.Connected;
end;

function ExecSQL(ASQL: string; Aparams: array of Variant;
  IsOpen: Boolean): TIbQuery;
var
  i: Integer;
  vParam: TParam;
begin
  Result := nil;
  Assert((Length(Aparams) mod 3) = 0,
    'Увага! Кількість параметрів функції ExecSQL повинна бути кратної 3');
  dmMain.ibMain.Close;
  dmMain.ibMain.Params.Clear;
  dmMain.ibMain.SQL.Text := ASQL;

  i := Low(Aparams);
  while i < High(Aparams) - 1 do
  begin
    vParam := dmMain.ibMain.Params.FindParam(Aparams[i]);
    if not Assigned(vParam) then
      dmMain.ibMain.Params.CreateParam(TFieldType(Aparams[i + 1]), Aparams[i],
        ptInput)
    else
    begin
      vParam.DataType := TFieldType(Aparams[i + 1]);
      vParam.Value := Aparams[i + 2];
    end;
    i := i + 3;
  end;
  if IsOpen then
    dmMain.ibMain.Open
  else
    dmMain.ibMain.ExecSQL;
  Result := dmMain.ibMain;
end;

function GetNextId: Integer;
begin
  Result := ExecSQL('select next value for gen_main from rdb$database', [])
    .FieldByName('gen_id').Value;
end;

function CheckRequiredFields(ADataSet: TIBDataSet): Boolean;
var
  i: Integer;
begin
  Result := True;
  for i := 0 to ADataSet.Fields.Count - 1 do
    if ADataSet.Fields[i].Required and (ADataSet.Fields[i].AsString = '') then
    begin
      MessageDlg(Format('Поле "%s" не заповнене',
          [ADataSet.Fields[i].DisplayLabel]), mtError, [mbOk], 0);
      Result := False;
      Abort;
    end;
end;

procedure ReopenDataSet(ADataSet: TIBDataSet);
var
  vBookMark: TBookmark;
begin
  if ADataSet.Active then
  begin
    vBookMark := ADataSet.GetBookmark;
    ADataSet.Close;
    ADataSet.Open;
    if ADataSet.BookmarkValid(vBookMark) then
      ADataSet.GotoBookmark(vBookMark);
  end
  else
    ADataSet.Open;
end;

{ TODO :  Быдлокод, необходимо отрефакторить }
procedure FillStrListFromSQL(AItems, AKeyItems: TStrings; ASQL: String);
var
  vQuery: TIbQuery;
begin
  AItems.Clear;
  AKeyItems.Clear;
  vQuery := ExecSQL(ASQL, []);
  vQuery.First;
  while not vQuery.Eof do
  begin
    AItems.Add(vQuery.Fields[1].AsString);
    AKeyItems.Add(vQuery.Fields[0].AsString);
    vQuery.Next;
  end;
end;

procedure FillComboBoxFromQuery(AComboBox: TDbComboBoxEh; ADataSet: TIbQuery);
var
  vOnChange: TNotifyEvent;
begin
  vOnChange := AComboBox.OnChange;
  try
    AComboBox.OnChange := nil;
    AComboBox.Items.Clear;
    AComboBox.KeyItems.Clear;
    if not ADataSet.Active then
      ADataSet.Open;
    ADataSet.First;
    while not ADataSet.Eof do
    begin
      AComboBox.Items.Add(ADataSet.Fields[1].AsString);
      AComboBox.KeyItems.Add(ADataSet.Fields[0].AsString);
      ADataSet.Next;
    end;
  finally
    AComboBox.OnChange := vOnChange;
  end;
end;

procedure FillComboBoxFromSQL(AComboBox: TDbComboBoxEh; ASQL: String);
begin
  FillComboBoxFromQuery(AComboBox, ExecSQL(ASQL, []));
end;

function ColumnByName(AFieldName: String; AGrid: TDBGridEh): TColumnEh;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to AGrid.Columns.Count - 1 do
    if AGrid.Columns[i].FieldName = AFieldName then
    begin
      Result := AGrid.Columns[i];
      Exit;
    end;
end;

function VarIsNullEx(AValue: Variant): Boolean;
begin
  Result := VarToStrDef(AValue, '') = '';
end;

function TreeNodeByName(ATree: TTreeView; AText: String): TTreeNode;
var i: Integer;
begin
  Result := nil;
  for I := 0 to Atree.Items.Count-1 do
    if Atree.Items[i].Text = Atext then
    begin
      Result := ATree.Items[i];
      Exit;
    end;

end;


initialization

GlobalPreference := TGlobalPreference.Create;

finalization

FreeAndNil(GlobalPreference);

end.
