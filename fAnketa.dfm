inherited frmAnketa: TfrmAnketa
  Caption = #1060#1086#1088#1084#1072'-'#1085#1072#1097#1072#1076#1086#1082' '#1076#1083#1103' '#1072#1085#1082#1077#1090
  ClientHeight = 394
  ClientWidth = 561
  OnCloseQuery = FormCloseQuery
  ExplicitWidth = 569
  ExplicitHeight = 428
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFooter: TPanel
    Left = 0
    Top = 359
    Width = 561
    Height = 35
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 344
    ExplicitWidth = 554
    DesignSize = (
      561
      35)
    object bbtnSave: TBitBtn
      Left = 312
      Top = 4
      Width = 105
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080
      DoubleBuffered = True
      Kind = bkOK
      ParentDoubleBuffered = False
      TabOrder = 0
      OnClick = bbtnSaveClick
      ExplicitLeft = 305
    end
    object bbtnCancel: TBitBtn
      Left = 447
      Top = 4
      Width = 105
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
      DoubleBuffered = True
      Kind = bkCancel
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = bbtnCancelClick
      ExplicitLeft = 440
    end
  end
  object ibdMain: TIBDataSet
    Database = dmMain.dbMain
    Transaction = dmMain.ibtMain
    Left = 392
    Top = 136
  end
  object dsMain: TDataSource
    DataSet = ibdMain
    Left = 344
    Top = 224
  end
end
