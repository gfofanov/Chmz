object frmMain: TfrmMain
  Left = 241
  Top = 188
  Caption = #1042#1080#1079#1091#1072#1083#1080#1079#1072#1094#1080#1103' '#1080#1079#1084#1077#1088#1077#1085#1080#1081'. '#1054#1090#1076#1077#1083#1077#1085#1080#1077' 2'
  ClientHeight = 716
  ClientWidth = 1184
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object spl1: TSplitter
    Left = 0
    Top = 274
    Width = 1184
    Height = 5
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object pnlTable1: TPanel
    Left = 0
    Top = 0
    Width = 1184
    Height = 274
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object dbgrdhTable: TDBGridEh
      Left = 0
      Top = 29
      Width = 1184
      Height = 245
      Align = alClient
      AllowedOperations = []
      AllowedSelections = [gstRecordBookmarks]
      ColumnDefValues.Title.TitleButton = True
      ColumnDefValues.Title.ToolTips = True
      ColumnDefValues.ToolTips = True
      DataGrouping.GroupLevels = <>
      DataSource = dsTable
      Flat = True
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      IndicatorOptions = [gioShowRowIndicatorEh]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghRowHighlight, dghDblClickOptimizeColWidth, dghColumnResize, dghColumnMove]
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      UseMultiTitle = True
      VTitleMargin = 5
      OnGetCellParams = dbgrdhTableGetCellParams
      Columns = <
        item
          EditButtons = <>
          FieldName = 'FacilityCode'
          Footers = <>
          Title.Caption = #1050#1086#1076' '#1090#1086#1095#1082#1080
          Width = 52
        end
        item
          EditButtons = <>
          FieldName = 'ParamName'
          Footers = <>
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1072
          Width = 228
        end
        item
          EditButtons = <>
          FieldName = 'Value'
          Footers = <>
          Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
          Width = 113
        end
        item
          EditButtons = <>
          FieldName = 'UnitName'
          Footers = <>
          Title.Caption = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
          Width = 107
        end
        item
          EditButtons = <>
          FieldName = 'MeasDT'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072'-'#1074#1088#1077#1084#1103' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
          Width = 148
        end
        item
          EditButtons = <>
          FieldName = 'Color'
          Footers = <>
          Title.Caption = #1062#1074#1077#1090' '#1088#1072#1089#1082#1088#1072#1089#1082#1080
          Visible = False
          Width = 87
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object tlb1: TToolBar
      Left = 0
      Top = 0
      Width = 1184
      Height = 29
      ButtonHeight = 24
      Caption = 'tlb1'
      Images = dm.imgChmz
      TabOrder = 1
      object btn1: TToolButton
        Left = 0
        Top = 0
        Width = 8
        ImageIndex = 1
        Style = tbsSeparator
      end
      object btnRefresh: TToolButton
        Left = 8
        Top = 0
        Action = actRefresh
        ImageIndex = 8
      end
      object btn2: TToolButton
        Left = 31
        Top = 0
        Width = 8
        ImageIndex = 5
        Style = tbsSeparator
      end
      object lbl1: TLabel
        Left = 39
        Top = 0
        Width = 99
        Height = 24
        Alignment = taCenter
        Caption = #1044#1072#1085#1085#1099#1077' '#1085#1072' '#1076#1072#1090#1091':'
      end
      object dedt1: TsDateEdit
        Left = 138
        Top = 0
        Width = 94
        Height = 24
        AutoSize = False
        EditMask = '!99/99/9999;1; '
        MaxLength = 10
        TabOrder = 0
        OnEnter = dedt1Enter
        OnExit = dedt1Exit
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
        GlyphMode.Blend = 0
        GlyphMode.Grayed = False
        CheckOnExit = True
        DefaultToday = True
        Weekends = [dowSaturday, dowSunday, dowLocaleDefault]
      end
      object btn4: TToolButton
        Left = 232
        Top = 0
        Width = 8
        ImageIndex = 6
        Style = tbsSeparator
      end
      object stmpckr1: TsTimePicker
        Left = 240
        Top = 0
        Width = 121
        Height = 24
        TabOrder = 1
        Text = '00:00:00'
        OnEnter = stmpckr1Enter
        OnExit = stmpckr1Exit
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object btn5: TToolButton
        Left = 361
        Top = 0
        Width = 8
        ImageIndex = 5
        Style = tbsSeparator
      end
      object btnApplyTable: TBitBtn
        Left = 369
        Top = 0
        Width = 75
        Height = 24
        Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
        TabOrder = 2
        OnClick = btnApplyTableClick
      end
      object btn6: TToolButton
        Left = 444
        Top = 0
        Width = 8
        Caption = 'btn6'
        ImageIndex = 5
        Style = tbsSeparator
      end
      object chk1: TCheckBox
        Left = 452
        Top = 0
        Width = 193
        Height = 24
        Caption = #1054#1073#1085#1086#1074#1083#1103#1090#1100' '#1088#1072#1079' '#1074' '#1084#1080#1085#1091#1090#1091
        TabOrder = 3
        OnClick = chk1Click
      end
      object btn3: TToolButton
        Left = 645
        Top = 0
        Width = 8
        ImageIndex = 5
        Style = tbsSeparator
      end
      object btnExit: TToolButton
        Left = 653
        Top = 0
        Action = actExit
      end
    end
  end
  object pnlGraph: TPanel
    Left = 0
    Top = 279
    Width = 1184
    Height = 437
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object dbchtGraph: TDBChart
      Left = 0
      Top = 35
      Width = 1184
      Height = 402
      BackWall.Brush.Image.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        0000100000000100180000000000000300000000000000000000000000000000
        000067B8DE63B6DC63B6DC60B3D963B5DC65B7DE61B4DF5CB1DE56AAD759AAD2
        5BACD659ADD858ADD85AADDA61B4DC66B7DD6ABBE06AB9DE65B4DD5EB0DB59AB
        D653A3D454A7D855AADB57ABD65AAAD058A6D152A4D052A6D754A9D95BAEDA60
        B2DA69BBDD6CBBDD6BBBDD60B2DA5AAAD851A3D654A9D956AADA5AACD55EAED3
        5EAED35DAED35BADD659ABD95BAEDB62B5DD5EAFDA5EB0D85EB1DA5DB0DA5EB0
        DA5AADD958ABDA57ABDB56ABD95CADD55AAAD05BABD35DADD55EAFD85EAFDA5B
        AED957ABD855ABD958ADD958AED956ACD854AAD84EA5D84DA4D94CA3D650A4D1
        55A9D259ABD654A8D653A7D757ABDA58ADDA58B1D959B0D962B5DB60B3DB60B5
        DC60B5DC5FB3DD5EB3DC58AFD95FB1D761B3D65BB0D458B1D863B7DC69BADD65
        B9DD6ABBDE68BADD6CBCDE6BBBDC6CBCDD6DBCDF6CBEDE68BDDE62B6DB6AB8DA
        6AB9DA65B7D965B7DB5FB3DA66B8DD69BBDF73C1E36EBEDF70BFDF73C0E173C2
        E273C1E36DBFE16DBEE26FBFDF71BCDC75BDDB76BFDE6FC0DD75C1E078C1E178
        C4E162B6DB60B3DA5AACD75AAED75AAED75DADD65BAAD456A9D85DB2DD61B4DE
        63B6DE63B4DC61B3DB62B6DA63B6DC67B8DC61B3DC58ADDA55ABD752A6D350A3
        D057A5D15CABD15AABD754A9DB52A6D851A2D458AAD75EB0DA65B5DB68B8DE6C
        BADF61B5DD5BAFDA5AACD95BADD55BAED45FAFD35DADD55BACD753AAD855A9D8
        50A3D559A9D860B2DA6BBADE6ABBDC6ABADF5CAEDB5DAFDA5DAFD95CAED35AAC
        D359AAD35BADD656ACD955ABD957ACDB58ABD85DB1DA5EB0DA60B1DA5DB0DA5C
        AEDA5AAEDA57ADDA54A9D755A9D657ACD555A9D350A5D24CA4D64DA6D84FA6D9
        57ABD857ACD859AEDA59ADD854ABD855ABDA66B9DE68B8DD64B5DB5AAFD95DB0
        D562B2D760B2D758AED85BB3DA5DB3D95FB5DD61B4DB61B3DA61B5DB57AFD958
        B0DA68BBDE66B8DC5FB3D867B6DB65B5D96CB9D86AB8D761B6DC6BBADF6FBEDF
        6EBDDE6BBBDF6BBADE6CBBDE67B9DD69BBDD7AC2E078C2DE76C1E16FBDDE73BF
        DE73BEDC70BCDB70BFE06EBFE16EBFDF73C2DF78C2DF75C0DF71C0E070BFDE74
        C2DF}
      Title.Font.Gradient.EndColor = 753908
      Title.Font.Gradient.MidColor = 16059031
      Title.Font.Gradient.StartColor = 14540754
      Title.Text.Strings = (
        #1043#1088#1072#1092#1080#1082' '#1080#1079#1084#1077#1088#1077#1085#1080#1081)
      Chart3DPercent = 5
      Legend.Visible = False
      View3D = False
      Zoom.Pen.Color = clBlack
      Zoom.Pen.Width = 2
      OnBeforeDrawChart = dbchtGraphBeforeDrawChart
      Align = alClient
      TabOrder = 0
      PrintMargins = (
        15
        33
        15
        33)
      object lnsrsSeries1: TLineSeries
        ColorEachPoint = True
        Depth = 0
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.DrawEvery = 26
        Marks.Visible = False
        DataSource = qrGraph
        ShowInLegend = False
        ClickableLine = False
        LinePen.Width = 3
        LinePen.SmallSpace = 1
        Pointer.HorizSize = 12
        Pointer.InflateMargins = True
        Pointer.Pen.Visible = False
        Pointer.Style = psCircle
        Pointer.VertSize = 7
        Pointer.Visible = True
        XValues.DateTime = True
        XValues.Name = 'X'
        XValues.Order = loAscending
        XValues.ValueSource = 'MeasDT'
        YValues.Name = 'Y'
        YValues.Order = loNone
        YValues.ValueSource = 'Value'
      end
      object hrzbrsrsSeries1: THorizBarSeries
        Active = False
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = False
        BarWidthPercent = 100
        Dark3D = False
        Gradient.Direction = gdLeftRight
        MultiBar = mbSideAll
        Shadow.Color = 8487297
        SideMargins = False
        XValues.Name = #1041#1088#1091#1089#1086#1082
        XValues.Order = loNone
        YValues.Name = 'Y'
        YValues.Order = loAscending
        Data = {
          030400000000000000000000000000000000002E4000000020000000000000F0
          3F0000000000005940FFFF800000000000000000400000000000005940FF80C0
          0000000000000000000000000000000840FFFFFF1F}
      end
    end
    object pnlToolGraph: TPanel
      Left = 0
      Top = 0
      Width = 1184
      Height = 35
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      OnEnter = pnlToolGraphEnter
      OnExit = pnlToolGraphExit
      object rb1: TRadioButton
        Left = 8
        Top = 6
        Width = 129
        Height = 17
        Caption = #1055#1088#1077#1076#1099#1076#1091#1097#1080#1077' '#1095#1072#1089#1099
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object btnApplyGraph: TBitBtn
        Left = 192
        Top = 6
        Width = 75
        Height = 25
        Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100
        TabOrder = 2
        OnClick = btnApplyGraphClick
      end
      object edtHour: TEdit
        Left = 143
        Top = 6
        Width = 40
        Height = 24
        MaxLength = 2
        TabOrder = 1
        Text = '24'
        OnChange = edtHourChange
      end
    end
  end
  object qrTable: TMSStoredProc
    StoredProcName = 'getLastListByDate'
    Connection = dm.msCon1
    SQL.Strings = (
      '{:RETURN_VALUE = CALL getLastListByDate (:LastDate)}')
    Options.TrimVarChar = True
    Left = 224
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftDateTime
        Name = 'LastDate'
        ParamType = ptInput
        Value = 41775d
      end>
    CommandStoredProcName = 'getLastListByDate'
  end
  object dsTable: TMSDataSource
    AutoEdit = False
    DataSet = qrTable
    OnDataChange = dsTableDataChange
    Left = 264
    Top = 72
  end
  object actlstMain: TActionList
    Images = dm.imgChmz
    Left = 48
    Top = 48
    object actExit: TAction
      Caption = #1042#1099#1093#1086#1076
      Hint = #1042#1099#1093#1086#1076' '#1080#1079' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
      ImageIndex = 4
      ShortCut = 32856
      OnExecute = actExitExecute
    end
    object actRefresh: TAction
      Caption = #1054#1073#1085#1086#1074#1080#1090#1100
      Hint = #1054#1073#1085#1086#1074#1080#1090#1100' '#1076#1072#1085#1085#1099#1077
      ShortCut = 116
      OnExecute = actRefreshExecute
    end
  end
  object dsGraph: TMSDataSource
    AutoEdit = False
    DataSet = qrGraph
    Left = 384
    Top = 316
  end
  object qrGraph: TMSStoredProc
    StoredProcName = 'getParamByPeriod'
    Connection = dm.msCon1
    SQL.Strings = (
      
        '{:RETURN_VALUE = CALL getParamByPeriod (:FacilityCode, :FirstDat' +
        'e, :LastDate)}')
    Options.TrimVarChar = True
    Left = 352
    Top = 316
    ParamData = <
      item
        DataType = ftInteger
        Name = 'RETURN_VALUE'
        ParamType = ptResult
        Value = 0
      end
      item
        DataType = ftString
        Name = 'FacilityCode'
        ParamType = ptInput
        Size = 10
        Value = 'B16'
      end
      item
        DataType = ftDateTime
        Name = 'FirstDate'
        ParamType = ptInput
        Value = 41773d
      end
      item
        DataType = ftDateTime
        Name = 'LastDate'
        ParamType = ptInput
        Value = 41779d
      end>
    CommandStoredProcName = 'getParamByPeriod'
  end
  object tmrRefresh: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = tmrRefreshTimer
    Left = 464
    Top = 144
  end
end
