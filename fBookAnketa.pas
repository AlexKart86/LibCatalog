unit fBookAnketa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fAnketa, DB, IBCustomDataSet, StdCtrls, Buttons, ExtCtrls, Mask,
  DBCtrlsEh, DBCtrls, JvDBImage, ComCtrls, Menus, JvBaseDlg, JvImageDlg,
  ExtDlgs, DBGridEhGrouping, GridsEh, DBGridEh;

type
  TfrmBookAnketa = class(TfrmAnketa)
    pnlPhoto: TPanel;
    dbiPhoto: TJvDBImage;
    dbeBookName: TDBEditEh;
    Label1: TLabel;
    Label2: TLabel;
    ibdMainBOOK_ID: TIntegerField;
    ibdMainBOOK_NAME: TIBStringField;
    ibdMainRELEASE_YEAR: TIntegerField;
    ibdMainPAGES: TIntegerField;
    ibdMainPART: TIntegerField;
    ibdMainPRODUCER_ID: TIntegerField;
    ibdMainCLASS: TIntegerField;
    ibdMainISBN: TIBStringField;
    ibdMainUDK: TIBStringField;
    ibdMainBBK: TIBStringField;
    ibdMainAUTOR_ID: TIntegerField;
    ibdMainBOOK_TYPE_ID: TIntegerField;
    ibdMainPHOTO: TBlobField;
    dbcAutor: TDBComboBoxEh;
    grbClassif: TGroupBox;
    Label4: TLabel;
    dbeISBN: TDBEditEh;
    Label5: TLabel;
    Label6: TLabel;
    dbeBBK: TDBEditEh;
    dbeUDK: TDBEditEh;
    pcPages: TPageControl;
    tsGeneral: TTabSheet;
    tsBookTrans: TTabSheet;
    Label7: TLabel;
    dbcbProducers: TDBComboBoxEh;
    dbcBookType: TDBComboBoxEh;
    Label3: TLabel;
    gbStructure: TGroupBox;
    Label8: TLabel;
    dbnReleaseYear: TDBNumberEditEh;
    Label9: TLabel;
    Label10: TLabel;
    ibdMainCOMMENTS: TIBStringField;
    ibdMainPROC_NUM: TIntegerField;
    ibdMainIMAGES_CNT: TIntegerField;
    ibdMainCOPY_CNT: TIntegerField;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    dbnPart: TDBNumberEditEh;
    dbnProcNum: TDBNumberEditEh;
    dbnImages: TDBNumberEditEh;
    dbnPages: TDBNumberEditEh;
    dbnCopyCount: TDBNumberEditEh;
    GroupBox1: TGroupBox;
    dbeComments: TDBEditEh;
    btnRefresh: TBitBtn;
    pmPhoto: TPopupMenu;
    pmSaveToFile: TMenuItem;
    pmLoadFromFile: TMenuItem;
    pmDelete: TMenuItem;
    dlgOpen: TOpenPictureDialog;
    lblClass: TLabel;
    dbcClass: TDBComboBoxEh;
    SavePictureDialog1: TSavePictureDialog;
    dlgSave: TSavePictureDialog;
    dbgBookTrans: TDBGridEh;
    ibdBookTrans: TIBDataSet;
    dsBookTrans: TDataSource;
    DBNavigator1: TDBNavigator;
    dbnBookTrans: TDBNavigator;
    ibdBookTransBOOK_TRANS_ID: TIntegerField;
    ibdBookTransBOOK_ID: TIntegerField;
    ibdBookTransPRICE: TFloatField;
    ibdBookTransBOOK_TRANS_NUM: TIntegerField;
    ibdBookTransDATE_DELETE: TDateField;
    ibdBookTransDEL_REASON_ID: TIntegerField;
    ibdBookTransDATE_TRANS: TDateField;
    ibdBookTransBOOK_TRANS_NUM_END: TIntegerField;
    ibdBookTransCNT: TIntegerField;
    ibdBookTransTOTAL_PRICE: TFloatField;
    procedure btnRefreshClick(Sender: TObject);
    procedure ibdMainBeforePost(DataSet: TDataSet);
    procedure bbtnSaveClick(Sender: TObject);
    procedure ibdMainAfterEdit(DataSet: TDataSet);
    procedure bbtnCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ibdMainAfterInsert(DataSet: TDataSet);
    procedure pmLoadFromFileClick(Sender: TObject);
    procedure pmSaveToFileClick(Sender: TObject);
    procedure dbiPhotoClick(Sender: TObject);
    procedure pmDeleteClick(Sender: TObject);
    procedure dbcBookTypeChange(Sender: TObject);
    procedure ibdBookTransAfterInsert(DataSet: TDataSet);
    procedure ibdMainAfterOpen(DataSet: TDataSet);
    procedure dbcAutorEditButtons0Click(Sender: TObject; var Handled: Boolean);
    procedure dbcbProducersEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
    procedure ibdBookTransAfterEdit(DataSet: TDataSet);
    procedure ibdBookTransCalcFields(DataSet: TDataSet);
  private
    FReadOnly: Boolean;
    procedure RefreshToolBar;
    procedure ReloadAutorCombo;
    procedure RefreshDictionaries;
    procedure SetReadOnly(AValue: Boolean);
  public
    property ReadOnly: Boolean read FReadOnly write SetReadOnly;
  end;

