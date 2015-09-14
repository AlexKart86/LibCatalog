unit fMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, Menus, ActnList, dataMain, ActnMan, ActnCtrls,
  PlatformDefaultStyleActnCtrls;

const
  WM_SHOW_CONNECT = WM_USER + 1;

type
  TfrmMain = class(TForm)
    tlbMain: TToolBar;
    ToolButton3: TToolButton;
    sbMain: TStatusBar;
    memMain: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    acMain: TActionList;
    acConnect: TAction;
    acDisconnect: TAction;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    N6: TMenuItem;
    N7: TMenuItem;
    acDictAutors: TAction;
    acPreference: TAction;
    acDictProduct: TAction;
    N8: TMenuItem;
    N9: TMenuItem;
    acBookList: TAction;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    acDictDelReason: TAction;
    ToolButton8: TToolButton;
    N10: TMenuItem;
    Excel1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure acConnectExecute(Sender: TObject);
    procedure acDisconnectExecute(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure acDictAutorsExecute(Sender: TObject);
    procedure acDictProductExecute(Sender: TObject);
    procedure acBookListExecute(Sender: TObject);
    procedure acDictDelReasonExecute(Sender: TObject);
  private
    { Private declarations }
  public
    function ConnectToDb: Boolean;
    function DisconnectFromDb: Boolean;
    procedure RefreshToolBar;
    procedure OnShow(var Message: TWMChar); message WM_SHOW_CONNECT;
  end;

var
  frmMain: TfrmMain;

implementation

uses  uUtils
    , fLogin
    , fDictAutors
    , fProducer
    , fBookList
    , fDeleteReason;

{$R *.dfm}
{ TForm1 }

function TfrmMain.ConnectToDb: Boolean;
begin
  RunConnectToDb;
  RefreshToolBar;
end;

function TfrmMain.DisconnectFromDb: Boolean;
var
  i: Integer;
begin
  for i := 0 to MDIChildCount - 1 do
    MDIChildren[i].Close;
  dmMain.dbMain.Connected := False;
  RefreshToolBar;
end;

procedure TfrmMain.RefreshToolBar;
begin
  acConnect.Enabled := not GlobalPreference.IsConnected;
  acDisconnect.Enabled := GlobalPreference.IsConnected;
  if GlobalPreference.IsConnected then
  begin
    sbMain.Panels[0].Text := 'Під''єднано';
    sbMain.Panels[1].Text := 'Шлях до БД: ' + GlobalPreference.DBPath;
  end
  else
  begin
    sbMain.Panels[0].Text := 'Від''єднано';
    sbMain.Panels[1].Text := '';
  end;

end;

procedure TfrmMain.OnShow(var Message: TWMChar);
begin
  ConnectToDb;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  PostMessage(Handle, WM_SHOW_CONNECT, 0, 0);
end;

procedure TfrmMain.acBookListExecute(Sender: TObject);
begin
  ShowBookList;
end;

procedure TfrmMain.acConnectExecute(Sender: TObject);
begin
  ConnectToDb;
end;

procedure TfrmMain.acDictAutorsExecute(Sender: TObject);
begin
  OpenDictAutors;
end;

procedure TfrmMain.acDictDelReasonExecute(Sender: TObject);
begin
   OpenDictDeleteReason;
end;

procedure TfrmMain.acDictProductExecute(Sender: TObject);
begin
  OpenDictProducer;
end;

procedure TfrmMain.acDisconnectExecute(Sender: TObject);
begin
  DisconnectFromDb;
end;

procedure TfrmMain.N4Click(Sender: TObject);
begin
  Close;
end;

end.
