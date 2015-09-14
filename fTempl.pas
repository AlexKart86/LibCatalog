unit fTempl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TfrmTempl = class(TForm)
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FControls: TStringList;
  public
    procedure AddControlToList(AControl: TControl; AFieldName: String);
    procedure ActivateFormControl(AFieldName: String);
  end;


implementation

{$R *.dfm}

procedure TfrmTempl.ActivateFormControl(AFieldName: String);
begin

end;

procedure TfrmTempl.AddControlToList(AControl: TControl; AFieldName: String);
begin

end;

procedure TfrmTempl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action :=  caFree;
end;

end.
