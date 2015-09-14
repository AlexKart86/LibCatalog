unit fDictionary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fTempl, dataMain, ExtCtrls, DB, IBCustomDataSet, DBGridEhGrouping,
  ComCtrls, ToolWin, GridsEh, DBGridEh, ActnList, StdCtrls;

type
  TfrmDictionary = class(TfrmTempl)
    dsMain: TDataSource;
    ibdMain: TIBDataSet;
    pnlFooter: TPanel;
    dbgMain: TDBGridEh;
    tlbMain: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    alMain: TActionList;
    acAdd: TAction;
    acDelete: TAction;
    btnselect: TButton;
    btnCancel: TButton;
    ToolButton4: TToolButton;
    acRefresh: TAction;
    ToolButton5: TToolButton;
    acEdit: TAction;
    acSave: TAction;
    ToolButton3: TToolButton;
    pnlMain: TPanel;
    procedure acAddExecute(Sender: TObject);
    procedure acRefreshExecute(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure acSaveExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ibdMainAfterInsert(DataSet: TDataSet);
    procedure ibdMainAfterDelete(DataSet: TDataSet);
    procedure ibdMainAfterOpen(DataSet: TDataSet);
    procedure ibdMainAfterEdit(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btnselectClick(Sender: TObject);

  private
    FReadOnly: Boolean;
    FFieldNames: TArray<string>;
    FFieldValues: TArray<variant>;
    procedure GridForSelectClick(Sender: TObject);
  protected
    procedure SetReadOnly(AValue: Boolean);
    procedure RefreshToolbar; virtual;
    procedure RefreshDataSets; virtual;
  public
    property ReadOnly: Boolean read FReadOnly write SetReadOnly;
    procedure OpenDict;
    function ExecuteDictForSelect(AFieldNames: TArray<string>;
      AFieldValues: TArray<Variant>): Boolean;
  end;

implementation

uses uUtils;
{$R *.dfm}
{ TfrmDictionary }

procedure TfrmDictionary.acAddExecute(Sender: TObject);
var
  vList: TStringList;
begin
  inherited;
  if not ReadOnly then
    ibdMain.Insert;
end;

procedure TfrmDictionary.acDeleteExecute(Sender: TObject);
begin
  inherited;
  if not ReadOnly and not ibdMain.IsEmpty and (MessageDlg(
      'Ви дійсно бажаєте видалити запис (можливо видалення пов''язаних з ним записів)'
        , mtWarning, [mbYes, mbNo], 0) = mrYes) then
    ibdMain.Delete;
end;

procedure TfrmDictionary.acRefreshExecute(Sender: TObject);
begin
  inherited;
  RefreshDataSets;
end;

procedure TfrmDictionary.acSaveExecute(Sender: TObject);
begin
  inherited;
  ibdMain.ApplyUpdates;
  dmMain.ibtMain.CommitRetaining;
  acSave.Enabled := False;
end;

procedure TfrmDictionary.btnselectClick(Sender: TObject);
var i: integer;
begin
  inherited;
  for i := 0 to HIgh(FFieldNames) do
  begin
    if Assigned(ibdMain.FindField(FFieldNames[i])) then
      FFieldValues[i] := ibdMain.FieldByName(FFieldNames[i]).Value;
  end;
end;

function TfrmDictionary.ExecuteDictForSelect(AFieldNames: TArray<string>;
  AFieldValues: TArray<Variant>): Boolean;
var i: integer;
begin
  Result := False;
  dbgMain.Options := dbgMain.Options + [dgRowSelect];
  tlbMain.Visible := False;
  pnlFooter.Visible := True;
  ibdMain.Open;
  FFieldNames := AFieldNames;
  FFieldValues := AFieldValues;
  Visible := False;
  Position := poScreenCenter;
  dbgMain.OnDblClick :=  GridForSelectClick;
  Result := ShowModal = mrOk;
end;

procedure TfrmDictionary.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  dmMain.ibtMain.CommitRetaining;
end;

procedure TfrmDictionary.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if ibdMain.CachedUpdates and acSave.Enabled and acSave.Visible and
    (MessageDlg('Бажаєте вийти без збереження даних?', mtWarning,
      [mbYes, mbNo], 0) <> mrYes) then
    CanClose := False;
end;

procedure TfrmDictionary.FormCreate(Sender: TObject);
begin
  inherited;
  tlbMain.Font.Size := 8;
end;

procedure TfrmDictionary.GridForSelectClick(Sender: TObject);
begin
  if pnlFooter.Visible then
    btnselect.Click;
end;

procedure TfrmDictionary.ibdMainAfterDelete(DataSet: TDataSet);
begin
  inherited;
  acSave.Enabled := True;
end;

procedure TfrmDictionary.ibdMainAfterEdit(DataSet: TDataSet);
begin
  inherited;
  acSave.Enabled := True;
end;

procedure TfrmDictionary.ibdMainAfterInsert(DataSet: TDataSet);
begin
  inherited;
  acSave.Enabled := True;
end;

procedure TfrmDictionary.ibdMainAfterOpen(DataSet: TDataSet);
begin
  inherited;
  acSave.Enabled := False;
end;

procedure TfrmDictionary.OpenDict;
begin
  pnlFooter.Visible := False;
  ibdMain.Open;
  FormStyle := fsMDIChild;
  RefreshToolbar;
end;

procedure TfrmDictionary.RefreshDataSets;
begin
    if ibdMain.State in dsEditModes then
    ibdMain.Post;
  if acSave.Enabled and acSave.Visible and (MessageDlg
      ('Зберегти зміни перед оновленням даних?', mtInformation, [mbYes, mbNo],
      0) = mrYes) then
  begin
    ibdMain.ApplyUpdates;
    dmMain.ibtMain.CommitRetaining;
  end;
  ReopenDataSet(ibdMain);
  acSave.Enabled := False;
end;

procedure TfrmDictionary.RefreshToolbar;
begin
  acAdd.Enabled := not ReadOnly;
  acDelete.Enabled := ibdMain.Active and not ibdMain.IsEmpty;
end;

procedure TfrmDictionary.SetReadOnly(AValue: Boolean);
begin
  FReadOnly := AValue;
  RefreshToolbar;
end;

end.
