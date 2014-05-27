unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBAccess, MSAccess, DBGridEhGrouping, MemDS, GridsEh,
  DBGridEh, DASQLMonitor, MSSQLMonitor, ToolWin, ComCtrls, ActnList;

type
  TfrmMain = class(TForm)
    pnlTable1: TPanel;
    pnlGraph: TPanel;
    spl1: TSplitter;
    dbgrdhTable: TDBGridEh;
    mstrdprcTable: TMSStoredProc;
    dsTable: TMSDataSource;
    msqry1: TMSQuery;
    actlstMain: TActionList;
    actExit: TAction;
    tlb1: TToolBar;
    btn1: TToolButton;
    btnExit: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure dbgrdhTableGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  myMonitor: TMSSQLMonitor;
  lCurDate: TDateTime;

implementation

uses
  Chmz_Utils, DataModule;

{$R *.dfm}

procedure TfrmMain.actExitExecute(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.dbgrdhTableGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  if dsTable.DataSet.Active and not dsTable.DataSet.IsEmpty then
    case dsTable.DataSet.FieldByName('Color').AsInteger of
      0: BackGround:=clGray;
      1: BackGround:=clRed;
      2: BackGround:=clYellow;
      3: BackGround:=clGreen;
    end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  // Для мониторинга запросов
  myMonitor:=TMSSQLMonitor.Create(Application);
  myMonitor.Active:=True;

  // Соединиться с БД
  if regChmz.OpenKeyReadOnly(RegistryKey) then
    try
      try
        dm.msCon1.Database:=regChmz.ReadString('Database');
        if dm.msCon1.Database = '' then
          dm.msCon1.Database := myDatabase;
        dm.msCon1.Server:=regChmz.ReadString('Server');
        if dm.msCon1.Server = '' then
          dm.msCon1.Server := myDBServer;
      except
        MessageDlg('Невозможно прочитать информацию из реестра!'#10'Программа не может быть запущена.', mtError, [mbOK], 0);
        halt;
      end;
    finally
      regChmz.CloseKey;
    end
  else
    begin
      MessageDlg('Невозможно прочитать информацию из реестра!'#10'Программа не может быть запущена.', mtError, [mbOK], 0);
      halt;
    end;
  dm.msCon1.Connect;

  // Получить текущую дату с сервера
  lCurDate:=GetResultSql(dm.msCon1, 'select GETDATE() result');
  mstrdprcTable.ParamByName('LastDate').AsDateTime:=lCurDate;
  mstrdprcTable.Open;
end;

end.
