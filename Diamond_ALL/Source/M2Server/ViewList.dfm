object frmViewList: TfrmViewList
  Left = 231
  Top = 181
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '??????'
  ClientHeight = 340
  ClientWidth = 693
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '??'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object PageControlViewList: TPageControl
    Left = 10
    Top = 10
    Width = 671
    Height = 321
    ActivePage = TabSheet10
    MultiLine = True
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = '??????'
      object GroupBox3: TGroupBox
        Left = 10
        Top = 5
        Width = 221
        Height = 221
        Caption = '??????'
        TabOrder = 0
        object ListBoxDisableMakeList: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxDisableMakeListClick
        end
      end
      object GroupBox4: TGroupBox
        Left = 360
        Top = 5
        Width = 221
        Height = 221
        Caption = '????'
        TabOrder = 1
        object ListBoxitemList1: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          ItemHeight = 12
          MultiSelect = True
          TabOrder = 0
          OnClick = ListBoxitemList1Click
        end
      end
      object ButtonDisableMakeAdd: TButton
        Left = 250
        Top = 30
        Width = 91
        Height = 31
        Caption = '??(&A)'
        TabOrder = 2
        OnClick = ButtonDisableMakeAddClick
      end
      object ButtonDisableMakeDelete: TButton
        Left = 250
        Top = 70
        Width = 91
        Height = 31
        Caption = '??(&D)'
        TabOrder = 3
        OnClick = ButtonDisableMakeDeleteClick
      end
      object ButtonDisableMakeSave: TButton
        Left = 250
        Top = 190
        Width = 91
        Height = 31
        Caption = '??(&S)'
        TabOrder = 4
        OnClick = ButtonDisableMakeSaveClick
      end
      object ButtonDisableMakeAddAll: TButton
        Left = 250
        Top = 110
        Width = 91
        Height = 31
        Caption = '????(&A)'
        TabOrder = 5
        OnClick = ButtonDisableMakeAddAllClick
      end
      object ButtonDisableMakeDeleteAll: TButton
        Left = 250
        Top = 150
        Width = 91
        Height = 31
        Caption = '????(&D)'
        TabOrder = 6
        OnClick = ButtonDisableMakeDeleteAllClick
      end
    end
    object TabSheet2: TTabSheet
      Caption = '??????'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 360
        Top = 5
        Width = 221
        Height = 221
        Caption = '????'
        TabOrder = 0
        object ListBoxItemList: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxItemListClick
        end
      end
      object GroupBox1: TGroupBox
        Left = 10
        Top = 5
        Width = 221
        Height = 221
        Caption = '??????'
        TabOrder = 1
        object ListBoxEnableMakeList: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxEnableMakeListClick
        end
      end
      object ButtonEnableMakeAdd: TButton
        Left = 250
        Top = 30
        Width = 91
        Height = 31
        Caption = '??(&A)'
        TabOrder = 2
        OnClick = ButtonEnableMakeAddClick
      end
      object ButtonEnableMakeDelete: TButton
        Left = 250
        Top = 70
        Width = 91
        Height = 31
        Caption = '??(&D)'
        TabOrder = 3
        OnClick = ButtonEnableMakeDeleteClick
      end
      object ButtonEnableMakeSave: TButton
        Left = 250
        Top = 190
        Width = 91
        Height = 31
        Caption = '??(&S)'
        TabOrder = 4
        OnClick = ButtonEnableMakeSaveClick
      end
      object ButtonEnableMakeAddAll: TButton
        Left = 250
        Top = 110
        Width = 91
        Height = 31
        Caption = '????(&A)'
        TabOrder = 5
        OnClick = ButtonEnableMakeAddAllClick
      end
      object ButtonEnableMakeDeleteAll: TButton
        Left = 250
        Top = 150
        Width = 91
        Height = 31
        Caption = '????(&D)'
        TabOrder = 6
        OnClick = ButtonEnableMakeDeleteAllClick
      end
    end
    object TabSheet8: TTabSheet
      Hint = '??????,???????????????,??????????'
      Caption = '??????'
      ImageIndex = 8
      object GroupBox8: TGroupBox
        Left = 10
        Top = 5
        Width = 221
        Height = 221
        Caption = '????/????'
        TabOrder = 0
        object ListBoxGameLogList: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxGameLogListClick
        end
      end
      object ButtonGameLogAdd: TButton
        Left = 250
        Top = 30
        Width = 91
        Height = 31
        Caption = '??(&A)'
        TabOrder = 1
        OnClick = ButtonGameLogAddClick
      end
      object ButtonGameLogDel: TButton
        Left = 250
        Top = 70
        Width = 91
        Height = 31
        Caption = '??(&D)'
        TabOrder = 2
        OnClick = ButtonGameLogDelClick
      end
      object ButtonGameLogAddAll: TButton
        Left = 250
        Top = 110
        Width = 91
        Height = 31
        Caption = '????(&A)'
        TabOrder = 3
        OnClick = ButtonGameLogAddAllClick
      end
      object ButtonGameLogDelAll: TButton
        Left = 250
        Top = 150
        Width = 91
        Height = 31
        Caption = '????(&D)'
        TabOrder = 4
        OnClick = ButtonGameLogDelAllClick
      end
      object ButtonGameLogSave: TButton
        Left = 250
        Top = 190
        Width = 91
        Height = 31
        Caption = '??(&S)'
        TabOrder = 5
        OnClick = ButtonGameLogSaveClick
      end
      object GroupBox9: TGroupBox
        Left = 360
        Top = 5
        Width = 221
        Height = 221
        Caption = '??/????'
        TabOrder = 6
        object ListBoxitemList2: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxitemList2Click
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = '??????'
      ImageIndex = 2
      object GroupBox5: TGroupBox
        Left = 10
        Top = 5
        Width = 221
        Height = 221
        Caption = '??????'
        TabOrder = 0
        object ListBoxDisableMoveMap: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxDisableMoveMapClick
        end
      end
      object ButtonDisableMoveMapAdd: TButton
        Left = 250
        Top = 30
        Width = 91
        Height = 31
        Caption = '??(&A)'
        TabOrder = 1
        OnClick = ButtonDisableMoveMapAddClick
      end
      object ButtonDisableMoveMapDelete: TButton
        Left = 250
        Top = 70
        Width = 91
        Height = 31
        Caption = '??(&D)'
        TabOrder = 2
        OnClick = ButtonDisableMoveMapDeleteClick
      end
      object ButtonDisableMoveMapAddAll: TButton
        Left = 250
        Top = 110
        Width = 91
        Height = 31
        Caption = '????(&A)'
        TabOrder = 3
        OnClick = ButtonDisableMoveMapAddAllClick
      end
      object ButtonDisableMoveMapDeleteAll: TButton
        Left = 250
        Top = 150
        Width = 91
        Height = 31
        Caption = '????(&D)'
        TabOrder = 4
        OnClick = ButtonDisableMoveMapDeleteAllClick
      end
      object ButtonDisableMoveMapSave: TButton
        Left = 250
        Top = 190
        Width = 91
        Height = 31
        Caption = '??(&S)'
        TabOrder = 5
        OnClick = ButtonDisableMoveMapSaveClick
      end
      object GroupBox6: TGroupBox
        Left = 360
        Top = 5
        Width = 221
        Height = 221
        Caption = '????'
        TabOrder = 6
        object ListBoxMapList: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxMapListClick
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = '??????'
      ImageIndex = 3
    end
    object TabSheet5: TTabSheet
      Caption = '??????'
      ImageIndex = 4
      object GridItemBindAccount: TStringGrid
        Left = 10
        Top = 10
        Width = 421
        Height = 221
        Hint = '????????????????????,????????????????????????'
        ColCount = 4
        DefaultRowHeight = 18
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnClick = GridItemBindAccountClick
        ColWidths = (
          91
          63
          68
          88)
      end
      object GroupBox16: TGroupBox
        Left = 440
        Top = 10
        Width = 211
        Height = 221
        Caption = '????'
        TabOrder = 1
        object Label6: TLabel
          Left = 10
          Top = 53
          Width = 36
          Height = 15
          Caption = '??IDX:'
        end
        object Label7: TLabel
          Left = 10
          Top = 83
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object Label8: TLabel
          Left = 10
          Top = 113
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object Label9: TLabel
          Left = 10
          Top = 23
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object ButtonItemBindAcountMod: TButton
          Left = 120
          Top = 140
          Width = 81
          Height = 31
          Caption = '??(&S)'
          TabOrder = 0
          OnClick = ButtonItemBindAcountModClick
        end
        object EditItemBindAccountItemIdx: TSpinEdit
          Left = 85
          Top = 49
          Width = 116
          Height = 21
          MaxValue = 5000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditItemBindAccountItemIdxChange
        end
        object EditItemBindAccountItemMakeIdx: TSpinEdit
          Left = 85
          Top = 79
          Width = 116
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 10
          OnChange = EditItemBindAccountItemMakeIdxChange
        end
        object EditItemBindAccountItemName: TEdit
          Left = 85
          Top = 20
          Width = 116
          Height = 20
          ReadOnly = True
          TabOrder = 3
        end
        object ButtonItemBindAcountAdd: TButton
          Left = 10
          Top = 140
          Width = 81
          Height = 31
          Caption = '??(&A)'
          TabOrder = 4
          OnClick = ButtonItemBindAcountAddClick
        end
        object ButtonItemBindAcountRef: TButton
          Left = 120
          Top = 180
          Width = 81
          Height = 31
          Caption = '??(&R)'
          TabOrder = 5
          OnClick = ButtonItemBindAcountRefClick
        end
        object ButtonItemBindAcountDel: TButton
          Left = 10
          Top = 180
          Width = 81
          Height = 31
          Caption = '??(&D)'
          TabOrder = 6
          OnClick = ButtonItemBindAcountDelClick
        end
        object EditItemBindAccountName: TEdit
          Left = 85
          Top = 110
          Width = 116
          Height = 20
          TabOrder = 7
          OnChange = EditItemBindAccountNameChange
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = '??????'
      ImageIndex = 5
      object GridItemBindCharName: TStringGrid
        Left = 10
        Top = 10
        Width = 421
        Height = 221
        Hint = '????????????????????,????????????????'
        ColCount = 4
        DefaultRowHeight = 18
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnClick = GridItemBindCharNameClick
        ColWidths = (
          91
          63
          68
          88)
      end
      object GroupBox17: TGroupBox
        Left = 440
        Top = 10
        Width = 211
        Height = 221
        Caption = '????'
        TabOrder = 1
        object Label10: TLabel
          Left = 10
          Top = 53
          Width = 36
          Height = 15
          Caption = '??IDX:'
        end
        object Label11: TLabel
          Left = 10
          Top = 83
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object Label12: TLabel
          Left = 10
          Top = 113
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object Label13: TLabel
          Left = 10
          Top = 23
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object ButtonItemBindCharNameMod: TButton
          Left = 120
          Top = 140
          Width = 81
          Height = 31
          Caption = '??(&S)'
          TabOrder = 0
          OnClick = ButtonItemBindCharNameModClick
        end
        object EditItemBindCharNameItemIdx: TSpinEdit
          Left = 85
          Top = 49
          Width = 116
          Height = 21
          MaxValue = 5000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditItemBindCharNameItemIdxChange
        end
        object EditItemBindCharNameItemMakeIdx: TSpinEdit
          Left = 85
          Top = 79
          Width = 116
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 10
          OnChange = EditItemBindCharNameItemMakeIdxChange
        end
        object EditItemBindCharNameItemName: TEdit
          Left = 85
          Top = 20
          Width = 116
          Height = 20
          ReadOnly = True
          TabOrder = 3
        end
        object ButtonItemBindCharNameAdd: TButton
          Left = 10
          Top = 140
          Width = 81
          Height = 31
          Caption = '??(&A)'
          TabOrder = 4
          OnClick = ButtonItemBindCharNameAddClick
        end
        object ButtonItemBindCharNameRef: TButton
          Left = 120
          Top = 180
          Width = 81
          Height = 31
          Caption = '??(&R)'
          TabOrder = 5
          OnClick = ButtonItemBindCharNameRefClick
        end
        object ButtonItemBindCharNameDel: TButton
          Left = 10
          Top = 180
          Width = 81
          Height = 31
          Caption = '??(&D)'
          TabOrder = 6
          OnClick = ButtonItemBindCharNameDelClick
        end
        object EditItemBindCharNameName: TEdit
          Left = 85
          Top = 110
          Width = 116
          Height = 20
          TabOrder = 7
          OnChange = EditItemBindCharNameNameChange
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = '??IP??'
      ImageIndex = 6
      object GridItemBindIPaddr: TStringGrid
        Left = 10
        Top = 10
        Width = 421
        Height = 221
        Hint = '????????????????IP????,????????IP????????????????'
        ColCount = 4
        DefaultRowHeight = 18
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnClick = GridItemBindIPaddrClick
        ColWidths = (
          91
          63
          68
          88)
      end
      object GroupBox18: TGroupBox
        Left = 440
        Top = 10
        Width = 211
        Height = 221
        Caption = '????'
        TabOrder = 1
        object Label14: TLabel
          Left = 10
          Top = 53
          Width = 36
          Height = 15
          Caption = '??IDX:'
        end
        object Label15: TLabel
          Left = 10
          Top = 83
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object Label16: TLabel
          Left = 10
          Top = 113
          Width = 28
          Height = 15
          Caption = '??IP:'
        end
        object Label17: TLabel
          Left = 10
          Top = 23
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object ButtonItemBindIPaddrMod: TButton
          Left = 120
          Top = 140
          Width = 81
          Height = 31
          Caption = '??(&S)'
          TabOrder = 0
          OnClick = ButtonItemBindIPaddrModClick
        end
        object EditItemBindIPaddrItemIdx: TSpinEdit
          Left = 85
          Top = 49
          Width = 116
          Height = 21
          MaxValue = 5000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditItemBindIPaddrItemIdxChange
        end
        object EditItemBindIPaddrItemMakeIdx: TSpinEdit
          Left = 85
          Top = 79
          Width = 116
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 10
          OnChange = EditItemBindIPaddrItemMakeIdxChange
        end
        object EditItemBindIPaddrItemName: TEdit
          Left = 85
          Top = 20
          Width = 116
          Height = 20
          ReadOnly = True
          TabOrder = 3
        end
        object ButtonItemBindIPaddrAdd: TButton
          Left = 10
          Top = 140
          Width = 81
          Height = 31
          Caption = '??(&A)'
          TabOrder = 4
          OnClick = ButtonItemBindIPaddrAddClick
        end
        object ButtonItemBindIPaddrRef: TButton
          Left = 120
          Top = 180
          Width = 81
          Height = 31
          Caption = '??(&R)'
          TabOrder = 5
          OnClick = ButtonItemBindIPaddrRefClick
        end
        object ButtonItemBindIPaddrDel: TButton
          Left = 10
          Top = 180
          Width = 81
          Height = 31
          Caption = '??(&D)'
          TabOrder = 6
          OnClick = ButtonItemBindIPaddrDelClick
        end
        object EditItemBindIPaddrName: TEdit
          Left = 85
          Top = 110
          Width = 116
          Height = 20
          TabOrder = 7
          OnChange = EditItemBindIPaddrNameChange
        end
      end
    end
    object TabSheet12: TTabSheet
      Caption = '???????'
      ImageIndex = 12
      object GridItemNameList: TStringGrid
        Left = 10
        Top = 10
        Width = 421
        Height = 221
        ColCount = 3
        DefaultRowHeight = 18
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnClick = GridItemNameListClick
        ColWidths = (
          97
          69
          145)
      end
      object GroupBox19: TGroupBox
        Left = 440
        Top = 10
        Width = 211
        Height = 221
        Caption = '???????'
        TabOrder = 1
        object Label18: TLabel
          Left = 10
          Top = 53
          Width = 36
          Height = 15
          Caption = '??IDX:'
        end
        object Label19: TLabel
          Left = 10
          Top = 83
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object Label20: TLabel
          Left = 10
          Top = 113
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object Label21: TLabel
          Left = 10
          Top = 23
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object ButtonItemNameMod: TButton
          Left = 120
          Top = 140
          Width = 81
          Height = 31
          Caption = '??(&S)'
          TabOrder = 0
          OnClick = ButtonItemNameModClick
        end
        object EditItemNameIdx: TSpinEdit
          Left = 85
          Top = 49
          Width = 116
          Height = 21
          MaxValue = 5000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditItemNameIdxChange
        end
        object EditItemNameMakeIndex: TSpinEdit
          Left = 85
          Top = 79
          Width = 116
          Height = 21
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 10
          OnChange = EditItemNameMakeIndexChange
        end
        object EditItemNameOldName: TEdit
          Left = 85
          Top = 20
          Width = 116
          Height = 20
          ReadOnly = True
          TabOrder = 3
        end
        object ButtonItemNameAdd: TButton
          Left = 10
          Top = 140
          Width = 81
          Height = 31
          Caption = '??(&A)'
          TabOrder = 4
          OnClick = ButtonItemNameAddClick
        end
        object ButtonItemNameRef: TButton
          Left = 120
          Top = 180
          Width = 81
          Height = 31
          Caption = '??(&R)'
          TabOrder = 5
          OnClick = ButtonItemNameRefClick
        end
        object ButtonItemNameDel: TButton
          Left = 10
          Top = 180
          Width = 81
          Height = 31
          Caption = '??(&D)'
          TabOrder = 6
          OnClick = ButtonItemNameDelClick
        end
        object EditItemNameNewName: TEdit
          Left = 85
          Top = 110
          Width = 116
          Height = 20
          TabOrder = 7
          OnChange = EditItemNameNewNameChange
        end
      end
    end
    object TabSheetMonDrop: TTabSheet
      Caption = '?????'
      ImageIndex = 7
      object StringGridMonDropLimit: TStringGrid
        Left = 10
        Top = 10
        Width = 351
        Height = 221
        ColCount = 4
        DefaultRowHeight = 18
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
        TabOrder = 0
        OnClick = StringGridMonDropLimitClick
        ColWidths = (
          81
          64
          57
          52)
      end
      object GroupBox7: TGroupBox
        Left = 370
        Top = 10
        Width = 211
        Height = 221
        Caption = '????'
        TabOrder = 1
        object Label29: TLabel
          Left = 10
          Top = 53
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object Label1: TLabel
          Left = 10
          Top = 83
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object Label2: TLabel
          Left = 10
          Top = 113
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object Label3: TLabel
          Left = 10
          Top = 23
          Width = 28
          Height = 15
          Caption = '????'
        end
        object ButtonMonDropLimitSave: TButton
          Left = 120
          Top = 140
          Width = 81
          Height = 31
          Caption = '??(&S)'
          TabOrder = 0
          OnClick = ButtonMonDropLimitSaveClick
        end
        object EditDropCount: TSpinEdit
          Left = 85
          Top = 49
          Width = 76
          Height = 21
          MaxValue = 100000
          MinValue = 0
          TabOrder = 1
          Value = 10
          OnChange = EditDropCountChange
        end
        object EditCountLimit: TSpinEdit
          Left = 85
          Top = 79
          Width = 76
          Height = 21
          MaxValue = 100000
          MinValue = 0
          TabOrder = 2
          Value = 10
          OnChange = EditCountLimitChange
        end
        object EditNoDropCount: TSpinEdit
          Left = 85
          Top = 109
          Width = 76
          Height = 21
          MaxValue = 100000
          MinValue = 0
          TabOrder = 3
          Value = 10
          OnChange = EditNoDropCountChange
        end
        object EditItemName: TEdit
          Left = 85
          Top = 20
          Width = 111
          Height = 20
          TabOrder = 4
        end
        object ButtonMonDropLimitAdd: TButton
          Left = 10
          Top = 140
          Width = 81
          Height = 31
          Caption = '??(&A)'
          TabOrder = 5
          OnClick = ButtonMonDropLimitAddClick
        end
        object ButtonMonDropLimitRef: TButton
          Left = 120
          Top = 180
          Width = 81
          Height = 31
          Caption = '??(&R)'
          TabOrder = 6
          OnClick = ButtonMonDropLimitRefClick
        end
        object ButtonMonDropLimitDel: TButton
          Left = 10
          Top = 180
          Width = 81
          Height = 31
          Caption = '??(&D)'
          TabOrder = 7
          OnClick = ButtonMonDropLimitDelClick
        end
      end
    end
    object TabSheet9: TTabSheet
      Hint = '????????,????????????????????,????????'
      Caption = '??????'
      ImageIndex = 9
      object GroupBox10: TGroupBox
        Left = 10
        Top = 5
        Width = 221
        Height = 221
        Caption = '????????'
        TabOrder = 0
        object ListBoxDisableTakeOffList: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          Hint = '????????,????????????????????,????????'
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxDisableTakeOffListClick
        end
      end
      object ButtonDisableTakeOffAdd: TButton
        Left = 250
        Top = 30
        Width = 91
        Height = 31
        Caption = '??(&A)'
        TabOrder = 1
        OnClick = ButtonDisableTakeOffAddClick
      end
      object ButtonDisableTakeOffDel: TButton
        Left = 250
        Top = 70
        Width = 91
        Height = 31
        Caption = '??(&D)'
        TabOrder = 2
        OnClick = ButtonDisableTakeOffDelClick
      end
      object ButtonDisableTakeOffAddAll: TButton
        Left = 250
        Top = 110
        Width = 91
        Height = 31
        Caption = '????(&A)'
        TabOrder = 3
        OnClick = ButtonDisableTakeOffAddAllClick
      end
      object ButtonDisableTakeOffDelAll: TButton
        Left = 250
        Top = 150
        Width = 91
        Height = 31
        Caption = '????(&D)'
        TabOrder = 4
        OnClick = ButtonDisableTakeOffDelAllClick
      end
      object ButtonDisableTakeOffSave: TButton
        Left = 250
        Top = 190
        Width = 91
        Height = 31
        Caption = '??(&S)'
        TabOrder = 5
        OnClick = ButtonDisableTakeOffSaveClick
      end
      object GroupBox11: TGroupBox
        Left = 360
        Top = 5
        Width = 221
        Height = 221
        Caption = '????'
        TabOrder = 6
        object ListBoxitemList3: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxitemList3Click
        end
      end
    end
    object TabSheet11: TTabSheet
      Caption = '????????'
      ImageIndex = 11
      object GroupBox13: TGroupBox
        Left = 10
        Top = 4
        Width = 221
        Height = 221
        Caption = '????????'
        TabOrder = 0
        object ListBoxNoClearMonList: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          Hint = '????????,??????CLEARMAPMON,????????,???????????????'
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxNoClearMonListClick
        end
      end
      object ButtonNoClearMonAdd: TButton
        Left = 250
        Top = 30
        Width = 91
        Height = 31
        Caption = '??(&A)'
        TabOrder = 1
        OnClick = ButtonNoClearMonAddClick
      end
      object ButtonNoClearMonDel: TButton
        Left = 250
        Top = 70
        Width = 91
        Height = 31
        Caption = '??(&D)'
        TabOrder = 2
        OnClick = ButtonNoClearMonDelClick
      end
      object ButtonNoClearMonAddAll: TButton
        Left = 250
        Top = 110
        Width = 91
        Height = 31
        Caption = '????(&A)'
        TabOrder = 3
        OnClick = ButtonNoClearMonAddAllClick
      end
      object ButtonNoClearMonDelAll: TButton
        Left = 250
        Top = 150
        Width = 91
        Height = 31
        Caption = '????(&D)'
        TabOrder = 4
        OnClick = ButtonNoClearMonDelAllClick
      end
      object ButtonNoClearMonSave: TButton
        Left = 250
        Top = 190
        Width = 91
        Height = 31
        Caption = '??(&S)'
        TabOrder = 5
        OnClick = ButtonNoClearMonSaveClick
      end
      object GroupBox14: TGroupBox
        Left = 360
        Top = 4
        Width = 221
        Height = 221
        Caption = '????'
        TabOrder = 6
        object ListBoxMonList: TListBox
          Left = 10
          Top = 20
          Width = 201
          Height = 191
          ItemHeight = 12
          TabOrder = 0
          OnClick = ListBoxMonListClick
        end
      end
    end
    object TabSheet10: TTabSheet
      Caption = '?????'
      ImageIndex = 10
      object GroupBox12: TGroupBox
        Left = 10
        Top = 5
        Width = 341
        Height = 221
        Caption = '?????'
        TabOrder = 0
        object ListBoxAdminList: TListBox
          Left = 10
          Top = 20
          Width = 321
          Height = 191
          ItemHeight = 15
          TabOrder = 0
          OnClick = ListBoxAdminListClick
        end
      end
      object GroupBox15: TGroupBox
        Left = 390
        Top = 5
        Width = 261
        Height = 176
        Caption = '?????'
        TabOrder = 1
        object Label4: TLabel
          Left = 10
          Top = 25
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object Label5: TLabel
          Left = 10
          Top = 55
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object LabelAdminIPaddr: TLabel
          Left = 10
          Top = 85
          Width = 28
          Height = 15
          Caption = '??IP:'
        end
        object EditAdminName: TEdit
          Left = 80
          Top = 20
          Width = 121
          Height = 23
          TabOrder = 0
        end
        object EditAdminPremission: TSpinEdit
          Left = 80
          Top = 49
          Width = 76
          Height = 24
          MaxValue = 10
          MinValue = 1
          TabOrder = 1
          Value = 10
        end
        object ButtonAdminListAdd: TButton
          Left = 20
          Top = 130
          Width = 71
          Height = 31
          Caption = '??(&A)'
          TabOrder = 2
          OnClick = ButtonAdminListAddClick
        end
        object ButtonAdminListChange: TButton
          Left = 100
          Top = 130
          Width = 71
          Height = 31
          Caption = '??(&M)'
          TabOrder = 3
          OnClick = ButtonAdminListChangeClick
        end
        object ButtonAdminListDel: TButton
          Left = 180
          Top = 130
          Width = 71
          Height = 31
          Caption = '??(&D)'
          TabOrder = 4
          OnClick = ButtonAdminListDelClick
        end
        object EditAdminIPaddr: TEdit
          Left = 80
          Top = 80
          Width = 121
          Height = 23
          TabOrder = 5
        end
      end
      object ButtonAdminLitsSave: TButton
        Left = 580
        Top = 190
        Width = 71
        Height = 31
        Caption = '??(&S)'
        TabOrder = 2
        OnClick = ButtonAdminLitsSaveClick
      end
    end
  end
end
