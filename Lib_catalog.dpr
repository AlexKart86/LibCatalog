program Lib_catalog;

uses
  Forms,
  dataMain in 'dataMain.pas' {dmMain: TDataModule},
  uUtils in 'uUtils.pas',
  fMain in 'fMain.pas' {frmMain},
  fTempl in 'fTempl.pas' {frmTempl},
  fDictionary in 'fDictionary.pas' {frmDictionary},
  fLogin in 'fLogin.pas' {frmLogin},
  fDictAutors in 'fDictAutors.pas' {frmDictAutors},
  fAnketa in 'fAnketa.pas' {frmAnketa},
  fAnketaAutor in 'fAnketaAutor.pas' {frmAutorAnketa},
  fBookAnketa in 'fBookAnketa.pas' {frmBookAnketa},
  fProducer in 'fProducer.pas' {frmDictProducer},
  fBookList in 'fBookList.pas' {frmBookList},
  fDeleteReason in 'fDeleteReason.pas' {frmDictDeleteReason};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmMain, frmMain);
  Application.DefaultFont.Size := 9;
  Application.Run;
end.
