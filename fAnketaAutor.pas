unit fAnketaAutor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fAnketa, DB, IBCustomDataSet, StdCtrls, Buttons, ExtCtrls, DBCtrls,
  DBCtrlsEh, Mask, ExtDlgs, Menus, JvDBImage;

type
  TfrmAutorAnketa = class(TfrmAnketa)
    pnlPhoto: TPanel;
    ibdMainAUTOR_ID: TIntegerField;
    ibdMainFIRST_NAME: TIBStringField;
    ibdMainLAST_NAME: TIBStringField;
    ibdMainMIDDLE_NAME: TIBStringField;
    ibdMainDATE_OF_BIRTH: TDateField;
    ibdMainDATE_OF_DEATH: TDateField;
    ibdMainPHOTO: TBlobField;
    ibdMainBOOK_TYPE_ID: TIntegerField;
    ibdMainCOMMENTS: TIBStringField;
    dbdtDateBirth: TDBDateTimeEditEh;
    dbdtDateDeath: TDBDateTimeEditEh;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    dbdeLastName: TDBEditEh;
    dbeFirstName: TDBEditEh;
    dbeMiddleName: TDBEditEh;
    Label6: TLabel;
    dbeComments: TDBEditEh;
    dbrBookType: TDBRadioGroup;
    openDlg: TOpenPictureDialog;
    pmPhoto: TPopupMenu;
    pmLoad: TMenuItem;
    pmSaveToFile: TMenuItem;
    pmDelete: TMenuItem;
    dlgSave: TSavePictureDialog;
    dbiPhoto: TJvDBImage;
    procedure ibdMainAfterInsert(DataSet: TDataSet);
    procedure pmLoadClick(Sender: TObject);
    procedure ibdMainAfterOpen(DataSet: TDataSet);
    procedure pmSaveToFileClick(Sender: TObject);
    procedure dbiPhotoDblClick(Sender: TObject);
    procedure pmDeleteClick(Sender: TObject);
  private
    procedure RefreshImageSubMenu;
  public
    function IsSaveChanges: Boolean; override;
    function IsAnketaFieldsCorrect: Boolean; override;
  end;

procedure InsertAnketaExecute(ABookTypeId: Integer = 0);
procedure UpdateAnketaExecute(AutorId: Integer);

implementation

uses uUtils, dataMain, Jpeg, pngimage, GIFImg;
{$R *.dfm}

procedure InsertAnketaExecute(ABookTypeId: Integer = 0);
var
  frmAutorAnketa: TfrmAutorAnketa;
begin
  frmAutorAnketa := TfrmAutorAnketa.Create(Application);
  frmAutorAnketa.ibdMain.ParamByName('autor_id').Value := GetNextId;
  frmAutorAnketa.ibdMain.Open;
  if ABookTypeId in [cnstGeneralbookType, cnstStudyBookType] then
  begin
     frmAutorAnketa.ibdMain.Edit;
     frmAutorAnketa.ibdMainBOOK_TYPE_ID.Value := ABookTypeId;
  end;
  frmAutorAnketa.Show;
end;

procedure UpdateAnketaExecute(AutorId: Integer);
var
  frmAutorAnketa: TfrmAutorAnketa;
begin
  frmAutorAnketa := TfrmAutorAnketa.Create(Application);
  frmAutorAnketa.ibdMain.ParamByName('autor_id').Value := AutorId;
  frmAutorAnketa.ibdMain.Open;
  frmAutorAnketa.Show;
end;

procedure TfrmAutorAnketa.dbiPhotoDblClick(Sender: TObject);
begin
  inherited;
  pmLoadClick(Sender);
end;

procedure TfrmAutorAnketa.ibdMainAfterInsert(DataSet: TDataSet);
begin
  inherited;
  ibdMainAUTOR_ID.Value := ibdMain.ParamByName('autor_id').Value;
end;

procedure TfrmAutorAnketa.ibdMainAfterOpen(DataSet: TDataSet);
begin
  inherited;
  RefreshImageSubMenu;
end;

function TfrmAutorAnketa.IsAnketaFieldsCorrect: Boolean;
begin
 Result :=  CheckRequiredFields(ibdMain);
end;

function TfrmAutorAnketa.IsSaveChanges: Boolean;
begin
  Result := False;
  if ibdMain.State in dsEditModes then
   ibdMain.Post;
  dmMain.ibtMain.CommitRetaining;
  Result := True;
end;

procedure TfrmAutorAnketa.pmDeleteClick(Sender: TObject);
begin
  inherited;
  ibdMainPHOTO.Clear;
end;

procedure TfrmAutorAnketa.pmLoadClick(Sender: TObject);
begin
  inherited;
  //openDlg.InitialDir :=  ExtractFileDir(Application.ExeName);
  if openDlg.Execute then
  begin
    if  not(ibdMain.State in dsEditModes) then
      ibdMain.Edit;
    ibdMainPHOTO.LoadFromFile(openDlg.FileName);
    RefreshImageSubMenu;
  end;
end;

procedure TfrmAutorAnketa.pmSaveToFileClick(Sender: TObject);
begin
  inherited;
  dlgSave.InitialDir := ExtractFileDir(Application.ExeName);
  if dlgSave.Execute then
   ibdMainPHOTO.SaveToFile(dlgSave.FileName);
end;

procedure TfrmAutorAnketa.RefreshImageSubMenu;
begin
  pmSaveToFile.Enabled := not ibdMainPHOTO.IsNull;
  pmDelete.Enabled := not ibdMainPHOTO.IsNull
end;

end.