procedure InsertBookAnketaExecute;
procedure EditBookAnketaExecute(ABookId: Integer; AIsReadOnly: Boolean = False);

implementation

uses uUtils, dataMain, JPEG, fDictAutors, fProducer;
{$R *.dfm}
{ TfrmBookAnketa }

procedure TfrmBookAnketa.bbtnCancelClick(Sender: TObject);
begin
  // inherited;
  Close;
end;

procedure TfrmBookAnketa.bbtnSaveClick(Sender: TObject);
begin
  // inherited;
  if ibdMain.State in dsEditModes then
    ibdMain.Post;
  if ibdBookTrans.State in dsEditModes then
    ibdBookTrans.Post;
  ibdBookTrans.ApplyUpdates;
  dmMain.ibtMain.CommitRetaining;
  bbtnSave.Enabled := False;
end;

procedure TfrmBookAnketa.btnRefreshClick(Sender: TObject);
begin
  inherited;
  RefreshDictionaries;
end;

procedure TfrmBookAnketa.dbcAutorEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  vFieldNames: Tarray<string>;
  vFieldValues: Tarray<variant>;
begin
  inherited;
  SetLength(vFieldNames, 1);
  SetLength(vFieldValues, 1);
  vFieldNames[0] := 'AUTOR_ID';
  if SelectAutorsExecute(vFieldNames, vFieldValues, ibdMainBOOK_TYPE_ID.Value)
    then
  begin
    dbcAutor.Value := vFieldValues[0];
  end;
end;

procedure TfrmBookAnketa.dbcBookTypeChange(Sender: TObject);
begin
  inherited;
  RefreshToolBar;
  ReloadAutorCombo;
end;

procedure TfrmBookAnketa.dbcbProducersEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
var
  vFieldNames: Tarray<string>;
  vFieldValues: Tarray<variant>;
begin
  inherited;
  SetLength(vFieldNames, 1);
  SetLength(vFieldValues, 1);
  vFieldNames[0] := 'PRODUCER_ID';
  if SelectDictProducer(vFieldNames, vFieldValues) then
  begin
    dbcbProducers.Value := vFieldValues[0];
  end;
end;

procedure TfrmBookAnketa.dbiPhotoClick(Sender: TObject);
begin
  inherited;
  pmLoadFromFile.Click;
end;

procedure TfrmBookAnketa.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  // inherited;
  if bbtnSave.Enabled and (MessageDlg('Бажаєте вийти без збереження даних? ',
      mtWarning, [mbYes, mbNo], 0) <> mrYes) then
    CanClose := False;
end;

procedure TfrmBookAnketa.ibdBookTransAfterEdit(DataSet: TDataSet);
begin
  inherited;
  bbtnSave.Enabled := True;
end;

procedure TfrmBookAnketa.ibdBookTransAfterInsert(DataSet: TDataSet);
begin
  inherited;
  ibdBookTransBOOK_ID.Value := ibdMainBOOK_ID.Value;
  bbtnSave.Enabled := True;
end;

procedure TfrmBookAnketa.ibdBookTransCalcFields(DataSet: TDataSet);
begin
  inherited;
  ibdBookTransTOTAL_PRICE.AsFloat := ibdBookTransCNT.AsInteger *
    ibdBookTransPRICE.Value;
end;

procedure TfrmBookAnketa.ibdMainAfterEdit(DataSet: TDataSet);
begin
  inherited;
  bbtnSave.Enabled := True;
end;

procedure TfrmBookAnketa.ibdMainAfterInsert(DataSet: TDataSet);
begin
  inherited;
  bbtnSave.Enabled := True;
end;

procedure TfrmBookAnketa.ibdMainAfterOpen(DataSet: TDataSet);
begin
  inherited;
  ibdBookTrans.ParamByName('book_id').Value := ibdMain.ParamByName('book_id')
    .Value;
  ReopenDataSet(ibdBookTrans);
end;

procedure TfrmBookAnketa.ibdMainBeforePost(DataSet: TDataSet);
begin
  inherited;
  CheckRequiredFields(ibdMain);
