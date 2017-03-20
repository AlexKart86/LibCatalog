inherited frmBookList: TfrmBookList
  Caption = #1050#1072#1090#1072#1083#1086#1075' '#1082#1085#1080#1075
  ClientHeight = 547
  ClientWidth = 718
  Position = poDesigned
  OnShow = FormShow
  ExplicitWidth = 734
  ExplicitHeight = 585
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter [0]
    Left = 173
    Top = 52
    Width = 4
    Height = 440
    Color = clBlue
    ParentColor = False
    ExplicitLeft = 121
    ExplicitHeight = 316
  end
  inherited pnlFooter: TPanel
    Top = 492
    Width = 718
    ExplicitTop = 492
    ExplicitWidth = 718
  end
  inherited tlbMain: TToolBar
    Width = 718
    ExplicitWidth = 718
    object ToolButton6: TToolButton
      Left = 335
      Top = 0
      Action = actReport
    end
  end
  inherited pnlMain: TPanel
    Left = 177
    Width = 541
    Height = 440
    ExplicitLeft = 177
    ExplicitWidth = 541
    ExplicitHeight = 440
    inherited dbgMain: TDBGridEh
      Width = 539
      Height = 438
      TabStop = False
      AllowedOperations = []
      AutoFitColWidths = True
      FooterRowCount = 1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      SumList.Active = True
      OnDblClick = dbgMainDblClick
      Columns = <
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'AUTOR'
          Footers = <>
          Width = 110
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'BOOK_NAME'
          Footer.FieldName = 'BOOK_ID'
          Footer.ValueType = fvtCount
          Footers = <>
          Width = 240
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'RELEASE_YEAR'
          Footers = <>
          Width = 88
        end
        item
          DynProps = <>
          EditButtons = <>
          FieldName = 'CL_NAME'
          Footers = <>
          Width = 76
        end>
    end
  end
  object tvFilter: TTreeView [4]
    Left = 0
    Top = 52
    Width = 173
    Height = 440
    Align = alLeft
    Indent = 19
    TabOrder = 3
    OnChange = tvFilterChange
    Items.NodeData = {
      03010000002E0000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      00020000000108170430042000420438043F043E043C04440000000000000000
      00000001000000FFFFFFFF000000000000000000000000011317043004330430
      043B044C043D04300420003B0456044204350440043004420443044004300432
      000000000000000000000002000000FFFFFFFF00000000000000000000000001
      0A1F04560434044004430447043D0438043A043804}
  end
  inherited ibdMain: TIBDataSet
    ForcedRefresh = True
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from BOOKS'
      'where'
      '  BOOK_ID = :BOOK_ID')
    InsertSQL.Strings = (
      '')
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'select B.BOOK_NAME, book_id,'
      
        '       DA.LAST_NAME || coalesce('#39' '#39'||substring(DA.FIRST_NAME fro' +
        'm 1 for 1)||'#39'.'#39', '#39#39') ||'
      
        '          coalesce( '#39' '#39'||substring(DA.MIDDLE_NAME from 1 for 1)|' +
        '|'#39'.'#39', '#39#39') as autor,'
      '       B.RELEASE_YEAR,'
      '       coalesce(b.class||'#39' '#1082#1083#1072#1089#39', '#39#39') as cl_name'
      'from BOOKS B'
      'left join DICT_AUTOR DA on (B.AUTOR_ID = DA.AUTOR_ID)'
      'where (B.BOOK_TYPE_ID = :BOOK_TYPE_ID or :BOOK_TYPE_ID = -1) and'
      '    (b.class = :CLASS_ID or :CLASS_ID = -1)'
      'order by release_year')
    object ibdMainBOOK_NAME: TIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072' '#1082#1085#1080#1075#1080
      FieldName = 'BOOK_NAME'
      Origin = '"BOOKS"."BOOK_NAME"'
      Required = True
      Size = 80
    end
    object ibdMainAUTOR: TIBStringField
      DisplayLabel = #1040#1074#1090#1086#1088
      FieldName = 'AUTOR'
      ProviderFlags = []
      Size = 241
    end
    object ibdMainRELEASE_YEAR: TIntegerField
      DisplayLabel = #1056#1110#1082' '#1074#1080#1076#1072#1085#1085#1103
      FieldName = 'RELEASE_YEAR'
      Origin = '"BOOKS"."RELEASE_YEAR"'
    end
    object ibdMainBOOK_ID: TIntegerField
      FieldName = 'BOOK_ID'
      Origin = '"BOOKS"."BOOK_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ibdMainCL_NAME: TIBStringField
      DisplayLabel = #1050#1083#1072#1089
      FieldName = 'CL_NAME'
      ProviderFlags = []
      Size = 16
    end
  end
  inherited alMain: TActionList
    inherited acEdit: TAction
      OnExecute = acEditExecute
    end
    object actReport: TAction
      Caption = #1054#1090#1095#1077#1090
      OnExecute = actReportExecute
    end
  end
  object ibqClasses: TIBQuery
    Database = dmMain.dbMain
    Transaction = dmMain.ibtMain
    SQL.Strings = (
      'select distinct b.class || '#39' '#1082#1083#1072#1089#39' as cl_name,'
      '        b.class as cl_id'
      'from books b'
      'where b.class is not null'
      'order by b.class')
    Left = 272
    Top = 232
    object ibqClassesCL_NAME: TIBStringField
      FieldName = 'CL_NAME'
      ProviderFlags = []
      Size = 16
    end
    object ibqClassesCL_ID: TIntegerField
      FieldName = 'CL_ID'
      Origin = '"BOOKS"."CLASS"'
    end
  end
  object frxReport1: TfrxReport
    Version = '5.2.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40818.922330000000000000
    ReportOptions.LastChange = 42261.980053194440000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 240
    Top = 368
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Orientation = poLandscape
      PaperWidth = 297.000000000000000000
      PaperHeight = 210.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        Height = 86.929190000000000000
        Top = 18.897650000000000000
        Width = 1046.929810000000000000
        object Memo1: TfrxMemoView
          Left = 22.677180000000000000
          Width = 275.905690000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #1060#1086#1085#1076#1099' '#1091#1095#1077#1073#1085#1080#1082#1086#1074' '#1087#1086' '#1089#1086#1089#1090#1086#1103#1085#1080#1102' '#1085#1072' '#1076#1072#1090#1091':')
        end
        object Date: TfrxMemoView
          Left = 381.732530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            '[Date]')
        end
        object Memo2: TfrxMemoView
          Left = 3.779530000000000000
          Top = 68.031540000000010000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #1053#1072#1079#1074#1072)
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          Left = 204.094620000000000000
          Top = 68.031540000000010000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #1040#1074#1090#1086#1088)
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 393.071120000000000000
          Top = 68.031540000000010000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #1056#1110#1082' '#1074#1080#1076#1072#1085#1085#1103)
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 502.677490000000000000
          Top = 68.031540000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            #1058#1080#1088#1072#1078)
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 566.929500000000000000
          Top = 68.031540000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            #1042#1072#1088#1090#1110#1089#1090#1100)
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 502.677490000000000000
          Top = 41.574830000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #1047#1072#1088#1077#1108#1089#1090#1088#1086#1074#1072#1085#1086)
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 650.079160000000000000
          Top = 68.031540000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            #1045#1082#1079'.')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 714.331170000000000000
          Top = 68.031540000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            #1042#1072#1088#1090#1110#1089#1090#1100)
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 650.079160000000000000
          Top = 41.574830000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #1057#1087#1080#1089#1072#1085#1086)
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 801.260360000000000000
          Top = 68.031540000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            #1045#1082#1079'.')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 865.512370000000000000
          Top = 68.031540000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            #1042#1072#1088#1090#1110#1089#1090#1100)
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 801.260360000000000000
          Top = 41.574830000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8W = (
            #1047#1072#1083#1080#1096#1086#1082)
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        Height = 41.574830000000000000
        Top = 336.378170000000000000
        Width = 1046.929810000000000000
        object Memo8: TfrxMemoView
          Left = 502.677490000000000000
          Top = 11.338590000000000000
          Width = 49.133858270000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."COPY_CNT">,MasterData1)]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 340.157700000000000000
          Top = 11.338590000000010000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          Memo.UTF8W = (
            #1042#1089#1100#1086#1075#1086' '#1087#1088#1080#1084#1110#1088#1085#1080#1082#1110#1074)
        end
        object Memo11: TfrxMemoView
          Left = 570.709030000000000000
          Top = 11.338590000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."TOTAL_PRICE">,MasterData1)]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 653.858690000000000000
          Top = 11.338590000000000000
          Width = 49.133858270000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."CNT_DELETE">,MasterData1)]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          Left = 721.890230000000000000
          Top = 11.338590000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."PRICE_DELETE">,MasterData1)]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 801.260360000000000000
          Top = 11.338590000000000000
          Width = 49.133858270000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."CNT_REMAIN">,MasterData1)]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          Left = 869.291900000000000000
          Top = 11.338590000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsUnderline]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."PRICE_REMAIN">,MasterData1)]')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 18.897650000000000000
        Top = 211.653680000000000000
        Width = 1046.929810000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1BOOK_NAME: TfrxMemoView
          Left = 3.779530000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          DataField = 'BOOK_NAME'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."BOOK_NAME"]')
        end
        object frxDBDataset1AUTORS: TfrxMemoView
          Left = 204.094620000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          DataField = 'AUTORS'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."AUTORS"]')
        end
        object frxDBDataset1ISBN: TfrxMemoView
          Left = 393.071120000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'RELEASE_YEAR'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."RELEASE_YEAR"]')
        end
        object frxDBDataset1COPY_CNT: TfrxMemoView
          Left = 502.677490000000000000
          Width = 49.133858270000000000
          Height = 18.897650000000000000
          DataField = 'COPY_CNT'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."COPY_CNT"]')
          ParentFont = False
        end
        object frxDBDataset1TOTAL_PRICE: TfrxMemoView
          Left = 566.929500000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_PRICE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."TOTAL_PRICE"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 650.079160000000000000
          Width = 49.133858270000000000
          Height = 18.897650000000000000
          DataField = 'CNT_DELETE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."CNT_DELETE"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          Left = 714.331170000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DataField = 'PRICE_DELETE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."PRICE_DELETE"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 801.260360000000000000
          Width = 49.133858270000000000
          Height = 18.897650000000000000
          DataField = 'CNT_REMAIN'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."CNT_REMAIN"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          Left = 865.512370000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DataField = 'PRICE_REMAIN'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."PRICE_REMAIN"]')
          ParentFont = False
        end
      end
      object GroupHeader1: TfrxGroupHeader
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 166.299320000000000000
        Width = 1046.929810000000000000
        Condition = 'frxDBDataset1."CLASS"'
        StartNewPage = True
        object frxDBDataset1CLASS: TfrxMemoView
          Left = 113.385900000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'CLASS'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            '[frxDBDataset1."CLASS"]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          Left = 207.874150000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #1082#1083#1072#1089)
          ParentFont = False
        end
      end
      object GroupFooter1: TfrxGroupFooter
        FillType = ftBrush
        Height = 22.677180000000000000
        Top = 253.228510000000000000
        Width = 1046.929810000000000000
        object SysMemo1: TfrxSysMemoView
          Left = 502.677490000000000000
          Width = 49.133858270000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."COPY_CNT">,MasterData1)]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 340.157700000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            #1042#1089#1100#1086#1075#1086' '#1087#1086' '#1082#1083#1072#1089#1091)
          ParentFont = False
        end
        object SysMemo2: TfrxSysMemoView
          Left = 566.929500000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."TOTAL_PRICE">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo3: TfrxSysMemoView
          Left = 650.079160000000000000
          Width = 49.133858270000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."CNT_DELETE">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo4: TfrxSysMemoView
          Left = 714.331170000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."PRICE_DELETE">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo5: TfrxSysMemoView
          Left = 801.260360000000000000
          Width = 49.133858270000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."CNT_REMAIN">,MasterData1)]')
          ParentFont = False
        end
        object SysMemo6: TfrxSysMemoView
          Left = 865.512370000000000000
          Width = 68.031496060000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."PRICE_REMAIN">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'BOOK_ID=BOOK_ID'
      'BOOK_NAME=BOOK_NAME'
      'RELEASE_YEAR=RELEASE_YEAR'
      'PAGES=PAGES'
      'PART=PART'
      'PRODUCER_ID=PRODUCER_ID'
      'CLASS=CLASS'
      'ISBN=ISBN'
      'UDK=UDK'
      'BBK=BBK'
      'AUTOR_ID=AUTOR_ID'
      'BOOK_TYPE_ID=BOOK_TYPE_ID'
      'COMMENTS=COMMENTS'
      'PROC_NUM=PROC_NUM'
      'IMAGES_CNT=IMAGES_CNT'
      'COPY_CNT=COPY_CNT'
      'AUTORS=AUTORS'
      'PRODUCER_NAME=PRODUCER_NAME'
      'TOTAL_PRICE=TOTAL_PRICE'
      'PHOTO=PHOTO'
      'PRICE_DELETE=PRICE_DELETE'
      'CNT_DELETE=CNT_DELETE'
      'PRICE_REMAIN=PRICE_REMAIN'
      'CNT_REMAIN=CNT_REMAIN')
    DataSet = ibqReport
    BCDToCurrency = False
    Left = 296
    Top = 344
  end
  object frxIBXComponents1: TfrxIBXComponents
    DefaultDatabase = dmMain.dbMain
    Left = 288
    Top = 416
  end
  object exp: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    ExportEMF = True
    OpenExcelAfterExport = True
    AsText = False
    Background = True
    FastExport = True
    PageBreaks = True
    EmptyLines = True
    SuppressPageHeadersFooters = False
    Left = 368
    Top = 384
  end
  object ibqReport: TIBQuery
    Database = dmMain.dbMain
    Transaction = dmMain.ibtMain
    SQL.Strings = (
      '      select B.*,'
      
        '       coalesce(DA.LAST_NAME, '#39#39') || coalesce('#39' '#39' || DA.FIRST_NA' +
        'ME, '#39#39') || coalesce('#39' '#39' || DA.MIDDLE_NAME, '#39#39') as AUTORS,'
      '       dp.producer_name,'
      '       (select sum(bt.cnt*bt.price)'
      '        from book_trans bt'
      '        where bt.book_id = b.book_id) total_price,'
      '       (select sum(bt.cnt*bt.price)'
      '        from book_trans bt'
      
        '        where bt.book_id = b.book_id and bt.date_delete is not n' +
        'ull) price_delete,'
      '        (select sum(bt.cnt)'
      '        from book_trans bt'
      
        '        where bt.book_id = b.book_id and bt.date_delete is not n' +
        'ull) cnt_delete,'
      '        (select sum(bt.cnt*bt.price)'
      '        from book_trans bt'
      '        where bt.book_id = b.book_id'
      '        and bt.date_delete is null) price_remain,'
      '        b.copy_cnt - coalesce( (select sum(bt.cnt)'
      '        from book_trans bt'
      '        where bt.book_id = b.book_id'
      '        and bt.date_delete is not null), 0) cnt_remain'
      ''
      'from BOOKS B'
      'left join DICT_AUTOR DA on (B.AUTOR_ID = DA.AUTOR_ID)'
      'left join DICT_PRODUCER DP on (B.PRODUCER_ID = DP.PRODUCER_ID)  '
      'where b.book_type_id = 2'
      'order by b.class, AUTORS')
    Left = 384
    Top = 232
    object ibqReportBOOK_ID: TIntegerField
      FieldName = 'BOOK_ID'
      Origin = '"BOOKS"."BOOK_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ibqReportBOOK_NAME: TIBStringField
      FieldName = 'BOOK_NAME'
      Origin = '"BOOKS"."BOOK_NAME"'
      Required = True
      Size = 80
    end
    object ibqReportRELEASE_YEAR: TIntegerField
      FieldName = 'RELEASE_YEAR'
      Origin = '"BOOKS"."RELEASE_YEAR"'
    end
    object ibqReportPAGES: TIntegerField
      FieldName = 'PAGES'
      Origin = '"BOOKS"."PAGES"'
    end
    object ibqReportPART: TIntegerField
      FieldName = 'PART'
      Origin = '"BOOKS"."PART"'
    end
    object ibqReportPRODUCER_ID: TIntegerField
      FieldName = 'PRODUCER_ID'
      Origin = '"BOOKS"."PRODUCER_ID"'
    end
    object ibqReportCLASS: TIntegerField
      FieldName = 'CLASS'
      Origin = '"BOOKS"."CLASS"'
    end
    object ibqReportISBN: TIBStringField
      FieldName = 'ISBN'
      Origin = '"BOOKS"."ISBN"'
      Size = 30
    end
    object ibqReportUDK: TIBStringField
      FieldName = 'UDK'
      Origin = '"BOOKS"."UDK"'
      Size = 30
    end
    object ibqReportBBK: TIBStringField
      FieldName = 'BBK'
      Origin = '"BOOKS"."BBK"'
      Size = 30
    end
    object ibqReportAUTOR_ID: TIntegerField
      FieldName = 'AUTOR_ID'
      Origin = '"BOOKS"."AUTOR_ID"'
      Required = True
    end
    object ibqReportBOOK_TYPE_ID: TIntegerField
      FieldName = 'BOOK_TYPE_ID'
      Origin = '"BOOKS"."BOOK_TYPE_ID"'
      Required = True
    end
    object ibqReportCOMMENTS: TIBStringField
      FieldName = 'COMMENTS'
      Origin = '"BOOKS"."COMMENTS"'
      Size = 2000
    end
    object ibqReportPROC_NUM: TIntegerField
      FieldName = 'PROC_NUM'
      Origin = '"BOOKS"."PROC_NUM"'
    end
    object ibqReportIMAGES_CNT: TIntegerField
      FieldName = 'IMAGES_CNT'
      Origin = '"BOOKS"."IMAGES_CNT"'
    end
    object ibqReportCOPY_CNT: TIntegerField
      FieldName = 'COPY_CNT'
      Origin = '"BOOKS"."COPY_CNT"'
    end
    object ibqReportAUTORS: TIBStringField
      FieldName = 'AUTORS'
      ProviderFlags = []
      Size = 242
    end
    object ibqReportPRODUCER_NAME: TIBStringField
      FieldName = 'PRODUCER_NAME'
      Origin = '"DICT_PRODUCER"."PRODUCER_NAME"'
      Size = 80
    end
    object ibqReportTOTAL_PRICE: TFloatField
      FieldName = 'TOTAL_PRICE'
      ProviderFlags = []
    end
    object ibqReportPHOTO: TBlobField
      FieldName = 'PHOTO'
      Origin = '"BOOKS"."PHOTO"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object ibqReportPRICE_DELETE: TFloatField
      FieldName = 'PRICE_DELETE'
      ProviderFlags = []
    end
    object ibqReportCNT_DELETE: TLargeintField
      FieldName = 'CNT_DELETE'
      ProviderFlags = []
    end
    object ibqReportPRICE_REMAIN: TFloatField
      FieldName = 'PRICE_REMAIN'
      ProviderFlags = []
    end
    object ibqReportCNT_REMAIN: TLargeintField
      FieldName = 'CNT_REMAIN'
      ProviderFlags = []
    end
  end
end
