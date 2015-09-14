unit fDictAutors;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fDictionary, DBGridEhGrouping, ActnList, DB, IBCustomDataSet,
  ComCtrls, ToolWin, GridsEh, DBGridEh, StdCtrls, ExtCtrls, Buttons,
  IBFilterDialog, dataMain, MemTableDataEh, DataDriverEh, IBXDataDriverEh;

type
  TfrmDictAutors = class(TfrmDictionary)
    ibdMainAUTOR_ID: TIntegerField;
    ibdMainFIRST_NAME: TIBStringField;
    ibdMainLAST_NAME: TIBStringField;
    ibdMainMIDDLE_NAME: TIBStringField;
    cbAutorType: TComboBox;
    ibdMainBOOK_TYPE_ID: TIntegerField;
    procedure cbAutorTypeChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure acAddExecute(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
  private
    function GetBookTypeId: Integer;
    procedure RefreshBookTypeFilter;
  public
    property BookType: Integer read GetBookTypeId;
  end;

procedure OpenDictAutors;
function SelectAutorsExecute(AFieldNames: Tarray<string>; AFieldValues: TArray<variant>;
 ABookTypeId: Integer): Boolean;

implementation

uses uUtils, fAnketaAutor;
{$R *.dfm}
{ TfrmDictAutors }

procedure TfrmDictAutors.acAddExecute(Sender: TObject);
begin
  InsertAnketaExecute(BookType);
  acRefresh.Execute;
end;

procedure TfrmDictAutors.acDeleteExecute(Sender: TObject);
begin
  inherited;
  dmMain.ibtMain.CommitRetaining;
end;

procedure TfrmDictAutors.acEditExecute(Sender: TObject);
begin
  if not ibdMain.IsEmpty then
    UpdateAnketaExecute(ibdMainAUTOR_ID.Value);
end;

procedure TfrmDictAutors.Button1Click(Sender: TObject);
begin
  inherited;
  ibdMain.SelectSQL.Text := ibdMain.SelectSQL.Text + ' order by last_name';
  ReopenDataSet(ibdMain);
end;

procedure TfrmDictAutors.cbAutorTypeChange(Sender: TObject);
begin
  inherited;
  RefreshBookTypeFilter;
end;

procedure TfrmDictAutors.FormActivate(Sender: TObject);
begin
  inherited;
  ReopenDataSet(ibdMain);
end;

procedure TfrmDictAutors.FormShow(Sender: TObject);
begin
  inherited;
  RefreshBookTypeFilter;
end;

function TfrmDictAutors.GetBookTypeId: Integer;
begin
  Result := cbAutorType.ItemIndex + 1;
end;

procedure TfrmDictAutors.RefreshBookTypeFilter;
const
  vFilterStr = 'book_type_id = %d';
begin
  ibdMain.Close;
  case BookType of
    cnstGeneralbookType, cnstStudyBookType:
        ibdMain.ParamByName('btype').Value := BookType;
  else
    ibdMain.ParamByName('btype').Value :=  -1;
  end;
  ibdMain.Open;
end;

procedure OpenDictAutors;
var frmDictAutors: TfrmDictAutors;
begin
  frmDictAutors := TfrmDictAutors.Create(Application);
  frmDictAutors.OpenDict;
end;

function SelectAutorsExecute(AFieldNames: Tarray<string>; AFieldValues: TArray<variant>;
    ABookTypeId: Integer): Boolean;
var frmDictAutors: TfrmDictAutors;
begin
  frmDictAutors := TfrmDictAutors.Create(Application);
  if ABookTypeId in [cnstGeneralbookType, cnstStudyBookType] then
    frmDictAutors.cbAutorType.ItemIndex := ABookTypeId - 1;
  Result := frmDictAutors.ExecuteDictForSelect(AFieldNames, AFieldValues);
end;

end.
