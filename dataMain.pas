unit dataMain;

interface

uses
  SysUtils, Classes, IBDatabase, IBDatabaseInfo, DB, IBSQL,
  IBCustomDataSet, IBQuery, XPMan, EhLibIBX, ImgList, Controls, JvComponentBase,
  JvXPCore;

type
  TdmMain = class(TDataModule)
    dbMain: TIBDatabase;
    ibtMain: TIBTransaction;
    ibMain: TIBQuery;
    ilMain_48: TImageList;
    ilMain_32: TImageList;
    XPManifest1: TXPManifest;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMain: TdmMain;

implementation

{$R *.dfm}



end.

