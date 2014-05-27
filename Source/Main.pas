unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, DBAccess, MSAccess, DBGridEhGrouping, MemDS, GridsEh,
  DBGridEh, DASQLMonitor, MSSQLMonitor, ToolWin, ComCtrls, ActnList, TeeProcs,
  TeEngine, Chart, DBChart, Series, StdCtrls, Buttons, Mask, sMaskEdit,
  sCustomComboEdit, sTooledit, sEdit, sSpinEdit;

type
  TfrmMain = class(TForm)
    pnlTable1: TPanel; // Панель с гридом и тулбаром
    pnlGraph: TPanel;  // Панель с графиком
    spl1: TSplitter;   // Сплиттер между панелями
    dbgrdhTable: TDBGridEh;
    qrTable: TMSStoredProc;
    dsTable: TMSDataSource;
    actlstMain: TActionList;
    actExit: TAction;
    tlb1: TToolBar;
    btn1: TToolButton;
    btnExit: TToolButton;
    actRefresh: TAction;
    btnRefresh: TToolButton;
    btn2: TToolButton;
    dsGraph: TMSDataSource;
    dbchtGraph: TDBChart;
    qrGraph: TMSStoredProc;
    pnlToolGraph: TPanel;
    arsrsSeries1: TAreaSeries;
    lnsrsSeries1: TLineSeries;
    rb1: TRadioButton;
    btnApplyGraph: TBitBtn;
    medtHour: TMaskEdit;
    dedt1: TsDateEdit;
    btn3: TToolButton;
    lbl1: TLabel;
    btn4: TToolButton;
    stmpckr1: TsTimePicker;
    chk1: TCheckBox;
    btn5: TToolButton;
    btnApplyTable: TBitBtn;
    btn6: TToolButton;
    tmrRefresh: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure dbgrdhTableGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure actRefreshExecute(Sender: TObject);
    procedure dsTableDataChange(Sender: TObject; Field: TField);
    procedure pnlToolGraphEnter(Sender: TObject);
    procedure pnlToolGraphExit(Sender: TObject);
    procedure chk1Click(Sender: TObject);
    procedure btnApplyGraphClick(Sender: TObject);
    procedure dedt1Enter(Sender: TObject);
    procedure dedt1Exit(Sender: TObject);
    procedure stmpckr1Enter(Sender: TObject);
    procedure stmpckr1Exit(Sender: TObject);
    procedure btnApplyTableClick(Sender: TObject);
    procedure tmrRefreshTimer(Sender: TObject);
  private
    { Private declarations }
    procedure ReopenTable(isCurDate: Boolean = True);
    procedure ReopenGraph;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  myMonitor: TMSSQLMonitor;
  lCurDate: TDateTime;

implementation

uses
  Chmz_Utils, DataModule, DateUtils;

{$R *.dfm}

procedure TfrmMain.actExitExecute(Sender: TObject);
begin
  // Закрытие формы - выход из приложения
  Close;
end;

procedure TfrmMain.actRefreshExecute(Sender: TObject);
begin
  ReopenTable;
end;

procedure TfrmMain.btnApplyGraphClick(Sender: TObject);
begin
  ReopenGraph;
  dbgrdhTable.SetFocus;
end;

procedure TfrmMain.btnApplyTableClick(Sender: TObject);
begin
  ReopenTable(False);
  dbgrdhTable.SetFocus;
end;

procedure TfrmMain.chk1Click(Sender: TObject);
begin
  // Обновление данных раз в минуту автоматически
  if chk1.Checked then
    begin
      dedt1.Enabled:=False;
      stmpckr1.Enabled:=False;
      tmrRefresh.Enabled:=True;
    end
  else
    begin
      tmrRefresh.Enabled:=False;
      dedt1.Enabled:=True;
      stmpckr1.Enabled:=True;
    end;
end;

procedure TfrmMain.dbgrdhTableGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  // Изменить цвет фона ячеек в зависимости от данных
  if dsTable.DataSet.Active and not dsTable.DataSet.IsEmpty then
    case dsTable.DataSet.FieldByName('Color').AsInteger of
      0: BackGround:=clGray;
      1: BackGround:=clRed;
      2: BackGround:=clYellow;
      3: BackGround:=clGreen;
    end;
