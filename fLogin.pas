unit fLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrlsEh;

type
  TfrmLogin = class(TForm)
    lblLogin: TLabel;
    edtLogin: TEdit;
    edtPass: TEdit;
    btnOk: TButton;
    btnCancel: TButton;
    Label2: TLabel;
    lblDB: TLabel;
    dbeDatabase: TDBEditEh;
    dlgOpen: TOpenDialog;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCancelClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbeDatabaseEditButtons0Click(Sender: TObject;
      var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function RunConnectToDb: Integer;

implementation
uses uUtils
  , IB;

{$R *.dfm}

function RunConnectToDb;
var
  frmLogin: TfrmLogin;
begin
  frmLogin := TfrmLogin.Create(Application);
  Result := frmLogin.ShowModal;
end;

procedure TfrmLogin.btnOkClick(Sender: TObject);
begin
  try
    GlobalPreference.ConnectToDb(dbeDataBase.Text, edtLogin.Text,
      edtPass.Text, 1);
    ModalResult := mrOk;  
      //Якщо викладач - повертаємо на форму викладачів
   { if cbRole.ItemIndex = 1 then
    begin
      ShowTeacherMain;
      Hide;
    end;
    //
    if cbRole.ItemIndex = 0 then
    begin
      ShowPupilMain;
      Hide;
    end;  }
  except
    on E: EIBInterBaseError do
      MessageDlg('Не вдається під''єднатись до БД. Можливо шлях до БД вказано не вірно. '#13
        + 'Відповідь сервера: '#13
        + E.Message, mtError, [mbOK], 0);
    on E: EUserNotExist do
    begin
      MessageDlg('Користувача з такими параметрами не знайдено на сервері. Бажаєте створити нового користувача? ',
        mtError, [mbYes, mbNo], 0);
    end;
  end;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmLogin.btnCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmLogin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
  if Key = VK_RETURN then
    btnOk.Click;
end;

procedure TfrmLogin.dbeDatabaseEditButtons0Click(Sender: TObject;
  var Handled: Boolean);
begin
  if dlgOpen.Execute then
    dbeDatabase.Text := dlgOpen.FileName;
end;

end.

