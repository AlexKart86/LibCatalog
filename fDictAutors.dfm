inherited frmDictAutors: TfrmDictAutors
  Caption = #1057#1087#1080#1089#1086#1082' '#1072#1074#1090#1086#1088#1110#1074
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    Top = 73
    Height = 295
    ExplicitTop = 73
    ExplicitHeight = 295
    inherited dbgMain: TDBGridEh
      Height = 293
      AllowedOperations = []
      OnDblClick = acEditExecute
      Columns = <
        item
          EditButtons = <>
          FieldName = 'LAST_NAME'
          Footers = <>
          Width = 231
        end
        item
          EditButtons = <>
          FieldName = 'FIRST_NAME'
          Footers = <>
          Width = 113
        end
        item
          EditButtons = <>
          FieldName = 'MIDDLE_NAME'
          Footers = <>
          Width = 140
        end>
    end
  end
  object cbAutorType: TComboBox [3]
    Left = 0
    Top = 52
    Width = 605
    Height = 21
    Align = alTop
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 3
    Text = #1047#1072#1075#1072#1083#1100#1085#1072' '#1083#1110#1090#1077#1088#1072#1090#1091#1088#1072
    OnChange = cbAutorTypeChange
    Items.Strings = (
      #1047#1072#1075#1072#1083#1100#1085#1072' '#1083#1110#1090#1077#1088#1072#1090#1091#1088#1072
      #1055#1110#1076#1088#1091#1095#1085#1080#1082#1080)
  end
  inherited ibdMain: TIBDataSet
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from DICT_AUTOR'
      'where'
      '  AUTOR_ID = :AUTOR_ID')
    RefreshSQL.Strings = (
      'Select '
      '  AUTOR_ID,'
      '  FIRST_NAME,'
      '  LAST_NAME,'
      '  MIDDLE_NAME,'
      '  BOOK_TYPE_ID'
      'from DICT_AUTOR '
      'where'
      '  AUTOR_ID = :AUTOR_ID')
    SelectSQL.Strings = (
      
        'select AUTOR_ID, FIRST_NAME, LAST_NAME, MIDDLE_NAME, BOOK_TYPE_I' +
        'D from DICT_AUTOR'
      'where book_type_id = :btype')
    Filtered = True
    object ibdMainAUTOR_ID: TIntegerField
      FieldName = 'AUTOR_ID'
      Origin = '"DICT_AUTOR"."AUTOR_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      ReadOnly = True
      Required = True
    end
    object ibdMainFIRST_NAME: TIBStringField
      DisplayLabel = #1030#1084#39#1103
      FieldName = 'FIRST_NAME'
      Origin = '"DICT_AUTOR"."FIRST_NAME"'
      ReadOnly = True
      Size = 80
    end
    object ibdMainLAST_NAME: TIBStringField
      DisplayLabel = #1055#1088#1110#1079#1074#1080#1097#1077
      FieldName = 'LAST_NAME'
      Origin = '"DICT_AUTOR"."LAST_NAME"'
      ReadOnly = True
      Size = 80
    end
    object ibdMainMIDDLE_NAME: TIBStringField
      DisplayLabel = #1055#1086' '#1073#1072#1090#1100#1082#1086#1074#1110
      FieldName = 'MIDDLE_NAME'
      Origin = '"DICT_AUTOR"."MIDDLE_NAME"'
      ReadOnly = True
      Size = 80
    end
    object ibdMainBOOK_TYPE_ID: TIntegerField
      FieldName = 'BOOK_TYPE_ID'
      Origin = '"DICT_AUTOR"."BOOK_TYPE_ID"'
      ReadOnly = True
    end
  end
  inherited alMain: TActionList
    inherited acEdit: TAction
      OnExecute = acEditExecute
    end
    inherited acSave: TAction
      Visible = False
    end
  end
end
