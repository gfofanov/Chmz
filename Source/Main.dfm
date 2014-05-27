object frmMain: TfrmMain
  Left = 232
  Top = 208
  Caption = #1042#1080#1079#1091#1072#1083#1080#1079#1072#1094#1080#1103' '#1080#1079#1084#1077#1088#1077#1085#1080#1081'. '#1054#1090#1076#1077#1083#1077#1085#1080#1077' 2'
  ClientHeight = 726
  ClientWidth = 1234
  Color = clBtnFace
  ParentFont = True
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object spl1: TSplitter
    Left = 0
    Top = 337
    Width = 1234
    Height = 6
    Cursor = crVSplit
    Align = alTop
    Beveled = True
  end
  object pnlTable1: TPanel
    Left = 0
    Top = 0
    Width = 1234
    Height = 337
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object dbgrdhTable: TDBGridEh
      Left = 0
      Top = 29
      Width = 1234
      Height = 308
      Align = alClient
      AllowedOperations = []
      AllowedSelections = [gstRecordBookmarks]
      ColumnDefValues.Title.TitleButton = True
      ColumnDefValues.Title.ToolTips = True
      ColumnDefValues.ToolTips = True
      DataGrouping.GroupLevels = <>
      DataSource = dsTable
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -13
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      IndicatorOptions = [gioShowRowIndicatorEh]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghIncSearch, dghPreferIncSearch, dghDblClickOptimizeColWidth, dghColumnResize, dghColumnMove]
      ParentFont = False
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
        end
        item
          EditButtons = <>
          FieldName = 'ParamName'
          Footers = <>
          Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1072
          Width = 281
        end
        item
          EditButtons = <>
          FieldName = 'Value'
          Footers = <>
          Title.Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
          Width = 139
        end
        item
          EditButtons = <>
          FieldName = 'UnitName'
          Footers = <>
          Title.Caption = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
          Width = 131
        end
        item
          EditButtons = <>
          FieldName = 'MeasDT'
          Footers = <>
          Title.Caption = #1044#1072#1090#1072'-'#1074#1088#1077#1084#1103' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
          Width = 182
        end
        item
          EditButtons = <>
          FieldName = 'Color'
          Footers = <>
          Title.Caption = #1062#1074#1077#1090' '#1088#1072#1089#1082#1088#1072#1089#1082#1080
          Visible = False
          Width = 108
        end>
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
    object tlb1: TToolBar
      Left = 0
      Top = 0
      Width = 1234
      Height = 29
      Caption = 'tlb1'
      Images = dm.imgChmz
      TabOrder = 1
      object btn1: TToolButton
        Left = 0
        Top = 0
        Width = 8
        Caption = 'btn1'
        ImageIndex = 1
        Style = tbsSeparator
      end
      object btnExit: TToolButton
        Left = 8
        Top = 0
        Action = actExit
      end
    end
  end
  object pnlGraph: TPanel
    Left = 0
    Top = 343
    Width = 1234
    Height = 383
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
  end
  object mstrdprcTable: TMSStoredProc
    StoredProcName = 'getLastListByDate'
    Connection = dm.msCon1
    SQL.Strings = (
      '{:RETURN_VALUE = CALL getLastListByDate (:LastDate)}')
    Active = True
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
    DataSet = mstrdprcTable
    Left = 264
    Top = 72
  end
  object msqry1: TMSQuery
    Connection = dm.msCon1
    Left = 160
    Top = 280
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
  end
end
