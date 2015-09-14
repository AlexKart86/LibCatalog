inherited frmBookAnketa: TfrmBookAnketa
  Caption = #1050#1072#1088#1090#1082#1072' '#1082#1085#1080#1075#1080
  ClientHeight = 613
  ClientWidth = 734
  ExplicitWidth = 742
  ExplicitHeight = 647
  PixelsPerInch = 96
  TextHeight = 13
  object pcPages: TPageControl [0]
    Left = 0
    Top = 0
    Width = 734
    Height = 575
    ActivePage = tsBookTrans
    Align = alClient
    Style = tsFlatButtons
    TabOrder = 0
    object tsGeneral: TTabSheet
      Caption = #1047#1072#1075#1072#1083#1100#1085#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
      DesignSize = (
        726
        544)
      object Label2: TLabel
        Left = 4
        Top = 158
        Width = 37
        Height = 13
        Caption = #1040#1074#1090#1086#1088'*'
      end
      object Label1: TLabel
        Left = 4
        Top = 112
        Width = 36
        Height = 13
        Caption = #1053#1072#1079#1074#1072'*'
      end
      object Label7: TLabel
        Left = 4
        Top = 66
        Width = 67
        Height = 13
        Caption = #1042#1080#1076#1072#1074#1085#1080#1094#1090#1074#1086
      end
      object Label3: TLabel
        Left = 4
        Top = 20
        Width = 71
        Height = 13
        Caption = #1042#1080#1076' '#1074#1080#1076#1072#1085#1085#1103'*'
      end
      object lblClass: TLabel
        Left = 401
        Top = 20
        Width = 24
        Height = 13
        Anchors = [akTop, akRight]
        Caption = #1050#1083#1072#1089
        ExplicitLeft = 388
      end
      object pnlPhoto: TPanel
        Left = 565
        Top = 16
        Width = 145
        Height = 169
        Anchors = [akTop, akRight]
        Caption = 'pnlPhoto'
        TabOrder = 7
        object dbiPhoto: TJvDBImage
          Left = 1
          Top = 1
          Width = 143
          Height = 167
          Align = alClient
          DataField = 'PHOTO'
          DataSource = dsMain
          PopupMenu = pmPhoto
          TabOrder = 0
          OnClick = dbiPhotoClick
        end
      end
      object grbClassif: TGroupBox
        Left = 3
        Top = 191
        Width = 707
        Height = 58
        Anchors = [akLeft, akTop, akRight]
        Caption = #1050#1083#1072#1089#1089#1080#1092#1110#1082#1072#1090#1086#1088#1080
        TabOrder = 4
        object Label4: TLabel
          Left = 12
          Top = 25
          Width = 23
          Height = 13
          Caption = 'ISBN'
        end
        object Label5: TLabel
          Left = 268
          Top = 25
          Width = 22
          Height = 13
          Caption = #1059#1044#1050
        end
        object Label6: TLabel
          Left = 500
          Top = 25
          Width = 19
          Height = 13
          Caption = #1041#1041#1050
        end
        object dbeISBN: TDBEditEh
          Left = 82
          Top = 21
          Width = 159
          Height = 21
          DataField = 'ISBN'
          DataSource = dsMain
          EditButtons = <>
          HighlightRequired = True
          TabOrder = 0
          Visible = True
        end
        object dbeBBK: TDBEditEh
          Left = 525
          Top = 21
          Width = 159
          Height = 21
          DataField = 'BBK'
          DataSource = dsMain
          EditButtons = <>
          HighlightRequired = True
          TabOrder = 2
          Visible = True
        end
        object dbeUDK: TDBEditEh
          Left = 306
          Top = 21
          Width = 159
          Height = 21
          DataField = 'UDK'
          DataSource = dsMain
          EditButtons = <>
          HighlightRequired = True
          TabOrder = 1
          Visible = True
        end
        object DBNavigator1: TDBNavigator
          Left = 160
          Top = -24
          Width = 240
          Height = 25
          TabOrder = 3
        end
      end
      object dbcAutor: TDBComboBoxEh
        Left = 90
        Top = 155
        Width = 471
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'AUTOR_ID'
        DataSource = dsMain
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = dbcAutorEditButtons0Click
          end>
        HighlightRequired = True
        TabOrder = 3
        Visible = True
      end
      object dbeBookName: TDBEditEh
        Left = 90
        Top = 109
        Width = 471
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        DataField = 'BOOK_NAME'
        DataSource = dsMain
        EditButtons = <>
        HighlightRequired = True
        TabOrder = 2
        Visible = True
      end
      object dbcbProducers: TDBComboBoxEh
        Left = 89
        Top = 63
        Width = 471
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'PRODUCER_ID'
        DataSource = dsMain
        EditButtons = <
          item
            Style = ebsEllipsisEh
            OnClick = dbcbProducersEditButtons0Click
          end>
        HighlightRequired = True
        TabOrder = 1
        Visible = True
      end
      object dbcBookType: TDBComboBoxEh
        Left = 90
        Top = 17
        Width = 274
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'BOOK_TYPE_ID'
        DataSource = dsMain
        EditButtons = <>
        HighlightRequired = True
        TabOrder = 0
        Visible = True
        OnChange = dbcBookTypeChange
      end
      object gbStructure: TGroupBox
        Left = 3
        Top = 255
        Width = 708
        Height = 90
        Anchors = [akLeft, akTop, akRight]
        Caption = #1057#1082#1083#1072#1076' '#1082#1085#1080#1075#1080
        TabOrder = 5
        object Label10: TLabel
          Left = 12
          Top = 57
          Width = 18
          Height = 13
          Caption = #1058#1086#1084
        end
        object Label11: TLabel
          Left = 241
          Top = 57
          Width = 59
          Height = 13
          Caption = #8470' '#1074#1080#1076#1072#1085#1085#1103
        end
        object Label12: TLabel
          Left = 495
          Top = 57
          Width = 56
          Height = 13
          Caption = #1030#1083#1102#1089#1090#1088#1072#1094#1110#1081
        end
        object Label13: TLabel
          Left = 495
          Top = 25
          Width = 32
          Height = 13
          Caption = #1058#1080#1088#1072#1078
        end
        object Label8: TLabel
          Left = 12
          Top = 25
          Width = 60
          Height = 13
          Caption = #1056#1110#1082' '#1074#1080#1076#1072#1085#1085#1103
        end
        object Label9: TLabel
          Left = 242
          Top = 25
          Width = 45
          Height = 13
          Caption = #1057#1090#1086#1088#1110#1085#1086#1082
        end
        object dbnCopyCount: TDBNumberEditEh
          Left = 557
          Top = 21
          Width = 115
          Height = 21
          DataField = 'COPY_CNT'
          DataSource = dsMain
          EditButton.ShortCut = 0
          EditButton.Style = ebsAltUpDownEh
          EditButton.Visible = True
          EditButtons = <>
          HighlightRequired = True
          TabOrder = 2
          Visible = True
        end
        object dbnImages: TDBNumberEditEh
          Left = 557
          Top = 51
          Width = 115
          Height = 21
          DataField = 'IMAGES_CNT'
          DataSource = dsMain
          EditButton.ShortCut = 0
          EditButton.Style = ebsAltUpDownEh
          EditButton.Visible = True
          EditButtons = <>
          HighlightRequired = True
          TabOrder = 5
          Visible = True
        end
        object dbnPages: TDBNumberEditEh
          Left = 350
          Top = 53
          Width = 115
          Height = 21
          DataField = 'PAGES'
          DataSource = dsMain
          EditButton.ShortCut = 0
          EditButton.Style = ebsAltUpDownEh
          EditButton.Visible = True
          EditButtons = <>
          HighlightRequired = True
          TabOrder = 4
          Visible = True
        end
        object dbnPart: TDBNumberEditEh
          Left = 106
          Top = 53
          Width = 90
          Height = 21
          DataField = 'PART'
          DataSource = dsMain
          EditButton.Style = ebsAltUpDownEh
          EditButton.Visible = True
          EditButtons = <>
          HighlightRequired = True
          TabOrder = 3
          Visible = True
        end
        object dbnProcNum: TDBNumberEditEh
          Left = 350
          Top = 21
          Width = 115
          Height = 21
          DataField = 'PROC_NUM'
          DataSource = dsMain
          EditButton.ShortCut = 0
          EditButton.Style = ebsAltUpDownEh
          EditButton.Visible = True
          EditButtons = <>
          HighlightRequired = True
          TabOrder = 1
          Visible = True
        end
        object dbnReleaseYear: TDBNumberEditEh
          Left = 106
          Top = 21
          Width = 90
          Height = 21
          DataField = 'RELEASE_YEAR'
          DataSource = dsMain
          EditButton.Style = ebsAltUpDownEh
          EditButton.Visible = True
          EditButtons = <>
          HighlightRequired = True
          TabOrder = 0
          Visible = True
        end
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 351
        Width = 707
        Height = 169
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = #1044#1086#1076#1072#1090#1082#1086#1074#1072' '#1110#1085#1092#1086#1088#1084#1072#1094#1110#1103
        TabOrder = 6
        DesignSize = (
          707
          169)
        object dbeComments: TDBEditEh
          Left = 11
          Top = 16
          Width = 686
          Height = 143
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = False
          DataField = 'COMMENTS'
          DataSource = dsMain
          EditButtons = <>
          TabOrder = 0
          Visible = True
          WordWrap = True
        end
      end
      object dbcClass: TDBComboBoxEh
        Left = 440
        Top = 17
        Width = 121
        Height = 21
        Anchors = [akTop, akRight]
        DataField = 'CLASS'
        DataSource = dsMain
        EditButtons = <>
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11')
        KeyItems.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11')
        TabOrder = 8
        Visible = True
      end
    end
    object tsBookTrans: TTabSheet
      Caption = #1030#1085#1074#1077#1085#1090#1072#1088#1085#1110' '#1085#1086#1084#1077#1088#1072
      ImageIndex = 1
      object dbgBookTrans: TDBGridEh
        Left = 0
        Top = 25
        Width = 726
        Height = 519
        Align = alClient
        DataGrouping.GroupLevels = <>
        DataSource = dsBookTrans
        Flat = False
        FooterColor = 9943551
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'Tahoma'
        FooterFont.Style = []
        FooterRowCount = 1
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghDialogFind, dghShowRecNo, dghColumnResize, dghColumnMove, dghExtendVertLines]
        RowDetailPanel.Color = clBtnFace
        SumList.Active = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        UseMultiTitle = True
        Columns = <
          item
            EditButtons = <>
            FieldName = 'DATE_TRANS'
            Footer.DisplayFormat = #1042#1089#1100#1086#1075#1086' '#1087#1086#1079#1080#1094#1110#1081': ##0'
            Footer.FieldName = 'BOOK_TRANS_NUM'
            Footer.ValueType = fvtCount
            Footers = <>
            HighlightRequired = True
            Title.Caption = #1044#1072#1090#1072' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1111'*'
            Width = 145
          end
          item
            EditButtons = <>
            FieldName = 'BOOK_TRANS_NUM_START'
            Footers = <>
            HighlightRequired = True
            Title.Caption = #1030#1085#1074#1077#1085#1090#1072#1088#1085#1080#1081' '#1085#1086#1084#1077#1088'|'#1087#1086#1095#1072#1090#1086#1082
            Width = 88
          end
          item
            EditButtons = <>
            FieldName = 'BOOK_TRANS_NUM_END'
            Footers = <>
            Title.Caption = #1030#1085#1074#1077#1085#1090#1072#1088#1085#1080#1081' '#1085#1086#1084#1077#1088'|'#1082#1110#1085#1077#1094#1100
            Width = 105
          end
          item
            DisplayFormat = '##0.00'
            EditButtons = <>
            FieldName = 'PRICE'
            Footer.ValueType = fvtStaticText
            Footers = <>
            HighlightRequired = True
            Title.Caption = #1062#1110#1085#1072' '#1086#1076#1080#1085#1080#1094#1110
            Width = 57
          end
          item
            EditButtons = <>
            FieldName = 'CNT'
            Footer.DisplayFormat = #1042#1089#1100#1086#1075#1086': ###0'
            Footer.FieldName = 'CNT'
            Footer.ValueType = fvtSum
            Footers = <>
            Width = 67
          end
          item
            DisplayFormat = '###0.00'
            EditButtons = <>
            FieldName = 'TOTAL_PRICE'
            Footer.FieldName = 'TOTAL_PRICE'
            Footers = <>
            Width = 67
          end
          item
            EditButtons = <>
            FieldName = 'DATE_DELETE'
            Footer.DisplayFormat = #1057#1087#1080#1089#1072#1085#1086' '#1087#1086#1079#1080#1094#1110#1081': ##0'
            Footer.FieldName = 'DATE_DELETE'
            Footers = <>
            HighlightRequired = True
            Width = 136
          end
          item
            EditButtons = <>
            FieldName = 'DEL_REASON_ID'
            Footers = <>
            HighlightRequired = True
            Width = 112
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
      object dbnBookTrans: TDBNavigator
        Left = 0
        Top = 0
        Width = 726
        Height = 25
        DataSource = dsBookTrans
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete]
        Align = alTop
        ConfirmDelete = False
        TabOrder = 1
      end
    end
  end
  inherited pnlFooter: TPanel
    Top = 575
    Width = 734
    Height = 38
    TabOrder = 1
    ExplicitTop = 575
    ExplicitWidth = 734
    ExplicitHeight = 38
    inherited bbtnSave: TBitBtn
      Left = 455
      Top = 2
      Enabled = False
      Kind = bkCustom
      ModalResult = 0
      ExplicitLeft = 455
      ExplicitTop = 2
    end
    inherited bbtnCancel: TBitBtn
      Left = 610
      Top = 2
      Caption = #1047#1072#1082#1088#1080#1090#1080
      ExplicitLeft = 610
      ExplicitTop = 2
    end
    object btnRefresh: TBitBtn
      Left = 301
      Top = 2
      Width = 105
      Height = 25
      Anchors = [akTop, akRight]
      Caption = #1054#1085#1086#1074#1080#1090#1080
      DoubleBuffered = True
      Kind = bkRetry
      ParentDoubleBuffered = False
      TabOrder = 2
      OnClick = btnRefreshClick
    end
  end
  inherited ibdMain: TIBDataSet
    AfterEdit = ibdMainAfterEdit
    AfterInsert = ibdMainAfterInsert
    AfterOpen = ibdMainAfterOpen
    BeforePost = ibdMainBeforePost
    DeleteSQL.Strings = (
      'delete from BOOKS'
      'where'
      '  BOOK_ID = :BOOK_ID')
    InsertSQL.Strings = (
      'insert into BOOKS'
      
        '  (AUTOR_ID, BBK, BOOK_ID, BOOK_NAME, BOOK_TYPE_ID, CLASS, COMME' +
        'NTS, COPY_CNT, '
      
        '   IMAGES_CNT, ISBN, PAGES, PART, PHOTO, PROC_NUM, PRODUCER_ID, ' +
        'RELEASE_YEAR, '
      '   UDK)'
      'values'
      
        '  (:AUTOR_ID, :BBK, :BOOK_ID, :BOOK_NAME, :BOOK_TYPE_ID, :CLASS,' +
        ' :COMMENTS, '
      
        '   :COPY_CNT, :IMAGES_CNT, :ISBN, :PAGES, :PART, :PHOTO, :PROC_N' +
        'UM, :PRODUCER_ID, '
      '   :RELEASE_YEAR, :UDK)')
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'select * from BOOKS'
      'where book_id = :book_id')
    ModifySQL.Strings = (
      'update BOOKS'
      'set'
      '  AUTOR_ID = :AUTOR_ID,'
      '  BBK = :BBK,'
      '  BOOK_NAME = :BOOK_NAME,'
      '  BOOK_TYPE_ID = :BOOK_TYPE_ID,'
      '  CLASS = :CLASS,'
      '  COMMENTS = :COMMENTS,'
      '  COPY_CNT = :COPY_CNT,'
      '  IMAGES_CNT = :IMAGES_CNT,'
      '  ISBN = :ISBN,'
      '  PAGES = :PAGES,'
      '  PART = :PART,'
      '  PHOTO = :PHOTO,'
      '  PROC_NUM = :PROC_NUM,'
      '  PRODUCER_ID = :PRODUCER_ID,'
      '  RELEASE_YEAR = :RELEASE_YEAR,'
      '  UDK = :UDK'
      'where'
      '  BOOK_ID = :BOOK_ID')
    GeneratorField.Field = 'BOOK_ID'
    GeneratorField.Generator = 'GEN_MAIN'
    Left = 552
    Top = 376
    object ibdMainBOOK_ID: TIntegerField
      FieldName = 'BOOK_ID'
      Origin = '"BOOKS"."BOOK_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ibdMainBOOK_NAME: TIBStringField
      FieldName = 'BOOK_NAME'
      Origin = '"BOOKS"."BOOK_NAME"'
      Required = True
      Size = 80
    end
    object ibdMainRELEASE_YEAR: TIntegerField
      FieldName = 'RELEASE_YEAR'
      Origin = '"BOOKS"."RELEASE_YEAR"'
    end
    object ibdMainPAGES: TIntegerField
      FieldName = 'PAGES'
      Origin = '"BOOKS"."PAGES"'
    end
    object ibdMainPART: TIntegerField
      FieldName = 'PART'
      Origin = '"BOOKS"."PART"'
    end
    object ibdMainPRODUCER_ID: TIntegerField
      FieldName = 'PRODUCER_ID'
      Origin = '"BOOKS"."PRODUCER_ID"'
    end
    object ibdMainCLASS: TIntegerField
      FieldName = 'CLASS'
      Origin = '"BOOKS"."CLASS"'
    end
    object ibdMainISBN: TIBStringField
      FieldName = 'ISBN'
      Origin = '"BOOKS"."ISBN"'
      Size = 30
    end
    object ibdMainUDK: TIBStringField
      FieldName = 'UDK'
      Origin = '"BOOKS"."UDK"'
      Size = 30
    end
    object ibdMainBBK: TIBStringField
      FieldName = 'BBK'
      Origin = '"BOOKS"."BBK"'
      Size = 30
    end
    object ibdMainAUTOR_ID: TIntegerField
      DisplayLabel = #1040#1074#1090#1086#1088
      FieldName = 'AUTOR_ID'
      Origin = '"BOOKS"."AUTOR_ID"'
      Required = True
    end
    object ibdMainBOOK_TYPE_ID: TIntegerField
      DisplayLabel = #1058#1080#1087' '#1074#1080#1076#1072#1085#1085#1103
      FieldName = 'BOOK_TYPE_ID'
      Origin = '"BOOKS"."BOOK_TYPE_ID"'
      Required = True
    end
    object ibdMainPHOTO: TBlobField
      FieldName = 'PHOTO'
      Origin = '"BOOKS"."PHOTO"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
    object ibdMainCOMMENTS: TIBStringField
      FieldName = 'COMMENTS'
      Origin = '"BOOKS"."COMMENTS"'
      Size = 2000
    end
    object ibdMainPROC_NUM: TIntegerField
      FieldName = 'PROC_NUM'
      Origin = '"BOOKS"."PROC_NUM"'
    end
    object ibdMainIMAGES_CNT: TIntegerField
      FieldName = 'IMAGES_CNT'
      Origin = '"BOOKS"."IMAGES_CNT"'
    end
    object ibdMainCOPY_CNT: TIntegerField
      FieldName = 'COPY_CNT'
      Origin = '"BOOKS"."COPY_CNT"'
    end
  end
  inherited dsMain: TDataSource
    Left = 600
    Top = 360
  end
  object pmPhoto: TPopupMenu
    Left = 472
    Top = 144
    object pmSaveToFile: TMenuItem
      Caption = #1047#1073#1077#1088#1077#1075#1090#1080' '#1092#1086#1090#1086' '#1091' '#1092#1072#1081#1083
      OnClick = pmSaveToFileClick
    end
    object pmLoadFromFile: TMenuItem
      Caption = #1047#1072#1074#1072#1085#1090#1072#1078#1080#1090#1080' '#1092#1086#1090#1086' '#1079' '#1092#1072#1081#1083#1091
      OnClick = pmLoadFromFileClick
    end
    object pmDelete: TMenuItem
      Caption = #1042#1080#1076#1072#1083#1080#1090#1080
      OnClick = pmDeleteClick
    end
  end
  object dlgOpen: TOpenPictureDialog
    Left = 480
    Top = 192
  end
  object SavePictureDialog1: TSavePictureDialog
    Left = 496
    Top = 208
  end
  object dlgSave: TSavePictureDialog
    Left = 520
    Top = 104
  end
  object ibdBookTrans: TIBDataSet
    Database = dmMain.dbMain
    Transaction = dmMain.ibtMain
    AfterDelete = ibdBookTransAfterEdit
    AfterEdit = ibdBookTransAfterEdit
    AfterInsert = ibdBookTransAfterInsert
    OnCalcFields = ibdBookTransCalcFields
    CachedUpdates = True
    DeleteSQL.Strings = (
      'delete from BOOK_TRANS'
      'where'
      '  BOOK_TRANS_ID = :BOOK_TRANS_ID')
    InsertSQL.Strings = (
      'insert into BOOK_TRANS'
      
        '  (BOOK_ID, BOOK_TRANS_ID, BOOK_TRANS_NUM_END, BOOK_TRANS_NUM_ST' +
        'ART, CNT, '
      '   DATE_DELETE, DATE_TRANS, DEL_REASON_ID, PRICE)'
      'values'
      
        '  (:BOOK_ID, :BOOK_TRANS_ID, :BOOK_TRANS_NUM_END, :BOOK_TRANS_NU' +
        'M_START, '
      '   :CNT, :DATE_DELETE, :DATE_TRANS, :DEL_REASON_ID, :PRICE)')
    SelectSQL.Strings = (
      'select *'
      'from BOOK_TRANS'
      'where BOOK_ID = :BOOK_ID   ')
    ModifySQL.Strings = (
      'update BOOK_TRANS'
      'set'
      '  BOOK_TRANS_NUM_END = :BOOK_TRANS_NUM_END,'
      '  BOOK_TRANS_NUM_START = :BOOK_TRANS_NUM_START,'
      '  CNT = :CNT,'
      '  DATE_DELETE = :DATE_DELETE,'
      '  DATE_TRANS = :DATE_TRANS,'
      '  DEL_REASON_ID = :DEL_REASON_ID,'
      '  PRICE = :PRICE'
      'where'
      '  BOOK_TRANS_ID = :BOOK_TRANS_ID')
    GeneratorField.Field = 'BOOK_TRANS_ID'
    GeneratorField.Generator = 'GEN_MAIN'
    Left = 320
    Top = 280
    object ibdBookTransBOOK_TRANS_ID: TIntegerField
      FieldName = 'BOOK_TRANS_ID'
      Origin = '"BOOK_TRANS"."BOOK_TRANS_ID"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object ibdBookTransBOOK_ID: TIntegerField
      FieldName = 'BOOK_ID'
      Origin = '"BOOK_TRANS"."BOOK_ID"'
    end
    object ibdBookTransPRICE: TFloatField
      DisplayLabel = #1062#1110#1085#1072
      FieldName = 'PRICE'
      Origin = '"BOOK_TRANS"."PRICE"'
    end
    object ibdBookTransBOOK_TRANS_NUM: TIntegerField
      DisplayLabel = #1030#1085#1074#1077#1085#1090#1072#1088#1085#1080#1081' '#1085#1086#1084#1077#1088
      FieldName = 'BOOK_TRANS_NUM_START'
      Origin = '"BOOK_TRANS"."BOOK_TRANS_NUM"'
      Required = True
    end
    object ibdBookTransDATE_DELETE: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1089#1087#1080#1089#1072#1085#1085#1103
      FieldName = 'DATE_DELETE'
      Origin = '"BOOK_TRANS"."DATE_DELETE"'
    end
    object ibdBookTransDEL_REASON_ID: TIntegerField
      DisplayLabel = #1055#1088#1080#1095#1080#1085#1072' '#1089#1087#1080#1089#1072#1085#1085#1103
      FieldName = 'DEL_REASON_ID'
      Origin = '"BOOK_TRANS"."DEL_REASON_ID"'
    end
    object ibdBookTransDATE_TRANS: TDateField
      DisplayLabel = #1044#1072#1090#1072' '#1088#1077#1108#1089#1090#1088#1072#1094#1110#1111
      FieldName = 'DATE_TRANS'
      Origin = '"BOOK_TRANS"."DATE_TRANS"'
      Required = True
    end
    object ibdBookTransBOOK_TRANS_NUM_END: TIntegerField
      DisplayLabel = #1030#1085#1074'. '#1085#1086#1084#1077#1088' '#1082#1110#1085#1077#1094#1100
      FieldName = 'BOOK_TRANS_NUM_END'
    end
    object ibdBookTransCNT: TIntegerField
      DisplayLabel = #1050#1110#1083#1100#1082#1110#1089#1090#1100' '#1082#1085#1080#1075
      FieldName = 'CNT'
    end
    object ibdBookTransTOTAL_PRICE: TFloatField
      DisplayLabel = #1047#1072#1075#1072#1083#1100#1085#1072' '#1074#1072#1088#1090#1110#1089#1090#1100
      FieldKind = fkCalculated
      FieldName = 'TOTAL_PRICE'
      Calculated = True
    end
  end
  object dsBookTrans: TDataSource
    DataSet = ibdBookTrans
    Left = 328
    Top = 328
  end
end
