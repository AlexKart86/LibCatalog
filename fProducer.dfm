inherited frmDictProducer: TfrmDictProducer
  Caption = #1042#1080#1076#1072#1074#1085#1080#1094#1090#1074#1072
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    inherited dbgMain: TDBGridEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'PRODUCER_NAME'
          Footers = <>
          Width = 226
        end
        item
          EditButtons = <>
          FieldName = 'PRODUCER_ADDRESS'
          Footers = <>
          Width = 233
        end
        item
          EditButtons = <>
          FieldName = 'COMMENTS'
          Footers = <>
          Width = 104
        end>
    end
  end
  inherited ibdMain: TIBDataSet
    DeleteSQL.Strings = (
      'delete from DICT_PRODUCER'
      'where'
      '  PRODUCER_ID = :PRODUCER_ID')
    InsertSQL.Strings = (
      'insert into DICT_PRODUCER'
      '  (COMMENTS, PRODUCER_ADDRESS, PRODUCER_ID, PRODUCER_NAME)'
      'values'
      '  (:COMMENTS, :PRODUCER_ADDRESS, :PRODUCER_ID, :PRODUCER_NAME)')
    SelectSQL.Strings = (
      'select * from DICT_PRODUCER')
    ModifySQL.Strings = (
      'update DICT_PRODUCER'
      'set'
      '  COMMENTS = :COMMENTS,'
      '  PRODUCER_ADDRESS = :PRODUCER_ADDRESS,'
      '  PRODUCER_NAME = :PRODUCER_NAME'
      'where'
      '  PRODUCER_ID = :PRODUCER_ID')
    GeneratorField.Field = 'PRODUCER_ID'
    GeneratorField.Generator = 'GEN_MAIN'
    object ibdMainPRODUCER_ID: TIntegerField
      FieldName = 'PRODUCER_ID'
      Origin = '"DICT_PRODUCER"."PRODUCER_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ibdMainPRODUCER_NAME: TIBStringField
      DisplayLabel = #1053#1072#1079#1074#1072
      FieldName = 'PRODUCER_NAME'
      Origin = '"DICT_PRODUCER"."PRODUCER_NAME"'
      Required = True
      Size = 80
    end
    object ibdMainPRODUCER_ADDRESS: TIBStringField
      DisplayLabel = #1052#1110#1089#1090#1086' '#1074#1080#1076#1072#1085#1085#1103
      FieldName = 'PRODUCER_ADDRESS'
      Origin = '"DICT_PRODUCER"."PRODUCER_ADDRESS"'
      Size = 100
    end
    object ibdMainCOMMENTS: TIBStringField
      DisplayLabel = #1050#1086#1084#1077#1085#1090#1072#1088
      FieldName = 'COMMENTS'
      Origin = '"DICT_PRODUCER"."COMMENTS"'
      Size = 4000
    end
  end
  inherited alMain: TActionList
    inherited acEdit: TAction
      Visible = False
    end
  end
end