end;

procedure TfrmMain.dedt1Enter(Sender: TObject);
begin
  btnApplyTable.Default:=True;
end;

procedure TfrmMain.dedt1Exit(Sender: TObject);
begin
  btnApplyTable.Default:=False;
end;

procedure TfrmMain.dsTableDataChange(Sender: TObject; Field: TField);
begin
  if not (dsTable.DataSet.State in [dsBrowse]) then exit;
  ReopenGraph;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  // Для мониторинга запросов
  myMonitor:=TMSSQLMonitor.Create(Application);
  myMonitor.Active:=True;

  // Прочитать информацию из реестра о сервере и базе данных
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

  // Соединиться с БД
  dm.msCon1.Connect;
  // Получить данные
  ReopenTable;
end;

procedure TfrmMain.ReopenGraph;
begin
  // Открытие датасета графиков с параметрами
  if dsGraph.DataSet.Active then dsGraph.DataSet.Close;
  if dsTable.DataSet.Active and not dsTable.DataSet.IsEmpty then
    begin
      // Параметры для графика
      TMSStoredProc(dsGraph.DataSet).ParamByName('FacilityCode').AsString:=dsTable.DataSet.FieldByName('FacilityCode').AsString;
      TMSStoredProc(dsGraph.DataSet).ParamByName('FirstDate').AsDateTime:=IncMinute(IncHour(dsTable.DataSet.FieldByName('MeasDT').AsDateTime,-StrToInt(medtHour.Text)),1);//StrToDateTime('14.05.2014 01:00:00');
      TMSStoredProc(dsGraph.DataSet).ParamByName('LastDate').AsDateTime:=dsTable.DataSet.FieldByName('MeasDT').AsDateTime;
      // Получить данные для графика
      dsGraph.DataSet.Open;
    end;
end;

procedure TfrmMain.ReopenTable(isCurDate: Boolean = True);
var
  lYear, lMonth, lDay, lHour, lMinute, lSecond, lMilliSecond: Word;
  lYear1, lMonth1, lDay1, lHour1, lMinute1, lSecond1: Word;
begin
  // Открытие датасета табличной части
  if isCurDate then
    begin
      // Получить текущую дату и время с сервера
      lCurDate:=GetResultSql(dm.msCon1, 'select GETDATE() result');
      // Записать их в элементы формы
      dedt1.Date:=lCurDate;
      stmpckr1.Time:=lCurDate;
    end
  else
    begin
      // Получить дату и время из элементов на форме
      DecodeDateTime(stmpckr1.Time, lYear1, lMonth1, lDay1, lHour, lMinute, lSecond, lMilliSecond);
      DecodeDateTime(dedt1.Date, lYear, lMonth, lDay, lHour1, lMinute1, lSecond1, lMilliSecond);
      lCurDate:=EncodeDateTime(lYear, lMonth, lDay, lHour, lMinute, lSecond, lMilliSecond);
    end;
  // Записать дату и время в параметры запроса
  TMSStoredProc(dsTable.DataSet).ParamByName('LastDate').AsDateTime:=lCurDate;

  // Закрыть датасеты
  dsGraph.DataSet.Close;
  dsTable.DataSet.Close;

  // Открыть табличную часть запроса
  dsTable.DataSet.Open;
end;

procedure TfrmMain.pnlToolGraphEnter(Sender: TObject);
begin
  btnApplyGraph.Default:=True;
end;

procedure TfrmMain.pnlToolGraphExit(Sender: TObject);
begin
  btnApplyGraph.Default:=False;
end;

procedure TfrmMain.stmpckr1Enter(Sender: TObject);
begin
  btnApplyTable.Default:=True;
end;

procedure TfrmMain.stmpckr1Exit(Sender: TObject);
begin
  btnApplyTable.Default:=False;
end;

procedure TfrmMain.tmrRefreshTimer(Sender: TObject);
begin
  ReopenTable;
end;

end.
