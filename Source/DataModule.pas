unit DataModule;

interface

uses
  SysUtils, Classes, Registry, DB, DBAccess, MSAccess, Windows, ImgList,
  Controls;

type
  Tdm = class(TDataModule)
    msCon1: TMSConnection; // Коннект к MS SQL серверу
    imgChmz: TImageList;   // Картинки к кнопкам
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  RegistryKey = '\software\app_Chmz_otd2'; // Ветка реестра с параметрами
  myDBServer  = 'DBSERVER'; // Имя сервера БД по умолчанию
  myDatabase  = 'iac54o2sk'; // Имя базы данных по умолчанию

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
