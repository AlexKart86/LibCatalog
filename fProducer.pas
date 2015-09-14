unit fProducer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fDictionary, DBGridEhGrouping, ActnList, DB, IBCustomDataSet,
  ComCtrls, ToolWin, GridsEh, DBGridEh, StdCtrls, ExtCtrls;

type
  TfrmDictProducer = class(TfrmDictionary)
    ibdMainPRODUCER_ID: TIntegerField;
    ibdMainPRODUCER_NAME: TIBStringField;
    ibdMainPRODUCER_ADDRESS: TIBStringField;
    ibdMainCOMMENTS: TIBStringField;
  private
    { Private declarations }
  public

  end;

procedure OpenDictProducer;
function SelectDictProducer(AFieldNames: TArray<string>; AFieldValues: Tarray<variant>): Boolean;

implementation

{$R *.dfm}

procedure OpenDictProducer;
var
  frmDictProducer: TfrmDictProducer;
begin
  frmDictProducer :=  TfrmDictProducer.Create(Application);
  frmDictProducer.OpenDict;
end;

function SelectDictProducer(AFieldNames: TArray<string>; AFieldValues: Tarray<variant>): Boolean;
var
  frmDictProducer: TfrmDictProducer;
begin
  frmDictProducer :=  TfrmDictProducer.Create(Application);
  Result := frmDictProducer.ExecuteDictForSelect(AFieldNames, AFieldValues);
end;


end.
