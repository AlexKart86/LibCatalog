object frmMain: TfrmMain
  Left = 229
  Top = 315
  Caption = #1040#1057' "'#1041#1110#1073#1083#1110#1086#1090#1077#1082#1072'"'
  ClientHeight = 405
  ClientWidth = 650
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = memMain
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object tlbMain: TToolBar
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 644
    Height = 72
    BorderWidth = 1
    ButtonHeight = 68
    ButtonWidth = 97
    Caption = 'tlbMain'
    DoubleBuffered = False
    DrawingStyle = dsGradient
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = False
    Images = dmMain.ilMain_48
    ParentDoubleBuffered = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = acConnect
    end
    object ToolButton2: TToolButton
      Left = 97
      Top = 0
      Action = acDisconnect
    end
    object ToolButton3: TToolButton
      Left = 194
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 202
      Top = 0
      Action = acBookList
    end
    object ToolButton5: TToolButton
      Left = 299
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 307
      Top = 0
      Action = acDictAutors
    end
    object ToolButton7: TToolButton
      Left = 404
      Top = 0
      Action = acDictProduct
    end
    object ToolButton8: TToolButton
      Left = 501
      Top = 0
      Action = acDictDelReason
    end
  end
  object sbMain: TStatusBar
    Left = 0
    Top = 386
    Width = 650
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object memMain: TMainMenu
    Images = dmMain.ilMain_32
    Left = 232
    Top = 88
    object N1: TMenuItem
      Caption = #1041#1072#1079#1072' '#1076#1072#1085#1080#1093
      object N2: TMenuItem
        Action = acConnect
      end
      object N3: TMenuItem
        Action = acDisconnect
      end
      object N4: TMenuItem
        Caption = #1042#1080#1093#1110#1076
        OnClick = N4Click
      end
    end
    object N5: TMenuItem
      Caption = #1052#1086#1076#1091#1083#1110
      object N7: TMenuItem
        Action = acBookList
      end
    end
    object N10: TMenuItem
      Caption = #1047#1074#1110#1090#1080
      object Excel1: TMenuItem
        Caption = #1087#1086#1074#1085#1080#1081' '#1077#1082#1089#1087#1086#1088#1090' '#1074' Excel'
      end
    end
    object N6: TMenuItem
      Caption = #1044#1086#1074#1110#1076#1085#1080#1082#1080
      object N8: TMenuItem
        Action = acDictAutors
      end
      object N9: TMenuItem
        Action = acDictProduct
      end
    end
  end
  object acMain: TActionList
    Images = dmMain.ilMain_48
    Left = 312
    Top = 80
    object acConnect: TAction
      Caption = #1055#1110#1076#1082#1083#1102#1095#1080#1090#1080#1089#1100
      OnExecute = acConnectExecute
    end
    object acDisconnect: TAction
      Caption = #1042#1110#1076#1082#1083#1102#1095#1080#1090#1080#1089#1100
      OnExecute = acDisconnectExecute
    end
    object acPreference: TAction
      Caption = #1053#1072#1083#1072#1096#1090#1091#1074#1072#1085#1085#1103
    end
    object acDictAutors: TAction
      Caption = #1040#1074#1090#1086#1088#1080
      OnExecute = acDictAutorsExecute
    end
    object acDictProduct: TAction
      Caption = #1042#1080#1076#1072#1074#1085#1080#1094#1090#1074#1072
      OnExecute = acDictProductExecute
    end
    object acBookList: TAction
      Caption = #1050#1072#1090#1072#1083#1086#1075' '#1082#1085#1080#1075
      OnExecute = acBookListExecute
    end
    object acDictDelReason: TAction
      Caption = #1055#1110#1076#1089#1090#1072#1074#1080' '#1074#1080#1073#1091#1090#1090#1103
      OnExecute = acDictDelReasonExecute
    end
  end
end