end;

procedure TfrmBookAnketa.pmDeleteClick(Sender: TObject);
begin
  inherited;
  if not ibdMainPHOTO.IsNull and (MessageDlg('Видалити зображення?', mtWarning,
      mbYesNo, 0) = mrYes) then
    ibdMainPHOTO.Clear;
end;

procedure TfrmBookAnketa.pmLoadFromFileClick(Sender: TObject);
begin
  inherited;
  dlgOpen.InitialDir := ExtractFileDir(Application.ExeName);
  if dlgOpen.Execute then
  begin
    if not(ibdMain.State in dsEditModes) then
      ibdMain.Edit;
    ibdMainPHOTO.LoadFromFile(dlgOpen.FileName);
    RefreshToolBar;
  end;
end;

procedure TfrmBookAnketa.pmSaveToFileClick(Sender: TObject);
begin
  inherited;
  if not ibdMainPHOTO.IsNull then
  begin
    dlgSave.InitialDir := ExtractFileDir(Application.ExeName);
    if dlgSave.Execute then
      ibdMainPHOTO.SaveToFile(dlgSave.FileName);
  end;
end;

procedure TfrmBookAnketa.RefreshDictionaries;
begin
  FillComboBoxFromSQL(dbcBookType,
    'select book_type_id, book_type_name from dict_book_type');
  FillComboBoxFromSQL(dbcbProducers,
    'select producer_id, producer_name from dict_producer');


  FillStrListFromSQL(ColumnByName('DEL_REASON_ID', dbgBookTrans).PickList,
      ColumnByName('DEL_REASON_ID', dbgBookTrans).KeyList,
      'select del_reason_id, del_reason_name from dict_delete_reason');
  ReloadAutorCombo;
end;

procedure TfrmBookAnketa.RefreshToolBar;
begin
  pmSaveToFile.Enabled := not ibdMainPHOTO.IsNull;
  pmDelete.Enabled := not ibdMainPHOTO.IsNull;

  lblClass.Visible := not VarIsNullEx(dbcBookType.Value) and
    (dbcBookType.Value = cnstStudyBookType);
  dbcClass.Visible := lblClass.Visible;
  //tsBookTrans.TabVisible := lblClass.Visible;
  // tsGeneral.TabVisible := ibdMainBOOK_TYPE_ID.Value = cnstStudyBookType;
end;

procedure TfrmBookAnketa.ReloadAutorCombo;
const
  cnstSQL =
    'select autor_id, last_name||'' ''||coalesce(first_name, '''')||'' ''||coalesce(middle_name, '''') as name from dict_autor'#13#10 + 'where book_type_id = %s order by last_name';
begin
  if not VarIsNullEx(dbcBookType.Value) and
    ((dbcBookType.Value = cnstGeneralbookType) or
      (dbcBookType.Value = cnstStudyBookType)) then
  begin
    FillComboBoxFromSQL(dbcAutor, Format(cnstSQL, [VarToStr(dbcBookType.Value)])
      );
    if dbcAutor.ItemIndex = -1 then
      dbcAutor.Clear;
  end
  else
  begin
    { dbcAutor.Items.Clear;
      dbcAutor.KeyItems.Clear;
      ibdMainAUTOR_ID.Clear; }
  end;
end;

procedure TfrmBookAnketa.SetReadOnly(AValue: Boolean);
begin
  // TO DO Дописать
end;

procedure InsertBookAnketaExecute;
var
  frmBookAnketa: TfrmBookAnketa;
begin
  frmBookAnketa := TfrmBookAnketa.Create(Application);
  frmBookAnketa.ibdMain.ParamByName('book_id').Value := Null;
  frmBookAnketa.ibdMain.Open;
  frmBookAnketa.ibdMain.Insert;
  frmBookAnketa.RefreshDictionaries;
  frmBookAnketa.RefreshToolBar;
  frmBookAnketa.Show;
end;

procedure EditBookAnketaExecute(ABookId: Integer; AIsReadOnly: Boolean = False);
var
  frmBookAnketa: TfrmBookAnketa;
  vBookTypeComboChange: TNotifyEvent;
begin
  frmBookAnketa := TfrmBookAnketa.Create(Application);
  frmBookAnketa.ibdMain.ParamByName('book_id').Value := ABookId;
  frmBookAnketa.dbcBookType.OnChange := nil;
  frmBookAnketa.ibdMain.Open;
  frmBookAnketa.dbcBookType.OnChange := frmBookAnketa.dbcBookTypeChange;
  frmBookAnketa.RefreshDictionaries;
  frmBookAnketa.RefreshToolBar;
  frmBookAnketa.Show;
end;

end.
