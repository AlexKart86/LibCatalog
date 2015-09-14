unit fBookList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, fDictionary, DBGridEhGrouping, GridsEh, DBGridEh, ActnList, DB,
  IBCustomDataSet, ComCtrls, ToolWin, StdCtrls, ExtCtrls, IBQuery, IBTable,
  frxClass, frxDBSet, frxIBXComponents, frxExportXLS, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, DBAxisGridsEh;

type
  TfrmBookList = class(TfrmDictionary)
    tvFilter: TTreeView;
    Splitter1: TSplitter;
    ibdMainBOOK_NAME: TIBStringField;
    ibdMainAUTOR: TIBStringField;
    ibdMainRELEASE_YEAR: TIntegerField;
    ibdMainBOOK_ID: TIntegerField;
    ibqClasses: TIBQuery;
    ibqClassesCL_NAME: TIBStringField;
    ibqClassesCL_ID: TIntegerField;
    ibdMainCL_NAME: TIBStringField;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    actReport: TAction;
    frxIBXComponents1: TfrxIBXComponents;
    ToolButton6: TToolButton;
    exp: TfrxXLSExport;
    ibqReport: TIBQuery;
    ibqReportBOOK_ID: TIntegerField;
    ibqReportBOOK_NAME: TIBStringField;
    ibqReportRELEASE_YEAR: TIntegerField;
    ibqReportPAGES: TIntegerField;
    ibqReportPART: TIntegerField;
    ibqReportPRODUCER_ID: TIntegerField;
    ibqReportCLASS: TIntegerField;
    ibqReportISBN: TIBStringField;
    ibqReportUDK: TIBStringField;
    ibqReportBBK: TIBStringField;
    ibqReportAUTOR_ID: TIntegerField;
    ibqReportBOOK_TYPE_ID: TIntegerField;
    ibqReportCOMMENTS: TIBStringField;
    ibqReportPROC_NUM: TIntegerField;
    ibqReportIMAGES_CNT: TIntegerField;
    ibqReportCOPY_CNT: TIntegerField;
    ibqReportAUTORS: TIBStringField;
    ibqReportPRODUCER_NAME: TIBStringField;
    ibqReportTOTAL_PRICE: TFloatField;
    ibqReportPHOTO: TBlobField;
    ibqReportPRICE_DELETE: TFloatField;
    ibqReportCNT_DELETE: TLargeintField;
    ibqReportPRICE_REMAIN: TFloatField;
    ibqReportCNT_REMAIN: TLargeintField;
    procedure acAddExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure acEditExecute(Sender: TObject);
    procedure dbgMainDblClick(Sender: TObject);
    procedure tvFilterChange(Sender: TObject; Node: TTreeNode);
    procedure FormShow(Sender: TObject);
    procedure acDeleteExecute(Sender: TObject);
    procedure actReportExecute(Sender: TObject);
  protected
    procedure RefreshDataSets;
  public
    procedure ReorderTree;
  end;

procedure ShowBookList;

implementation

uses fBookAnketa, uUtils, dataMain;

const
  cnstStudyBooks = 'Підручники';
{$R *.dfm}

procedure ShowBookList;
var
  frmBookList: TfrmBookList;
begin
  frmBookList := TfrmBookList.Create(Application);
  frmBookList.ibdMain.ParamByName('book_type_id').Value := -1;
  frmBookList.OpenDict;
end;

procedure TfrmBookList.acAddExecute(Sender: TObject);
begin
  // inherited;
  InsertBookAnketaExecute;
end;

procedure TfrmBookList.acDeleteExecute(Sender: TObject);
begin
  inherited;
  dmMain.ibtMain.CommitRetaining;
end;

procedure TfrmBookList.acEditExecute(Sender: TObject);
begin
  // inherited;
  if not ibdMain.IsEmpty then
    EditBookAnketaExecute(ibdMainBOOK_ID.Value);
end;

procedure TfrmBookList.actReportExecute(Sender: TObject);
begin
  inherited;
  ibqReport.Close;
  ibqReport.Open;
  frxReport1.PrepareReport;
  frxReport1.Export(exp);
end;

procedure TfrmBookList.dbgMainDblClick(Sender: TObject);
begin
  inherited;
  acEdit.Execute;
end;

procedure TfrmBookList.FormCreate(Sender: TObject);
begin
  inherited;
  acSave.Visible := False;
  pnlFooter.Visible := False;
end;

procedure TfrmBookList.FormShow(Sender: TObject);
begin
  inherited;
  ReorderTree;
  tvFilter.Items[0].Expand(True);
  actReport.Enabled := true;
  actReport.Visible := true;
end;

procedure TfrmBookList.RefreshDataSets;
begin
  inherited;
  ReorderTree;
end;

procedure TfrmBookList.ReorderTree;
var
  i: Integer;
  vRootNode, tmp: TTreeNode;
begin
  ibqClasses.Close;
  ibqClasses.Open;
  vRootNode := TreeNodeByName(tvFilter, 'Підручники');
  Assert(Assigned(vRootNode), 'Розробнику: Не знайдено вузол "підручники"');
  vRootNode.DeleteChildren;
  ibqClasses.First;
  while not ibqClasses.Eof do
  begin
    tvFilter.Items.AddChildObject(vRootNode, ibqClassesCL_NAME.Value,
      Pointer(ibqClassesCL_ID.Value));
    ibqClasses.Next;

  end;
end;

procedure TfrmBookList.tvFilterChange(Sender: TObject; Node: TTreeNode);
begin
  inherited;

  if Assigned(tvFilter.Selected) then
  begin
    if Assigned(tvFilter.Selected.Parent) and
      (tvFilter.Selected.Parent.Text = cnstStudyBooks) then
    begin
      ibdMain.ParamByName('class_id').Value := Integer(tvFilter.Selected.Data);
      ibdMain.ParamByName('book_type_id').Value :=
        tvFilter.Selected.Parent.StateIndex;
    end
    else
    begin
      ibdMain.ParamByName('class_id').Value := -1;
      ibdMain.ParamByName('book_type_id').Value := tvFilter.Selected.StateIndex;
    end;

  end
  else
    ibdMain.ParamByName('book_type_id').Value := -1;

  ReopenDataSet(ibdMain);
end;

end.
