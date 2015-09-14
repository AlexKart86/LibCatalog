unit fAnketa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fTempl, dataMain, DB, IBCustomDataSet, StdCtrls, Buttons, ExtCtrls;

type
  TfrmAnketa = class(TfrmTempl)
    pnlFooter: TPanel;
    bbtnSave: TBitBtn;
    bbtnCancel: TBitBtn;
    ibdMain: TIBDataSet;
    dsMain: TDataSource;
    procedure bbtnSaveClick(Sender: TObject);
    procedure bbtnCancelClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    function IsSaveChanges: Boolean; virtual; abstract;
    function IsAnketaFieldsCorrect: Boolean; virtual; abstract;
  end;

implementation

{$R *.dfm}

procedure TfrmAnketa.bbtnSaveClick(Sender: TObject);
begin
  inherited;
  if IsAnketaFieldsCorrect and IsSaveChanges then
  begin
    if ibdMain.State in dsEditModes then
      ibdMain.Post;
    dmMain.ibtMain.CommitRetaining;
    Close;
  end
  else
    ModalResult := mrNone;
end;

procedure TfrmAnketa.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if ibdMain.Modified and (MessageDlg(
      'Ви впевнені, що бажаєте вийти без збереження даних?', mtWarning,
      [mbYes, mbNo], 0) = MrNo) then
    CanClose := False
  else
    CanClose := True;
end;

procedure TfrmAnketa.bbtnCancelClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('Ви впевнені, що бажаєте вийти без збереження даних?',
    mtWarning, [mbYes, mbNo], 0) = mrYes then
  begin
    ibdMain.Cancel;
    Close;
  end;

end;

end.
