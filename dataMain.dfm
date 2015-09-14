object dmMain: TdmMain
  OldCreateOrder = False
  Height = 263
  Width = 327
  object dbMain: TIBDatabase
    Connected = True
    DatabaseName = 'E:\'#1042#1072#1078#1085#1086#1077'\LibCatalog\LIB.FDB'
    Params.Strings = (
      'user_name=admin')
    LoginPrompt = False
    DefaultTransaction = ibtMain
    ServerType = 'IBServer'
    Left = 32
    Top = 24
  end
  object ibtMain: TIBTransaction
    DefaultDatabase = dbMain
    AutoStopAction = saCommit
    Left = 104
    Top = 16
  end
  object ibMain: TIBQuery
    Database = dbMain
    Transaction = ibtMain
    SQL.Strings = (
      
        'select user_id from users where login = :login and role_id = :ro' +
        'le_id'
      'and user_pass = :user_pass')
    Left = 72
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'login'
        ParamType = ptUnknown
        Value = 'admin'
      end
      item
        DataType = ftInteger
        Name = 'role_id'
        ParamType = ptUnknown
        Value = 2
      end
      item
        DataType = ftString
        Name = 'user_pass'
        ParamType = ptUnknown
        Value = '1'
      end>
  end
  object ilMain_48: TImageList
    Height = 48
    Width = 48
    Left = 200
    Top = 16
  end
  object ilMain_32: TImageList
    Height = 32
    Width = 32
    Left = 200
    Top = 112
  end
  object XPManifest1: TXPManifest
    Left = 40
    Top = 168
  end
end
