inherited frmDictDeleteReason: TfrmDictDeleteReason
  Caption = #1055#1088#1080#1095#1080#1085#1080' '#1074#1080#1073#1091#1090#1090#1103
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlMain: TPanel
    inherited dbgMain: TDBGridEh
      Columns = <
        item
          EditButtons = <>
          FieldName = 'DEL_REASON_NAME'
          Footers = <>
        end>
    end
  end
  inherited ibdMain: TIBDataSet
    DeleteSQL.Strings = (
      'delete from DICT_DELETE_REASON'
      'where'
      '  DEL_REASON_ID = :DEL_REASON_ID')
    InsertSQL.Strings = (
      'insert into DICT_DELETE_REASON'
      '  (DEL_REASON_ID, DEL_REASON_NAME)'
      'values'
      '  (:DEL_REASON_ID, :DEL_REASON_NAME)')
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'select DEL_REASON_ID, DEL_REASON_NAME from DICT_DELETE_REASON')
    ModifySQL.Strings = (
      'update DICT_DELETE_REASON'
      'set'
      '  DEL_REASON_NAME = :DEL_REASON_NAME'
      'where'
      '  DEL_REASON_ID = :DEL_REASON_ID')
    GeneratorField.Field = 'DEL_REASON_ID'
    GeneratorField.Generator = 'GEN_MAIN'
    object ibdMainDEL_REASON_ID: TIntegerField
      FieldName = 'DEL_REASON_ID'
      Origin = '"DICT_DELETE_REASON"."DEL_REASON_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ibdMainDEL_REASON_NAME: TIBStringField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1074#1080#1073#1091#1090#1090#1103
      FieldName = 'DEL_REASON_NAME'
      Origin = '"DICT_DELETE_REASON"."DEL_REASON_NAME"'
      Required = True
      Size = 80
    end
  end
end
