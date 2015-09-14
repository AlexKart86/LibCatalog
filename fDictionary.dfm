inherited frmDictionary: TfrmDictionary
  Caption = 'frmDictionary'
  ClientHeight = 423
  ClientWidth = 605
  FormStyle = fsNormal
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  ExplicitWidth = 613
  ExplicitHeight = 457
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFooter: TPanel
    Left = 0
    Top = 368
    Width = 605
    Height = 55
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnselect: TButton
      Left = 352
      Top = 14
      Width = 97
      Height = 25
      Caption = #1054#1073#1088#1072#1090#1080
      ModalResult = 1
      TabOrder = 0
      OnClick = btnselectClick
    end
    object btnCancel: TButton
      Left = 472
      Top = 14
      Width = 102
      Height = 25
      Caption = #1055#1086#1074#1077#1088#1085#1091#1090#1080#1089#1100
      ModalResult = 2
      TabOrder = 1
    end
  end
  object tlbMain: TToolBar
    Left = 0
    Top = 0
    Width = 605
    Height = 52
    ButtonHeight = 52
    ButtonWidth = 67
    Caption = 'tlbMain'
    DrawingStyle = dsGradient
    Images = dmMain.ilMain_32
    ShowCaptions = True
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = acAdd
    end
    object ToolButton5: TToolButton
      Left = 67
      Top = 0
      Action = acEdit
    end
    object ToolButton2: TToolButton
      Left = 134
      Top = 0
      Action = acDelete
    end
    object ToolButton3: TToolButton
      Left = 201
      Top = 0
      Action = acSave
    end
    object ToolButton4: TToolButton
      Left = 268
      Top = 0
      Action = acRefresh
    end
  end
  object pnlMain: TPanel
    Left = 0
    Top = 52
    Width = 605
    Height = 316
    Align = alClient
    TabOrder = 2
    object dbgMain: TDBGridEh
      Left = 1
      Top = 1
      Width = 603
      Height = 314
      Align = alClient
      ColumnDefValues.Title.TitleButton = True
      DataGrouping.GroupLevels = <>
      DataSource = dsMain
      Flat = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'Tahoma'
      FooterFont.Style = []
      OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghAutoSortMarking, dghMultiSortMarking, dghDialogFind, dghColumnResize, dghColumnMove, dghExtendVertLines]
      ParentFont = False
      RowDetailPanel.Color = clBtnFace
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      object RowDetailData: TRowDetailPanelControlEh
      end
    end
  end
  object dsMain: TDataSource
    DataSet = ibdMain
    Left = 216
    Top = 144
  end
  object ibdMain: TIBDataSet
    Database = dmMain.dbMain
    Transaction = dmMain.ibtMain
    AfterDelete = ibdMainAfterDelete
    AfterEdit = ibdMainAfterEdit
    AfterInsert = ibdMainAfterInsert
    AfterOpen = ibdMainAfterOpen
    CachedUpdates = True
    Left = 272
    Top = 136
  end
  object alMain: TActionList
    Images = dmMain.ilMain_32
    Left = 360
    Top = 152
    object acAdd: TAction
      Caption = #1044#1086#1076#1072#1090#1080
      OnExecute = acAddExecute
    end
    object acEdit: TAction
      Caption = #1056#1077#1076#1072#1075#1091#1074#1072#1090#1080
    end
    object acDelete: TAction
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnExecute = acDeleteExecute
    end
    object acSave: TAction
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080
      OnExecute = acSaveExecute
    end
    object acRefresh: TAction
      Caption = #1054#1085#1086#1074#1080#1090#1080
      OnExecute = acRefreshExecute
    end
  end
end
