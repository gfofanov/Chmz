unit DataModule;

interface

uses
  SysUtils, Classes, Registry, DB, DBAccess, MSAccess, Windows, ImgList,
  Controls;

type
  Tdm = class(TDataModule)
    msCon1: TMSConnection;
    imgChmz: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  RegistryKey = '\software\app_Chmz_otd2';
  myDBServer  = 'DBSERVER';
  myDatabase  = 'iac54o2sk';

var
  dm: Tdm;
  regChmz : TRegistry;

implementation

{$R *.dfm}

initialization
  // Реестр
  regChmz:=TRegistry.Create;
  regChmz.RootKey:=HKEY_CURRENT_USER;
finalization
  FreeAndNil(regChmz);
end.
