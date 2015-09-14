object frmLogin: TfrmLogin
  Left = 437
  Top = 425
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = #1040#1074#1090#1086#1088#1080#1079#1072#1094#1110#1103
  ClientHeight = 181
  ClientWidth = 295
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object lblLogin: TLabel
    Left = 8
    Top = 16
    Width = 31
    Height = 16
    Caption = #1051#1086#1075#1110#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 53
    Width = 43
    Height = 16
    Caption = #1055#1072#1088#1086#1083#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lblDB: TLabel
    Left = 8
    Top = 90
    Width = 28
    Height = 16
    Caption = #1041#1072#1079#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtLogin: TEdit
    Left = 72
    Top = 12
    Width = 209
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'admin'
  end
  object edtPass: TEdit
    Left = 72
    Top = 49
    Width = 209
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 1
    Text = '1'
  end
  object btnOk: TButton
    Left = 56
    Top = 136
    Width = 75
    Height = 25
    Caption = #1042#1093#1110#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = btnOkClick
  end
  object btnCancel: TButton
    Left = 168
    Top = 136
    Width = 75
    Height = 25
    Caption = #1042#1110#1076#1084#1110#1085#1080#1090#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ModalResult = 2
    ParentFont = False
    TabOrder = 4
    OnClick = btnCancelClick
  end
  object dbeDatabase: TDBEditEh
    Left = 72
    Top = 88
    Width = 210
    Height = 24
    EditButtons = <
      item
        Style = ebsEllipsisEh
        OnClick = dbeDatabaseEditButtons0Click
      end>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    Text = 'LIB.fdb'
    Visible = True
  end
  object dlgOpen: TOpenDialog
    Filter = 'FDB '#1060#1072#1081#1083#1099' (firebird database)'
    Title = #1054#1073#1077#1088#1110#1090#1100' '#1073#1072#1079#1091' '#1076#1072#1085#1080#1093' '#1076#1083#1103' '#1087#1110#1076#1082#1083#1102#1095#1077#1085#1085#1103
    Left = 256
    Top = 128
  end
end
