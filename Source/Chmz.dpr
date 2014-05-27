program Chmz;

uses
  Forms,
  Controls,
  SysUtils,
  Chmz_Utils in 'Chmz_Utils.pas',
  Main in 'Main.pas' {frmMain},
  DataModule in 'DataModule.pas' {dm: TDataModule},
  Zastav in 'Zastav.pas' {FormZastav};

{$R *.res}

begin
  //CheckInstance('B10FE648-107E-4012-98E6-47205A405556', False, True); // проверка повторного запуска приложения

  // Показать форму заставки
  Screen.Cursor:=crHourglass;
  FormZastav:=TFormZastav.Create(Application);
  FormZastav.Show;
  Application.ProcessMessages;

  // Инициализация
  Application.Initialize;
  ShortDateFormat:='DD.MM.YYYY';
  Application.UpdateFormatSettings:=False;
  Application.Title := 'Визуализация измерений';
  //Application.MainFormOnTaskbar := True;

  Application.CreateForm(Tdm, dm);
  // Если отсутствует ветка реестра
  if regChmz.KeyExists(RegistryKey) = false then
    try
      // то создать
      if regChmz.OpenKey(RegistryKey, True) then
        begin
          // и записать значения по умолчанию
          regChmz.WriteString('Server', myDBServer);
          regChmz.WriteString('Database', myDatabase);
        end;
    finally
    end;
  Application.CreateForm(TfrmMain, frmMain);

  // Уничтожить форму заставки
  FormZastav.Refresh;
  FormZastav.Free;
  Screen.Cursor:=crDefault;

  Application.Run;
end.
