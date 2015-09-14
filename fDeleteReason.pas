unit fDeleteReason;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fDictionary, DBGridEhGrouping, ActnList, DB, IBCustomDataSet,
  GridsEh, DBGridEh, ComCtrls, ToolWin, StdCtrls, ExtCtrls;

type
  TfrmDictDeleteReason = class(TfrmDictionary)
    ibdMainDEL_REASON_ID: TIntegerField;
    ibdMainDEL_REASON_NAME: TIBStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure OpenDictDeleteReason;

implementation

{$R *.dfm}

procedure OpenDictDeleteReason;
var frmDictDeleteReason: TfrmDictDeleteReason;
begin
  frmDictDeleteReason := TfrmDictDeleteReason.Create(Application);
  frmDictDeleteReason.OpenDict;
end;


end.
