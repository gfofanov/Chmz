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
    pnlTable1: TPanel; // ������ � ������ � ��������
    pnlGraph: TPanel;  // ������ � ��������
    spl1: TSplitter;   // �������� ����� ��������
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
    lnsrsSeries1: TLineSeries;
    rb1: TRadioButton;
    btnApplyGraph: TBitBtn;
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
    edtHour: TEdit;
    lbl2: TLabel;
    edtWidthGraph: TsSpinEdit;
    lblHeigth: TLabel;
    edtHeigthGraph: TsSpinEdit;
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
    procedure dbchtGraphBeforeDrawChart(Sender: TObject);
    procedure edtHourChange(Sender: TObject);
    procedure edtWidthGraphChange(Sender: TObject);
    procedure edtHeigthGraphChange(Sender: TObject);
  private
    { Private declarations }
    lCurDate: TDateTime; // ���� ��� ������� ������
    lPrevHour : Integer; // ���-�� ���������� ����� ��� �������
    procedure ReopenTable(isCurDate: Boolean = True);
    procedure ReopenGraph;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;
  myMonitor: TMSSQLMonitor;

implementation

uses
  Chmz_Utils, DataModule, DateUtils;

{$R *.dfm}

procedure TfrmMain.actExitExecute(Sender: TObject);
begin
  // �������� ����� - ����� �� ����������
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
  // ���������� ������ ��� � ������ �������������
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

procedure TfrmMain.dbchtGraphBeforeDrawChart(Sender: TObject);
  var
    i : Word;
begin
  // ���� ����� �������
  dbchtGraph.Series[0].ColorEachPoint:=True; // ������ ����� ����� ���� ����
  dsGraph.DataSet.First;
  for i := 0 to dbchtGraph.Series[0].Count-1 do
    begin
      case dsGraph.DataSet.FieldByName('Color').AsInteger of
        0: dbchtGraph.Series[0].ValueColor[i]:=clGray;
        1: dbchtGraph.Series[0].ValueColor[i]:=$8072FA; //clFuchsia; //clRed;
        2: dbchtGraph.Series[0].ValueColor[i]:=clYellow;
        3: dbchtGraph.Series[0].ValueColor[i]:=clLime; //clGreen;
      end;
      if not dsGraph.DataSet.Eof then
        dsGraph.DataSet.Next;
    end;
end;

procedure TfrmMain.dbgrdhTableGetCellParams(Sender: TObject; Column: TColumnEh;
  AFont: TFont; var Background: TColor; State: TGridDrawState);
begin
  // �������� ���� ���� ����� ����� � ����������� �� ������
  if dsTable.DataSet.Active and not dsTable.DataSet.IsEmpty then
    case dsTable.DataSet.FieldByName('Color').AsInteger of
      0: BackGround:=clGray;
      1: BackGround:=$8072FA; //clFuchsia; //clRed;
      2: BackGround:=clYellow;
      3: BackGround:=clLime; //clGreen;
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

procedure TfrmMain.edtHeigthGraphChange(Sender: TObject);
begin
  TCustomSeries(dbchtGraph.Series[0]).Pointer.VertSize:=edtHeigthGraph.Value;
end;

procedure TfrmMain.edtHourChange(Sender: TObject);
// �������� ����� ���-�� �����
begin
  if Trim(edtHour.Text)='' then
    Exit;
  // ���� ����� �� �����, ��������� �� 24
  try
   lPrevHour:=StrToInt(trim(edtHour.Text));
  except on E:EConvertError do
   edtHour.Text:='24';
  end;
end;

procedure TfrmMain.edtWidthGraphChange(Sender: TObject);
begin
  TCustomSeries(dbchtGraph.Series[0]).Pointer.HorizSize:=edtWidthGraph.Value;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  // ��� ����������� ��������
  myMonitor:=TMSSQLMonitor.Create(Application);
  myMonitor.Active:=True;

  // ��������� ���������� �� ������� � ������� � ���� ������
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
        MessageDlg('���������� ��������� ���������� �� �������!'#10'��������� �� ����� ���� ��������.', mtError, [mbOK], 0);
        halt;
      end;
    finally
      regChmz.CloseKey;
    end
  else
    begin
      MessageDlg('���������� ��������� ���������� �� �������!'#10'��������� �� ����� ���� ��������.', mtError, [mbOK], 0);
      halt;
    end;

  // ����������� � ��
  dm.msCon1.Connect;
  // �������� ������
  ReopenTable;
end;

procedure TfrmMain.ReopenGraph;
begin
  // �������� �������� �������� � �����������
  if dsGraph.DataSet.Active then dsGraph.DataSet.Close;
  if dsTable.DataSet.Active and not dsTable.DataSet.IsEmpty then
    begin
      // ��������� ��� �������
      TMSStoredProc(dsGraph.DataSet).ParamByName('FacilityCode').AsString:=dsTable.DataSet.FieldByName('FacilityCode').AsString;
      if Trim(edtHour.Text)='' then
        edtHour.Text:='24';
      try
       lPrevHour:=StrToInt(trim(edtHour.Text));
      except on E:EConvertError do
       lPrevHour:=24;
      end;
      if lPrevHour<=0 then
        lPrevHour:=1;
      // ������ � ��������� �������
      TMSStoredProc(dsGraph.DataSet).ParamByName('FirstDate').AsDateTime:=IncMinute(IncHour(dsTable.DataSet.FieldByName('MeasDT').AsDateTime,-lPrevHour),1);//StrToDateTime('14.05.2014 01:00:00');
      TMSStoredProc(dsGraph.DataSet).ParamByName('LastDate').AsDateTime:=dsTable.DataSet.FieldByName('MeasDT').AsDateTime;
      // �������� ������ ��� �������
      dsGraph.DataSet.Open;
    end;
end;

procedure TfrmMain.ReopenTable(isCurDate: Boolean = True);
var
  lYear, lMonth, lDay, lHour, lMinute, lSecond, lMilliSecond: Word;
  lYear1, lMonth1, lDay1, lHour1, lMinute1, lSecond1: Word;
begin
  // �������� �������� ��������� �����
  if isCurDate then
    begin
      // �������� ������� ���� � ����� � �������
      lCurDate:=GetResultSql(dm.msCon1, 'select GETDATE() result');
      // �������� �� � �������� �����
      dedt1.Date:=lCurDate;
      stmpckr1.Time:=lCurDate;
    end
  else
    begin
      // �������� ���� � ����� �� ��������� �� �����
      DecodeDateTime(stmpckr1.Time, lYear1, lMonth1, lDay1, lHour, lMinute, lSecond, lMilliSecond);
      DecodeDateTime(dedt1.Date, lYear, lMonth, lDay, lHour1, lMinute1, lSecond1, lMilliSecond);
      lCurDate:=EncodeDateTime(lYear, lMonth, lDay, lHour, lMinute, lSecond, lMilliSecond);
    end;
  // �������� ���� � ����� � ��������� �������
  TMSStoredProc(dsTable.DataSet).ParamByName('LastDate').AsDateTime:=lCurDate;

  // ������� ��������
  dsGraph.DataSet.Close;
  dsTable.DataSet.Close;

  // ������� ��������� ����� �������
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
