inherited frmAutorAnketa: TfrmAutorAnketa
  Caption = #1040#1085#1082#1077#1090#1072' '#1072#1074#1090#1086#1088#1072
  ClientHeight = 536
  ClientWidth = 644
  ExplicitWidth = 652
  ExplicitHeight = 570
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 183
    Top = 13
    Width = 92
    Height = 13
    Caption = #1044#1072#1090#1072' '#1085#1072#1088#1086#1076#1078#1077#1085#1085#1103
  end
  object Label2: TLabel [1]
    Left = 183
    Top = 53
    Width = 60
    Height = 13
    Caption = #1044#1072#1090#1072' '#1089#1084#1077#1088#1090#1110
  end
  object Label3: TLabel [2]
    Left = 8
    Top = 192
    Width = 53
    Height = 13
    Caption = #1055#1088#1110#1079#1074#1080#1097#1077'*'
  end
  object Label4: TLabel [3]
    Left = 8
    Top = 224
    Width = 24
    Height = 13
    Caption = #1030#1084#39#1103'*'
  end
  object Label5: TLabel [4]
    Left = 8
    Top = 256
    Width = 61
    Height = 13
    Caption = #1055#1086'-'#1073#1072#1090#1100#1082#1086#1074#1110
  end
  object Label6: TLabel [5]
    Left = 8
    Top = 288
    Width = 102
    Height = 13
    Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1110' '#1074#1110#1076#1086#1084#1086#1089#1090#1110
  end
  inherited pnlFooter: TPanel
    Top = 501
    Width = 644
    TabOrder = 8
    ExplicitTop = 501
    ExplicitWidth = 644
    DesignSize = (
      644
      35)
    inherited bbtnSave: TBitBtn
      Left = 380
      ExplicitLeft = 380
    end
    inherited bbtnCancel: TBitBtn
      Left = 515
      ExplicitLeft = 515
    end
  end
  object pnlPhoto: TPanel [7]
    Left = 8
    Top = 8
    Width = 145
    Height = 161
    BevelKind = bkFlat
    BevelOuter = bvNone
    Caption = '('#1073#1077#1079' '#1092#1086#1090#1086')'
    TabOrder = 7
    object dbiPhoto: TJvDBImage
      Left = 0
      Top = 0
      Width = 141
      Height = 157
      Align = alClient
      DataField = 'PHOTO'
      DataSource = dsMain
      PopupMenu = pmPhoto
      Proportional = True
      Stretch = True
      TabOrder = 0
      OnDblClick = dbiPhotoDblClick
      Transparent = True
    end
  end
  object dbdtDateBirth: TDBDateTimeEditEh [8]
    Left = 289
    Top = 10
    Width = 161
    Height = 21
    DataField = 'DATE_OF_BIRTH'
    DataSource = dsMain
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 0
    Visible = True
  end
  object dbdtDateDeath: TDBDateTimeEditEh [9]
    Left = 289
    Top = 50
    Width = 161
    Height = 21
    DataField = 'DATE_OF_DEATH'
    DataSource = dsMain
    EditButtons = <>
    Kind = dtkDateEh
    TabOrder = 1
    Visible = True
  end
  object dbdeLastName: TDBEditEh [10]
    Left = 107
    Top = 189
    Width = 529
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'LAST_NAME'
    DataSource = dsMain
    EditButtons = <>
    HighlightRequired = True
    TabOrder = 3
    Visible = True
  end
  object dbeFirstName: TDBEditEh [11]
    Left = 107
    Top = 221
    Width = 529
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'FIRST_NAME'
    DataSource = dsMain
    EditButtons = <>
    HighlightRequired = True
    TabOrder = 4
    Visible = True
  end
  object dbeMiddleName: TDBEditEh [12]
    Left = 107
    Top = 253
    Width = 529
    Height = 21
    Anchors = [akLeft, akTop, akRight]
    DataField = 'MIDDLE_NAME'
    DataSource = dsMain
    EditButtons = <>
    HighlightRequired = True
    TabOrder = 5
    Visible = True
  end
  object dbeComments: TDBEditEh [13]
    Left = 8
    Top = 307
    Width = 628
    Height = 173
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    DataField = 'COMMENTS'
    DataSource = dsMain
    EditButtons = <>
    TabOrder = 6
    Visible = True
  end
  object dbrBookType: TDBRadioGroup [14]
    Left = 183
    Top = 77
    Width = 267
    Height = 92
    Caption = #1057#1092#1077#1088#1072' '#1076#1110#1103#1083#1100#1085#1086#1089#1090#1110
    DataField = 'BOOK_TYPE_ID'
    DataSource = dsMain
    Items.Strings = (
      #1047#1072#1075#1072#1083#1100#1085#1072' '#1083#1110#1090#1077#1088#1072#1090#1091#1088#1072
      #1040#1074#1090#1086#1088' '#1087#1110#1076#1088#1091#1095#1085#1080#1082#1110#1074)
    ParentBackground = True
    TabOrder = 2
    Values.Strings = (
      '1'
      '2')
  end
  inherited ibdMain: TIBDataSet
    AfterInsert = ibdMainAfterInsert
    AfterOpen = ibdMainAfterOpen
    DeleteSQL.Strings = (
      'delete from DICT_AUTOR'
      'where'
      '  AUTOR_ID = :AUTOR_ID')
    InsertSQL.Strings = (
      'insert into DICT_AUTOR'
      
        '  (autor_id, BOOK_TYPE_ID, COMMENTS, DATE_OF_BIRTH, DATE_OF_DEAT' +
        'H, FIRST_NAME, LAST_NAME, '
      '   MIDDLE_NAME, PHOTO)'
      'values'
      
        '  (:autor_id, :BOOK_TYPE_ID, :COMMENTS, :DATE_OF_BIRTH, :DATE_OF' +
        '_DEATH, :FIRST_NAME, '
      '   :LAST_NAME, :MIDDLE_NAME, :PHOTO)')
    SelectSQL.Strings = (
      'select * from DICT_AUTOR'
      'where autor_id = :autor_id')
    ModifySQL.Strings = (
      'update DICT_AUTOR'
      'set'
      '  BOOK_TYPE_ID = :BOOK_TYPE_ID,'
      '  COMMENTS = :COMMENTS,'
      '  DATE_OF_BIRTH = :DATE_OF_BIRTH,'
      '  DATE_OF_DEATH = :DATE_OF_DEATH,'
      '  FIRST_NAME = :FIRST_NAME,'
      '  LAST_NAME = :LAST_NAME,'
      '  MIDDLE_NAME = :MIDDLE_NAME,'
      '  PHOTO = :PHOTO'
      'where'
      '  AUTOR_ID = :AUTOR_ID')
    Left = 408
    Top = 138
    object ibdMainAUTOR_ID: TIntegerField
      FieldName = 'AUTOR_ID'
      Origin = '"DICT_AUTOR"."AUTOR_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ibdMainFIRST_NAME: TIBStringField
      DisplayLabel = #1030#1084#39#1103
      FieldName = 'FIRST_NAME'
      Origin = '"DICT_AUTOR"."FIRST_NAME"'
      Required = True
      Size = 80
    end
    object ibdMainLAST_NAME: TIBStringField
      DisplayLabel = #1055#1088#1110#1079#1074#1080#1097#1077
      FieldName = 'LAST_NAME'
      Origin = '"DICT_AUTOR"."LAST_NAME"'
      Required = True
      Size = 80
    end
    object ibdMainMIDDLE_NAME: TIBStringField
      FieldName = 'MIDDLE_NAME'
      Origin = '"DICT_AUTOR"."MIDDLE_NAME"'
      Size = 80
    end
    object ibdMainDATE_OF_BIRTH: TDateField
      FieldName = 'DATE_OF_BIRTH'
      Origin = '"DICT_AUTOR"."DATE_OF_BIRTH"'
    end
    object ibdMainDATE_OF_DEATH: TDateField
      FieldName = 'DATE_OF_DEATH'
      Origin = '"DICT_AUTOR"."DATE_OF_DEATH"'
    end
    object ibdMainPHOTO: TBlobField
      FieldName = 'PHOTO'
      Origin = '"DICT_AUTOR"."PHOTO"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object ibdMainBOOK_TYPE_ID: TIntegerField
      FieldName = 'BOOK_TYPE_ID'
      Origin = '"DICT_AUTOR"."BOOK_TYPE_ID"'
    end
    object ibdMainCOMMENTS: TIBStringField
      FieldName = 'COMMENTS'
      Origin = '"DICT_AUTOR"."COMMENTS"'
      Size = 2000
    end
  end
  object openDlg: TOpenPictureDialog
    FileName = 
      'C:\Documents and Settings\alex\'#1056#1072#1073#1086#1095#1080#1081' '#1089#1090#1086#1083'\'#1043#1088#1072#1092#1080#1082' '#1074' '#1084#1072#1090#1087#1072#1082#1077#1090#1077'.J' +
      'PG'
    Options = [ofHideReadOnly, ofNoValidate, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 480
    Top = 112
  end
  object pmPhoto: TPopupMenu
    Left = 552
    Top = 120
    object pmLoad: TMenuItem
      Caption = #1047#1072#1074#1072#1085#1090#1072#1078#1080#1090#1080' '#1079' '#1092#1072#1081#1083#1091
      OnClick = pmLoadClick
    end
    object pmSaveToFile: TMenuItem
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1074' '#1092#1072#1081#1083
      OnClick = pmSaveToFileClick
    end
    object pmDelete: TMenuItem
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnClick = pmDeleteClick
    end
  end
  object dlgSave: TSavePictureDialog
    Left = 536
    Top = 24
  end
end
