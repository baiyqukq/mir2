object frmGameConfig: TfrmGameConfig
  Left = 279
  Top = 318
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Game Configurations'
  ClientHeight = 361
  ClientWidth = 629
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
  object GameConfigControl: TPageControl
    Left = 10
    Top = 2
    Width = 611
    Height = 321
    ActivePage = GeneralSheet
    MultiLine = True
    TabOrder = 0
    OnChanging = GameConfigControlChanging
    object GeneralSheet: TTabSheet
      Caption = 'General'
      ImageIndex = 2
      object GroupBoxInfo: TGroupBox
        Left = 210
        Top = 66
        Width = 181
        Height = 55
        Caption = 'Version:'
        TabOrder = 0
        object Label16: TLabel
          Left = 10
          Top = 25
          Width = 48
          Height = 15
          Caption = 'Number:'
        end
        object EditSoftVersionDate: TEdit
          Left = 80
          Top = 20
          Width = 91
          Height = 23
          Hint = '?????????,???????????????????,????????????????????????'
          TabOrder = 0
          Text = '20020522'
          OnChange = EditSoftVersionDateChange
        end
      end
      object GroupBox5: TGroupBox
        Left = 210
        Top = 6
        Width = 181
        Height = 55
        Caption = 'Console show user count'
        TabOrder = 1
        object Label17: TLabel
          Left = 10
          Top = 25
          Width = 31
          Height = 15
          Caption = 'Time:'
        end
        object EditConsoleShowUserCountTime: TSpinEdit
          Left = 85
          Top = 20
          Width = 76
          Height = 24
          Hint = '????????????????'
          EditorEnabled = False
          Increment = 10
          MaxValue = 2000
          MinValue = 10
          TabOrder = 0
          Value = 10
          OnChange = EditConsoleShowUserCountTimeChange
        end
      end
      object GroupBox6: TGroupBox
        Left = 10
        Top = 126
        Width = 191
        Height = 125
        Caption = 'Line info notices'
        TabOrder = 2
        object Label18: TLabel
          Left = 10
          Top = 25
          Width = 31
          Height = 15
          Caption = 'Time:'
        end
        object Label19: TLabel
          Left = 10
          Top = 55
          Width = 33
          Height = 15
          Caption = 'Color:'
        end
        object Label21: TLabel
          Left = 10
          Top = 85
          Width = 33
          Height = 15
          Caption = 'Prefix:'
        end
        object EditShowLineNoticeTime: TSpinEdit
          Left = 80
          Top = 19
          Width = 71
          Height = 24
          Hint = '????????????????'
          EditorEnabled = False
          Increment = 10
          MaxValue = 2000
          MinValue = 10
          TabOrder = 0
          Value = 10
          OnChange = EditShowLineNoticeTimeChange
        end
        object ComboBoxLineNoticeColor: TComboBox
          Left = 80
          Top = 50
          Width = 71
          Height = 23
          Hint = '???????????'
          Style = csDropDownList
          ItemHeight = 15
          TabOrder = 1
          OnChange = ComboBoxLineNoticeColorChange
        end
        object EditLineNoticePreFix: TEdit
          Left = 80
          Top = 80
          Width = 91
          Height = 23
          MaxLength = 20
          TabOrder = 2
          Text = '????'
          OnChange = EditLineNoticePreFixChange
        end
      end
      object ButtonGeneralSave: TButton
        Left = 460
        Top = 206
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 3
        OnClick = ButtonGeneralSaveClick
      end
      object GroupBox35: TGroupBox
        Left = 400
        Top = 0
        Width = 181
        Height = 111
        Caption = 'Messages'
        TabOrder = 4
        object CheckBoxShowMakeItemMsg: TCheckBox
          Left = 10
          Top = 18
          Width = 121
          Height = 21
          Caption = 'Show GM @Make'
          TabOrder = 0
          OnClick = CheckBoxShowMakeItemMsgClick
        end
        object CbViewHack: TCheckBox
          Left = 10
          Top = 38
          Width = 151
          Height = 21
          Caption = 'View hack attempts'
          TabOrder = 1
          OnClick = CbViewHackClick
        end
        object CkViewAdmfail: TCheckBox
          Left = 10
          Top = 58
          Width = 121
          Height = 21
          Caption = 'View admin fail'
          TabOrder = 2
          OnClick = CkViewAdmfailClick
        end
        object CheckBoxShowExceptionMsg: TCheckBox
          Left = 10
          Top = 78
          Width = 151
          Height = 21
          Caption = 'Show exception msgs'
          TabOrder = 3
          OnClick = CheckBoxShowExceptionMsgClick
        end
      end
      object GroupBox51: TGroupBox
        Left = 10
        Top = 6
        Width = 191
        Height = 115
        Caption = 'Online count'
        TabOrder = 5
        object Label98: TLabel
          Left = 10
          Top = 45
          Width = 29
          Height = 15
          Caption = 'Rate:'
        end
        object Label99: TLabel
          Left = 10
          Top = 75
          Width = 42
          Height = 15
          Caption = 'Interval:'
        end
        object Label100: TLabel
          Left = 170
          Top = 75
          Width = 9
          Height = 15
          Caption = 'M'
        end
        object EditSendOnlineCountRate: TSpinEdit
          Left = 55
          Top = 40
          Width = 66
          Height = 24
          Hint = '????????????,???????10,???10????,11 ??1.1??'
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 10
          TabOrder = 0
          Value = 10
          OnChange = EditSendOnlineCountRateChange
        end
        object EditSendOnlineTime: TSpinEdit
          Left = 85
          Top = 70
          Width = 76
          Height = 24
          Hint = '???????????'
          EditorEnabled = False
          Increment = 10
          MaxValue = 200000
          MinValue = 5
          TabOrder = 1
          Value = 10
          OnChange = EditSendOnlineTimeChange
        end
        object CheckBoxSendOnlineCount: TCheckBox
          Left = 10
          Top = 18
          Width = 111
          Height = 21
          Hint = '??????????????,???????????????????????'
          Caption = 'Send'
          TabOrder = 2
          OnClick = CheckBoxSendOnlineCountClick
        end
      end
      object GroupBox52: TGroupBox
        Left = 210
        Top = 130
        Width = 181
        Height = 121
        Caption = 'Power rates'
        TabOrder = 6
        object Label101: TLabel
          Left = 10
          Top = 25
          Width = 54
          Height = 15
          Caption = 'Monsters:'
        end
        object Label102: TLabel
          Left = 10
          Top = 55
          Width = 34
          Height = 15
          Caption = 'items:'
        end
        object Label103: TLabel
          Left = 10
          Top = 85
          Width = 19
          Height = 15
          Caption = 'AC:'
        end
        object EditMonsterPowerRate: TSpinEdit
          Left = 85
          Top = 20
          Width = 86
          Height = 24
          Hint = '??????(HP?MP?DC?MC?SC),???????????10?'
          EditorEnabled = False
          MaxValue = 20000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditMonsterPowerRateChange
        end
        object EditEditItemsPowerRate: TSpinEdit
          Left = 85
          Top = 50
          Width = 86
          Height = 24
          Hint = '??????(DC?MC?SC),???????????10?'
          EditorEnabled = False
          MaxValue = 20000000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditEditItemsPowerRateChange
        end
        object EditItemsACPowerRate: TSpinEdit
          Left = 85
          Top = 80
          Width = 86
          Height = 24
          Hint = '??????(AC?MAC??),???????????10?'
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 2
          Value = 10
          OnChange = EditItemsACPowerRateChange
        end
      end
      object GroupBox73: TGroupBox
        Left = 400
        Top = 120
        Width = 181
        Height = 61
        Caption = 'Clients'
        TabOrder = 7
        object CheckBoxCanOldClientLogon: TCheckBox
          Left = 10
          Top = 20
          Width = 161
          Height = 21
          Hint = '??????????????,?????,???????,??????????????'
          Caption = 'Allow old clients'
          TabOrder = 0
          OnClick = CheckBoxCanOldClientLogonClick
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Options(1)'
      ImageIndex = 7
      object GroupBox28: TGroupBox
        Left = 10
        Top = 10
        Width = 151
        Height = 111
        Caption = 'Server modes'
        TabOrder = 0
        object CheckBoxTestServer: TCheckBox
          Left = 10
          Top = 18
          Width = 91
          Height = 21
          Hint = '????,?????,?????????????????'
          Caption = 'TestServer'
          TabOrder = 0
          OnClick = CheckBoxTestServerClick
        end
        object CheckBoxServiceMode: TCheckBox
          Left = 10
          Top = 38
          Width = 91
          Height = 21
          Hint = '????,?????????????'
          Caption = 'ServiceMode'
          TabOrder = 1
          OnClick = CheckBoxServiceModeClick
        end
        object CheckBoxVentureMode: TCheckBox
          Left = 10
          Top = 58
          Width = 101
          Height = 21
          Caption = 'VentureMode'
          TabOrder = 2
          OnClick = CheckBoxVentureModeClick
        end
        object CheckBoxNonPKMode: TCheckBox
          Left = 10
          Top = 78
          Width = 101
          Height = 21
          Caption = 'No pking'
          TabOrder = 3
          OnClick = CheckBoxNonPKModeClick
        end
      end
      object GroupBox29: TGroupBox
        Left = 10
        Top = 130
        Width = 181
        Height = 121
        Caption = 'TestServer mode:'
        TabOrder = 1
        object Label61: TLabel
          Left = 10
          Top = 25
          Width = 32
          Height = 15
          Caption = 'Level:'
        end
        object Label62: TLabel
          Left = 10
          Top = 55
          Width = 29
          Height = 15
          Caption = 'Gold:'
        end
        object Label63: TLabel
          Left = 10
          Top = 85
          Width = 57
          Height = 15
          Caption = 'UserLimit:'
        end
        object EditTestLevel: TSpinEdit
          Left = 85
          Top = 20
          Width = 86
          Height = 24
          Hint = '???????'
          MaxValue = 20000
          MinValue = 0
          TabOrder = 0
          Value = 10
          OnChange = EditTestLevelChange
          OnKeyDown = EditTestLevelKeyDown
        end
        object EditTestGold: TSpinEdit
          Left = 85
          Top = 50
          Width = 86
          Height = 24
          Hint = '????????????'
          Increment = 1000
          MaxValue = 20000000
          MinValue = 0
          TabOrder = 1
          Value = 10
          OnChange = EditTestGoldChange
        end
        object EditTestUserLimit: TSpinEdit
          Left = 85
          Top = 80
          Width = 86
          Height = 24
          Hint = '??????????????'
          Increment = 10
          MaxValue = 2000
          MinValue = 0
          TabOrder = 2
          Value = 10
          OnChange = EditTestUserLimitChange
        end
      end
      object GroupBox30: TGroupBox
        Left = 380
        Top = 10
        Width = 161
        Height = 171
        Caption = 'Start permission'
        TabOrder = 2
        object Label60: TLabel
          Left = 10
          Top = 25
          Width = 10
          Height = 15
          Caption = '#:'
        end
        object EditStartPermission: TSpinEdit
          Left = 85
          Top = 20
          Width = 66
          Height = 24
          Hint = '????????,???0?'
          EditorEnabled = False
          MaxValue = 10
          MinValue = 0
          TabOrder = 0
          Value = 10
          OnChange = EditStartPermissionChange
        end
      end
      object ButtonOptionSave0: TButton
        Left = 460
        Top = 226
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 3
        OnClick = ButtonOptionSave0Click
      end
      object GroupBox31: TGroupBox
        Left = 200
        Top = 190
        Width = 131
        Height = 61
        Caption = 'User full:'
        TabOrder = 4
        object Label64: TLabel
          Left = 10
          Top = 25
          Width = 10
          Height = 15
          Caption = '#:'
        end
        object EditUserFull: TSpinEdit
          Left = 55
          Top = 20
          Width = 66
          Height = 24
          Hint = '?????????,??????????????'
          MaxValue = 10000
          MinValue = 0
          TabOrder = 0
          Value = 1000
          OnChange = EditUserFullChange
        end
      end
      object GroupBox33: TGroupBox
        Left = 170
        Top = 10
        Width = 201
        Height = 91
        Caption = 'Max gold'
        TabOrder = 5
        object Label68: TLabel
          Left = 10
          Top = 25
          Width = 68
          Height = 15
          Caption = 'Normal Max:'
        end
        object Label69: TLabel
          Left = 10
          Top = 55
          Width = 53
          Height = 15
          Caption = 'Trial max:'
        end
        object EditHumanMaxGold: TSpinEdit
          Left = 85
          Top = 20
          Width = 106
          Height = 24
          Increment = 10000
          MaxValue = 200000000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditHumanMaxGoldChange
        end
        object EditHumanTryModeMaxGold: TSpinEdit
          Left = 85
          Top = 50
          Width = 106
          Height = 24
          Increment = 10000
          MaxValue = 200000000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditHumanTryModeMaxGoldChange
        end
      end
      object GroupBox34: TGroupBox
        Left = 200
        Top = 105
        Width = 171
        Height = 76
        Caption = 'Trial'
        TabOrder = 6
        object Label70: TLabel
          Left = 10
          Top = 25
          Width = 52
          Height = 15
          Caption = 'Max level:'
        end
        object EditTryModeLevel: TSpinEdit
          Left = 85
          Top = 20
          Width = 76
          Height = 24
          EditorEnabled = False
          MaxValue = 100
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditTryModeLevelChange
        end
        object CheckBoxTryModeUseStorage: TCheckBox
          Left = 10
          Top = 48
          Width = 151
          Height = 21
          Hint = '???????????'
          Caption = 'Can use storage'
          TabOrder = 1
          OnClick = CheckBoxTryModeUseStorageClick
        end
      end
      object GroupBox19: TGroupBox
        Left = 340
        Top = 190
        Width = 111
        Height = 61
        Caption = 'Group members'
        TabOrder = 7
        object Label41: TLabel
          Left = 10
          Top = 25
          Width = 24
          Height = 15
          Caption = 'Max:'
        end
        object EditGroupMembersMax: TSpinEdit
          Left = 55
          Top = 20
          Width = 46
          Height = 24
          Hint = '???????'
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditGroupMembersMaxChange
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Map info'
      ImageIndex = 4
      object ButtonOptionSave: TButton
        Left = 460
        Top = 226
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 0
        OnClick = ButtonOptionSaveClick
      end
      object GroupBox16: TGroupBox
        Left = 10
        Top = 10
        Width = 131
        Height = 61
        Caption = 'SafeZone'
        TabOrder = 1
        object Label39: TLabel
          Left = 10
          Top = 25
          Width = 25
          Height = 15
          Caption = 'size:'
        end
        object EditSafeZoneSize: TSpinEdit
          Left = 55
          Top = 20
          Width = 56
          Height = 24
          Hint = '????????'
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditSafeZoneSizeChange
        end
      end
      object GroupBox18: TGroupBox
        Left = 10
        Top = 80
        Width = 131
        Height = 61
        Caption = 'StartPoint'
        TabOrder = 2
        object Label40: TLabel
          Left = 10
          Top = 25
          Width = 26
          Height = 15
          Caption = 'Size:'
        end
        object EditStartPointSize: TSpinEdit
          Left = 55
          Top = 20
          Width = 56
          Height = 24
          Hint = '???????,????????????'
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditStartPointSizeChange
        end
      end
      object GroupBox20: TGroupBox
        Left = 150
        Top = 10
        Width = 181
        Height = 111
        Caption = 'Red(pker) home map'
        TabOrder = 3
        object Label42: TLabel
          Left = 10
          Top = 55
          Width = 10
          Height = 15
          Caption = 'X:'
        end
        object Label43: TLabel
          Left = 10
          Top = 85
          Width = 10
          Height = 15
          Caption = 'Y:'
        end
        object Label44: TLabel
          Left = 10
          Top = 25
          Width = 26
          Height = 15
          Caption = 'Map:'
        end
        object EditRedHomeX: TSpinEdit
          Left = 65
          Top = 50
          Width = 66
          Height = 24
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditRedHomeXChange
        end
        object EditRedHomeY: TSpinEdit
          Left = 65
          Top = 80
          Width = 66
          Height = 24
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditRedHomeYChange
        end
        object EditRedHomeMap: TEdit
          Left = 65
          Top = 20
          Width = 91
          Height = 23
          Hint = '????????????'
          TabOrder = 2
          Text = '3'
          OnChange = EditRedHomeMapChange
        end
      end
      object GroupBox21: TGroupBox
        Left = 150
        Top = 130
        Width = 181
        Height = 111
        Caption = 'Red(pker) died home map'
        TabOrder = 4
        object Label45: TLabel
          Left = 10
          Top = 55
          Width = 10
          Height = 15
          Caption = 'X:'
        end
        object Label46: TLabel
          Left = 10
          Top = 85
          Width = 10
          Height = 15
          Caption = 'Y:'
        end
        object Label47: TLabel
          Left = 10
          Top = 25
          Width = 26
          Height = 15
          Caption = 'Map:'
        end
        object EditRedDieHomeX: TSpinEdit
          Left = 65
          Top = 50
          Width = 66
          Height = 24
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditRedDieHomeXChange
        end
        object EditRedDieHomeY: TSpinEdit
          Left = 65
          Top = 80
          Width = 66
          Height = 24
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditRedDieHomeYChange
        end
        object EditRedDieHomeMap: TEdit
          Left = 65
          Top = 20
          Width = 91
          Height = 23
          TabOrder = 2
          Text = '3'
          OnChange = EditRedDieHomeMapChange
        end
      end
      object GroupBox22: TGroupBox
        Left = 340
        Top = 10
        Width = 181
        Height = 111
        Caption = 'Normal Home map'
        TabOrder = 5
        object Label48: TLabel
          Left = 10
          Top = 55
          Width = 10
          Height = 15
          Caption = 'X:'
        end
        object Label49: TLabel
          Left = 10
          Top = 85
          Width = 10
          Height = 15
          Caption = 'Y:'
        end
        object Label50: TLabel
          Left = 10
          Top = 25
          Width = 26
          Height = 15
          Caption = 'Map:'
        end
        object EditHomeX: TSpinEdit
          Left = 65
          Top = 50
          Width = 66
          Height = 24
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditHomeXChange
        end
        object EditHomeY: TSpinEdit
          Left = 65
          Top = 80
          Width = 66
          Height = 24
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditHomeYChange
        end
        object EditHomeMap: TEdit
          Left = 65
          Top = 20
          Width = 91
          Height = 23
          TabOrder = 2
          Text = '3'
          OnChange = EditHomeMapChange
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Pking'
      ImageIndex = 6
      object ButtonOptionSave2: TButton
        Left = 460
        Top = 226
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 0
        OnClick = ButtonOptionSave2Click
      end
      object GroupBox23: TGroupBox
        Left = 10
        Top = 10
        Width = 191
        Height = 91
        Caption = 'Decrease pk points'
        TabOrder = 1
        object Label51: TLabel
          Left = 10
          Top = 25
          Width = 31
          Height = 15
          Caption = 'Time:'
        end
        object Label52: TLabel
          Left = 10
          Top = 55
          Width = 62
          Height = 15
          Caption = 'How much:'
        end
        object Label53: TLabel
          Left = 160
          Top = 25
          Width = 9
          Height = 15
          Caption = 'M'
        end
        object EditDecPkPointTime: TSpinEdit
          Left = 85
          Top = 20
          Width = 66
          Height = 24
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditDecPkPointTimeChange
        end
        object EditDecPkPointCount: TSpinEdit
          Left = 85
          Top = 50
          Width = 66
          Height = 24
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditDecPkPointCountChange
        end
      end
      object GroupBox24: TGroupBox
        Left = 10
        Top = 110
        Width = 131
        Height = 61
        Caption = 'PK Flag '
        TabOrder = 2
        object Label54: TLabel
          Left = 10
          Top = 25
          Width = 31
          Height = 15
          Caption = 'Time:'
        end
        object EditPKFlagTime: TSpinEdit
          Left = 55
          Top = 20
          Width = 66
          Height = 24
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditPKFlagTimeChange
        end
      end
      object GroupBox25: TGroupBox
        Left = 10
        Top = 180
        Width = 131
        Height = 61
        Caption = 'On Pk'
        TabOrder = 3
        object Label55: TLabel
          Left = 10
          Top = 25
          Width = 38
          Height = 15
          Caption = 'Points:'
        end
        object EditKillHumanAddPKPoint: TSpinEdit
          Left = 55
          Top = 20
          Width = 66
          Height = 24
          MaxValue = 2000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditKillHumanAddPKPointChange
        end
      end
      object GroupBox32: TGroupBox
        Left = 210
        Top = 10
        Width = 331
        Height = 211
        Caption = 'PK settings'
        TabOrder = 4
        object Label58: TLabel
          Left = 140
          Top = 25
          Width = 55
          Height = 15
          Caption = 'gain level:'
        end
        object Label65: TLabel
          Left = 140
          Top = 55
          Width = 55
          Height = 15
          Caption = 'lose level:'
        end
        object Label66: TLabel
          Left = 140
          Top = 85
          Width = 44
          Height = 15
          Caption = 'win exp:'
        end
        object Label56: TLabel
          Left = 140
          Top = 115
          Width = 49
          Height = 15
          Caption = 'lose exp:'
        end
        object Label67: TLabel
          Left = 10
          Top = 115
          Width = 62
          Height = 15
          Caption = 'Level differ:'
        end
        object Label114: TLabel
          Left = 140
          Top = 145
          Width = 88
          Height = 15
          Caption = 'PK Protect level:'
        end
        object Label115: TLabel
          Left = 111
          Top = 175
          Width = 113
          Height = 15
          Caption = 'Red PK protect level:'
        end
        object CheckBoxKillHumanWinLevel: TCheckBox
          Left = 10
          Top = 23
          Width = 121
          Height = 21
          Caption = 'Kill, gain level'
          TabOrder = 0
          OnClick = CheckBoxKillHumanWinLevelClick
        end
        object CheckBoxKilledLostLevel: TCheckBox
          Left = 10
          Top = 45
          Width = 121
          Height = 21
          Caption = 'Killed, lose level'
          TabOrder = 1
          OnClick = CheckBoxKilledLostLevelClick
        end
        object CheckBoxKilledLostExp: TCheckBox
          Left = 10
          Top = 85
          Width = 121
          Height = 21
          Caption = 'Killed, lose exp'
          TabOrder = 2
          OnClick = CheckBoxKilledLostExpClick
        end
        object CheckBoxKillHumanWinExp: TCheckBox
          Left = 10
          Top = 65
          Width = 121
          Height = 21
          Caption = 'Kill, win exp'
          TabOrder = 3
          OnClick = CheckBoxKillHumanWinExpClick
        end
        object EditKillHumanWinLevel: TSpinEdit
          Left = 230
          Top = 20
          Width = 91
          Height = 24
          EditorEnabled = False
          MaxValue = 100
          MinValue = 1
          TabOrder = 4
          Value = 10
          OnChange = EditKillHumanWinLevelChange
        end
        object EditKilledLostLevel: TSpinEdit
          Left = 230
          Top = 50
          Width = 91
          Height = 24
          EditorEnabled = False
          MaxValue = 100
          MinValue = 1
          TabOrder = 5
          Value = 10
          OnChange = EditKilledLostLevelChange
        end
        object EditKillHumanWinExp: TSpinEdit
          Left = 230
          Top = 80
          Width = 91
          Height = 24
          Increment = 1000
          MaxValue = 200000000
          MinValue = 1
          TabOrder = 6
          Value = 10
          OnChange = EditKillHumanWinExpChange
        end
        object EditKillHumanLostExp: TSpinEdit
          Left = 230
          Top = 110
          Width = 91
          Height = 24
          Increment = 1000
          MaxValue = 200000000
          MinValue = 1
          TabOrder = 7
          Value = 10
          OnChange = EditKillHumanLostExpChange
        end
        object EditHumanLevelDiffer: TSpinEdit
          Left = 70
          Top = 110
          Width = 61
          Height = 24
          EditorEnabled = False
          MaxValue = 100
          MinValue = 1
          TabOrder = 8
          Value = 10
          OnChange = EditHumanLevelDifferChange
        end
        object CheckBoxPKLevelProtect: TCheckBox
          Left = 10
          Top = 145
          Width = 111
          Height = 21
          Hint = 
            '??PK????,??????,??????????????????????????(????????????),???????' +
            '????????????????(????????????)?'
          Caption = 'PK Level Protect'
          TabOrder = 9
          OnClick = CheckBoxPKLevelProtectClick
        end
        object EditPKProtectLevel: TSpinEdit
          Left = 230
          Top = 140
          Width = 91
          Height = 24
          Hint = '???????????????,????????????'
          EditorEnabled = False
          MaxValue = 65535
          MinValue = 1
          TabOrder = 10
          Value = 10
          OnChange = EditPKProtectLevelChange
        end
        object EditRedPKProtectLevel: TSpinEdit
          Left = 230
          Top = 170
          Width = 91
          Height = 24
          Hint = 
            '????PK??,???????????????????????????????????????????????????????' +
            '?'
          EditorEnabled = False
          MaxValue = 65535
          MinValue = 1
          TabOrder = 11
          Value = 10
          OnChange = EditRedPKProtectLevelChange
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Options(2)'
      ImageIndex = 5
      object GroupBox17: TGroupBox
        Left = 350
        Top = 10
        Width = 191
        Height = 211
        TabOrder = 0
        object CheckBoxDisHumRun: TCheckBox
          Left = 13
          Top = 21
          Width = 124
          Height = 17
          Hint = '??????,???????????????'
          Caption = 'DisableHumRun'
          TabOrder = 0
          OnClick = CheckBoxDisHumRunClick
        end
        object CheckBoxRunHum: TCheckBox
          Left = 34
          Top = 40
          Width = 122
          Height = 16
          Hint = '??????,???????????'
          Caption = 'RunHum'
          TabOrder = 1
          OnClick = CheckBoxRunHumClick
        end
        object CheckBoxRunMon: TCheckBox
          Left = 34
          Top = 64
          Width = 124
          Height = 16
          Hint = '??????,?????????'
          Caption = 'RunMon'
          TabOrder = 2
          OnClick = CheckBoxRunMonClick
        end
        object CheckBoxWarDisHumRun: TCheckBox
          Left = 34
          Top = 126
          Width = 152
          Height = 17
          Hint = '??????,?????,????????'
          Caption = 'War Disable HumRun'
          TabOrder = 3
          OnClick = CheckBoxWarDisHumRunClick
        end
        object CheckBoxRunNpc: TCheckBox
          Left = 34
          Top = 84
          Width = 124
          Height = 16
          Hint = '??????,???????NPC'
          Caption = 'RunNPC'
          TabOrder = 4
          OnClick = CheckBoxRunNpcClick
        end
        object CheckBoxGMRunAll: TCheckBox
          Left = 34
          Top = 149
          Width = 152
          Height = 16
          Hint = '??????,????????????????'
          Caption = 'GM run always'
          TabOrder = 5
          OnClick = CheckBoxGMRunAllClick
        end
        object CheckBoxRunGuard: TCheckBox
          Left = 34
          Top = 104
          Width = 124
          Height = 16
          Hint = '??????,?????????(??????)'
          Caption = 'RunGuard'
          TabOrder = 6
          OnClick = CheckBoxRunGuardClick
        end
      end
      object ButtonOptionSave3: TButton
        Left = 460
        Top = 226
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 1
        OnClick = ButtonOptionSave3Click
      end
      object GroupBox53: TGroupBox
        Left = 10
        Top = 10
        Width = 161
        Height = 131
        Caption = 'Trading'
        TabOrder = 2
        object Label20: TLabel
          Left = 10
          Top = 25
          Width = 31
          Height = 15
          Caption = 'Time:'
        end
        object Label104: TLabel
          Left = 10
          Top = 55
          Width = 46
          Height = 15
          Caption = 'OkTime:'
        end
        object Label105: TLabel
          Left = 134
          Top = 25
          Width = 7
          Height = 15
          Caption = '?'
        end
        object Label106: TLabel
          Left = 134
          Top = 54
          Width = 7
          Height = 15
          Caption = '?'
        end
        object EditTryDealTime: TSpinEdit
          Left = 85
          Top = 20
          Width = 46
          Height = 24
          Hint = '?????,??????????????'
          EditorEnabled = False
          MaxValue = 10
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditTryDealTimeChange
        end
        object EditDealOKTime: TSpinEdit
          Left = 85
          Top = 50
          Width = 46
          Height = 24
          Hint = '???????,??????????????'
          EditorEnabled = False
          MaxValue = 10
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditDealOKTimeChange
        end
        object CheckBoxCanNotGetBackDeal: TCheckBox
          Left = 14
          Top = 80
          Width = 137
          Height = 16
          Hint = '??????,???????????????,????????????'
          Caption = 'Cannot get back'
          TabOrder = 2
          OnClick = CheckBoxCanNotGetBackDealClick
        end
        object CheckBoxDisableDeal: TCheckBox
          Left = 14
          Top = 100
          Width = 137
          Height = 16
          Hint = '?????,?????????????'
          Caption = 'Disable trading'
          TabOrder = 3
          OnClick = CheckBoxDisableDealClick
        end
      end
      object GroupBox26: TGroupBox
        Left = 10
        Top = 160
        Width = 161
        Height = 61
        Caption = 'GreenPosion(HP)'
        TabOrder = 3
        object Label57: TLabel
          Left = 10
          Top = 25
          Width = 52
          Height = 15
          Caption = 'Dec time:'
        end
        object EditPosionDecHealthTime: TSpinEdit
          Left = 85
          Top = 20
          Width = 66
          Height = 24
          Hint = '??????,??????????'
          Increment = 100
          MaxValue = 20000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditPosionDecHealthTimeChange
        end
      end
      object GroupBox27: TGroupBox
        Left = 180
        Top = 160
        Width = 161
        Height = 61
        Caption = 'RedPosion(AC)'
        TabOrder = 4
        object Label59: TLabel
          Left = 10
          Top = 25
          Width = 31
          Height = 15
          Caption = 'Time:'
        end
        object EditPosionDamagarmor: TSpinEdit
          Left = 55
          Top = 20
          Width = 66
          Height = 24
          Hint = '???????????????,?????10??????'
          EditorEnabled = False
          MaxValue = 20000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditPosionDamagarmorChange
        end
      end
      object GroupBox64: TGroupBox
        Left = 180
        Top = 10
        Width = 161
        Height = 141
        Caption = 'Dropping'
        TabOrder = 5
        object Label118: TLabel
          Left = 10
          Top = 55
          Width = 31
          Height = 15
          Caption = 'Price:'
        end
        object Label119: TLabel
          Left = 10
          Top = 85
          Width = 75
          Height = 15
          Caption = 'Drop amount:'
        end
        object EditCanDropPrice: TSpinEdit
          Left = 85
          Top = 50
          Width = 66
          Height = 24
          Hint = '????????,???????,????????'
          Increment = 100
          MaxValue = 20000000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditCanDropPriceChange
        end
        object CheckBoxControlDropItem: TCheckBox
          Left = 14
          Top = 25
          Width = 137
          Height = 16
          Hint = '??????,?????????????????,?????????????????????,?????????'
          Caption = 'Control dropping'
          TabOrder = 1
          OnClick = CheckBoxControlDropItemClick
        end
        object EditCanDropGold: TSpinEdit
          Left = 85
          Top = 80
          Width = 66
          Height = 24
          Hint = '?????????,??????'
          Increment = 100
          MaxValue = 20000000
          MinValue = 1
          TabOrder = 2
          Value = 10
          OnChange = EditCanDropGoldChange
        end
        object CheckBoxIsSafeDisableDrop: TCheckBox
          Left = 14
          Top = 115
          Width = 137
          Height = 16
          Hint = '??????,????????????'
          Caption = 'Disable drops in SZ'
          TabOrder = 3
          OnClick = CheckBoxIsSafeDisableDropClick
        end
      end
    end
    object GameSpeedSheet: TTabSheet
      Caption = 'Game Speed'
      object GroupBox1: TGroupBox
        Left = 10
        Top = 10
        Width = 121
        Height = 251
        Caption = 'Times'
        TabOrder = 0
        object Label1: TLabel
          Left = 14
          Top = 30
          Width = 18
          Height = 15
          Caption = 'Hit:'
        end
        object Label2: TLabel
          Left = 14
          Top = 60
          Width = 35
          Height = 15
          Caption = 'Magic:'
        end
        object Label3: TLabel
          Left = 14
          Top = 90
          Width = 26
          Height = 15
          Caption = 'Run:'
        end
        object Label4: TLabel
          Left = 14
          Top = 120
          Width = 30
          Height = 15
          Caption = 'Walk:'
        end
        object Label5: TLabel
          Left = 14
          Top = 180
          Width = 29
          Height = 15
          Caption = 'Mine:'
          Enabled = False
        end
        object Label6: TLabel
          Left = 14
          Top = 150
          Width = 28
          Height = 15
          Caption = 'Turn:'
        end
        object EditHitIntervalTime: TSpinEdit
          Left = 55
          Top = 25
          Width = 56
          Height = 24
          EditorEnabled = False
          Increment = 10
          MaxValue = 2000
          MinValue = 10
          TabOrder = 0
          Value = 900
          OnChange = EditHitIntervalTimeChange
        end
        object EditMagicHitIntervalTime: TSpinEdit
          Left = 55
          Top = 55
          Width = 56
          Height = 24
          EditorEnabled = False
          Increment = 10
          MaxValue = 2000
          MinValue = 10
          TabOrder = 1
          Value = 800
          OnChange = EditMagicHitIntervalTimeChange
        end
        object EditRunIntervalTime: TSpinEdit
          Left = 55
          Top = 85
          Width = 56
          Height = 24
          EditorEnabled = False
          Increment = 10
          MaxValue = 2000
          MinValue = 10
          TabOrder = 2
          Value = 600
          OnChange = EditRunIntervalTimeChange
        end
        object EditWalkIntervalTime: TSpinEdit
          Left = 55
          Top = 115
          Width = 56
          Height = 24
          EditorEnabled = False
          Increment = 10
          MaxValue = 2000
          MinValue = 10
          TabOrder = 3
          Value = 600
          OnChange = EditWalkIntervalTimeChange
        end
        object EditTurnIntervalTime: TSpinEdit
          Left = 55
          Top = 145
          Width = 56
          Height = 24
          EditorEnabled = False
          Increment = 10
          MaxValue = 2000
          MinValue = 10
          TabOrder = 4
          Value = 600
          OnChange = EditTurnIntervalTimeChange
        end
        object EditDigUpIntervalTime: TSpinEdit
          Left = 55
          Top = 175
          Width = 56
          Height = 24
          EditorEnabled = False
          Enabled = False
          Increment = 10
          MaxValue = 2000
          MinValue = 10
          TabOrder = 5
          Value = 10
          OnChange = EditWalkIntervalTimeChange
        end
      end
      object GroupBox2: TGroupBox
        Left = 140
        Top = 10
        Width = 101
        Height = 251
        Caption = 'Max counts'
        TabOrder = 1
        object Label7: TLabel
          Left = 14
          Top = 30
          Width = 18
          Height = 15
          Caption = 'Hit:'
        end
        object Label8: TLabel
          Left = 14
          Top = 60
          Width = 35
          Height = 15
          Caption = 'Magic:'
        end
        object Label9: TLabel
          Left = 14
          Top = 90
          Width = 26
          Height = 15
          Caption = 'Run:'
        end
        object Label10: TLabel
          Left = 14
          Top = 120
          Width = 30
          Height = 15
          Caption = 'Walk:'
        end
        object Label11: TLabel
          Left = 14
          Top = 180
          Width = 29
          Height = 15
          Caption = 'Mine:'
        end
        object Label12: TLabel
          Left = 14
          Top = 150
          Width = 28
          Height = 15
          Caption = 'Turn:'
        end
        object EditMaxHitMsgCount: TSpinEdit
          Left = 55
          Top = 25
          Width = 36
          Height = 24
          Hint = '????????,??????1(?????,??????????)'
          EditorEnabled = False
          MaxValue = 50
          MinValue = 1
          TabOrder = 0
          Value = 2
          OnChange = EditMaxHitMsgCountChange
        end
        object EditMaxSpellMsgCount: TSpinEdit
          Left = 55
          Top = 55
          Width = 36
          Height = 24
          Hint = '????????,??????1(?????,??????????)'
          EditorEnabled = False
          MaxValue = 50
          MinValue = 1
          TabOrder = 1
          Value = 2
          OnChange = EditMaxSpellMsgCountChange
        end
        object EditMaxRunMsgCount: TSpinEdit
          Left = 55
          Top = 85
          Width = 36
          Height = 24
          Hint = '????????,??????1(?????,??????????)'
          EditorEnabled = False
          MaxValue = 50
          MinValue = 1
          TabOrder = 2
          Value = 2
          OnChange = EditMaxRunMsgCountChange
        end
        object EditMaxWalkMsgCount: TSpinEdit
          Left = 55
          Top = 115
          Width = 36
          Height = 24
          Hint = '????????,??????1(?????,??????????)'
          EditorEnabled = False
          MaxValue = 50
          MinValue = 1
          TabOrder = 3
          Value = 2
          OnChange = EditMaxWalkMsgCountChange
        end
        object EditMaxTurnMsgCount: TSpinEdit
          Left = 55
          Top = 145
          Width = 36
          Height = 24
          Hint = '????????,??????1(?????,??????????)'
          EditorEnabled = False
          MaxValue = 50
          MinValue = 1
          TabOrder = 4
          Value = 2
          OnChange = EditMaxTurnMsgCountChange
        end
        object EditMaxDigUpMsgCount: TSpinEdit
          Left = 55
          Top = 175
          Width = 36
          Height = 24
          Hint = '????????,??????1(?????,??????????)'
          EditorEnabled = False
          MaxValue = 50
          MinValue = 1
          TabOrder = 5
          Value = 2
          OnChange = EditMaxDigUpMsgCountChange
        end
      end
      object GroupBox3: TGroupBox
        Left = 450
        Top = 90
        Width = 141
        Height = 61
        Caption = 'Item speed time'
        TabOrder = 2
        object Label13: TLabel
          Left = 24
          Top = 30
          Width = 31
          Height = 15
          Caption = 'Time:'
        end
        object EditItemSpeedTime: TSpinEdit
          Left = 75
          Top = 25
          Width = 56
          Height = 24
          Hint = '????????,??????,?????'
          EditorEnabled = False
          MaxValue = 50
          MinValue = 1
          TabOrder = 0
          Value = 50
          OnChange = EditItemSpeedTimeChange
        end
      end
      object ButtonGameSpeedSave: TButton
        Left = 510
        Top = 226
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 3
        OnClick = ButtonGameSpeedSaveClick
      end
      object GroupBox4: TGroupBox
        Left = 450
        Top = 10
        Width = 141
        Height = 71
        Caption = 'Modes'
        TabOrder = 4
        object RadioButtonDelyMode: TRadioButton
          Left = 10
          Top = 20
          Width = 121
          Height = 21
          Hint = '??????????????,???????,?????????????????????'
          Caption = 'DelayMode'
          TabOrder = 0
          OnClick = RadioButtonDelyModeClick
        end
        object RadioButtonFilterMode: TRadioButton
          Left = 10
          Top = 40
          Width = 121
          Height = 21
          Hint = '??????????????,????????,??????????????????,??????'
          Caption = 'FilterMode'
          TabOrder = 1
          OnClick = RadioButtonFilterModeClick
        end
      end
      object GroupBox7: TGroupBox
        Left = 250
        Top = 160
        Width = 161
        Height = 101
        Caption = 'SM_STRUCK'
        TabOrder = 5
        object Label22: TLabel
          Left = 14
          Top = 30
          Width = 31
          Height = 15
          Caption = 'Time:'
        end
        object EditStruckTime: TSpinEdit
          Left = 85
          Top = 25
          Width = 66
          Height = 24
          EditorEnabled = False
          MaxValue = 1000
          MinValue = 10
          TabOrder = 0
          Value = 100
          OnChange = EditStruckTimeChange
        end
        object CheckBoxDisableStruck: TCheckBox
          Left = 14
          Top = 56
          Width = 131
          Height = 22
          Caption = 'Disable struck'
          TabOrder = 1
          OnClick = CheckBoxDisableStruckClick
        end
        object CheckBoxDisableSelfStruck: TCheckBox
          Left = 14
          Top = 76
          Width = 131
          Height = 22
          Caption = 'Disable self struck'
          TabOrder = 2
          OnClick = CheckBoxDisableSelfStruckClick
        end
      end
      object GroupBox15: TGroupBox
        Left = 250
        Top = 10
        Width = 191
        Height = 141
        TabOrder = 6
        object Label38: TLabel
          Left = 14
          Top = 110
          Width = 34
          Height = 15
          Caption = 'ksh-#:'
        end
        object Label142: TLabel
          Left = 94
          Top = 110
          Width = 28
          Height = 15
          Caption = 'drop:'
        end
        object EditOverSpeedKickCount: TSpinEdit
          Left = 55
          Top = 105
          Width = 36
          Height = 24
          Hint = '????,???????????'
          EditorEnabled = False
          MaxValue = 50
          MinValue = 1
          TabOrder = 0
          Value = 4
          OnChange = EditOverSpeedKickCountChange
        end
        object CheckBoxboKickOverSpeed: TCheckBox
          Left = 10
          Top = 79
          Width = 171
          Height = 21
          Hint = '????????????'
          Caption = 'Kick speed hackers'
          TabOrder = 1
          OnClick = CheckBoxboKickOverSpeedClick
        end
        object EditDropOverSpeed: TSpinEdit
          Left = 130
          Top = 105
          Width = 51
          Height = 24
          Hint = '????????,??????,?????????????????(??)'
          EditorEnabled = False
          Increment = 10
          MaxValue = 1000
          MinValue = 1
          TabOrder = 2
          Value = 50
          OnChange = EditDropOverSpeedChange
        end
        object CheckBoxSpellSendUpdateMsg: TCheckBox
          Left = 10
          Top = 39
          Width = 161
          Height = 21
          Hint = '??????????????,?????????????'
          Caption = 'Spell SendUpdateMsg'
          TabOrder = 3
          OnClick = CheckBoxSpellSendUpdateMsgClick
        end
        object CheckBoxActionSendActionMsg: TCheckBox
          Left = 10
          Top = 59
          Width = 161
          Height = 21
          Hint = '??????????????,?????????????'
          Caption = 'Send ActionMsg'
          TabOrder = 4
          OnClick = CheckBoxActionSendActionMsgClick
        end
      end
      object ButtonGameSpeedDefault: TButton
        Left = 420
        Top = 225
        Width = 81
        Height = 31
        Caption = '&Default'
        TabOrder = 7
        OnClick = ButtonGameSpeedDefaultClick
      end
      object ButtonActionSpeedConfig: TButton
        Left = 450
        Top = 185
        Width = 141
        Height = 31
        Caption = '&Action speed config'
        TabOrder = 8
        OnClick = ButtonActionSpeedConfigClick
      end
    end
    object TabSheet10: TTabSheet
      Caption = 'Paralyse'
      ImageIndex = 13
      object ButtonCharStatusSave: TButton
        Left = 460
        Top = 226
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 0
        OnClick = ButtonCharStatusSaveClick
      end
      object GroupBox72: TGroupBox
        Left = 10
        Top = 10
        Width = 161
        Height = 111
        Caption = 'Paralised'
        TabOrder = 1
        object CheckBoxParalyCanRun: TCheckBox
          Left = 10
          Top = 20
          Width = 91
          Height = 21
          Hint = '????????????,???????'
          Caption = 'Can run'
          TabOrder = 0
          OnClick = CheckBoxParalyCanRunClick
        end
        object CheckBoxParalyCanWalk: TCheckBox
          Left = 10
          Top = 40
          Width = 91
          Height = 21
          Hint = '????????????,???????'
          Caption = 'Can walk'
          TabOrder = 1
          OnClick = CheckBoxParalyCanWalkClick
        end
        object CheckBoxParalyCanHit: TCheckBox
          Left = 10
          Top = 60
          Width = 91
          Height = 21
          Hint = '????????????,???????'
          Caption = 'Can hit'
          TabOrder = 2
          OnClick = CheckBoxParalyCanHitClick
        end
        object CheckBoxParalyCanSpell: TCheckBox
          Left = 10
          Top = 80
          Width = 135
          Height = 21
          Hint = '????????????,???????'
          Caption = 'Can use magic'
          TabOrder = 3
          OnClick = CheckBoxParalyCanSpellClick
        end
      end
    end
    object ExpSheet: TTabSheet
      Caption = 'Exp'
      ImageIndex = 1
      object GroupBox8: TGroupBox
        Left = 350
        Top = 10
        Width = 191
        Height = 91
        Caption = 'Kill mon exp multiplier'
        TabOrder = 0
        object Label23: TLabel
          Left = 14
          Top = 30
          Width = 10
          Height = 15
          Caption = '#:'
        end
        object EditKillMonExpMultiple: TSpinEdit
          Left = 55
          Top = 25
          Width = 66
          Height = 24
          EditorEnabled = False
          MaxValue = 2000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditKillMonExpMultipleChange
        end
        object CheckBoxHighLevelKillMonFixExp: TCheckBox
          Left = 14
          Top = 56
          Width = 167
          Height = 22
          Caption = 'HighLevelKillMonsters fix'
          TabOrder = 1
          OnClick = CheckBoxHighLevelKillMonFixExpClick
        end
      end
      object ButtonExpSave: TButton
        Left = 460
        Top = 206
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 1
        OnClick = ButtonExpSaveClick
      end
      object GroupBoxLevelExp: TGroupBox
        Left = 10
        Top = 10
        Width = 211
        Height = 231
        Caption = 'Level&+exp'
        TabOrder = 2
        object Label37: TLabel
          Left = 14
          Top = 206
          Width = 23
          Height = 15
          Caption = 'Exp:'
        end
        object ComboBoxLevelExp: TComboBox
          Left = 60
          Top = 200
          Width = 141
          Height = 23
          Style = csDropDownList
          ItemHeight = 0
          TabOrder = 0
          OnClick = ComboBoxLevelExpClick
        end
        object GridLevelExp: TStringGrid
          Left = 10
          Top = 20
          Width = 191
          Height = 171
          ColCount = 2
          DefaultRowHeight = 18
          RowCount = 501
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goEditing]
          TabOrder = 1
          OnSetEditText = GridLevelExpSetEditText
          ColWidths = (
            64
            67)
          RowHeights = (
            18
            18
            19
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18)
        end
      end
    end
    object CastleSheet: TTabSheet
      Caption = 'Castle'
      ImageIndex = 3
      object GroupBox9: TGroupBox
        Left = 10
        Top = 10
        Width = 201
        Height = 141
        Caption = 'Costs'
        TabOrder = 0
        object Label24: TLabel
          Left = 14
          Top = 20
          Width = 67
          Height = 15
          Caption = 'RepairDoor:'
        end
        object Label25: TLabel
          Left = 14
          Top = 50
          Width = 64
          Height = 15
          Caption = 'RepairWall:'
        end
        object Label26: TLabel
          Left = 14
          Top = 80
          Width = 61
          Height = 15
          Caption = 'HireArcher:'
        end
        object Label27: TLabel
          Left = 14
          Top = 110
          Width = 60
          Height = 15
          Caption = 'HireGuard:'
        end
        object EditRepairDoorPrice: TSpinEdit
          Left = 90
          Top = 15
          Width = 101
          Height = 24
          Increment = 10000
          MaxValue = 100000000
          MinValue = 10000
          TabOrder = 0
          Value = 2000000
          OnChange = EditRepairDoorPriceChange
        end
        object EditRepairWallPrice: TSpinEdit
          Left = 90
          Top = 45
          Width = 101
          Height = 24
          Increment = 10000
          MaxValue = 100000000
          MinValue = 10000
          TabOrder = 1
          Value = 500000
          OnChange = EditRepairWallPriceChange
        end
        object EditHireArcherPrice: TSpinEdit
          Left = 90
          Top = 75
          Width = 101
          Height = 24
          Increment = 10000
          MaxValue = 100000000
          MinValue = 10000
          TabOrder = 2
          Value = 300000
          OnChange = EditHireArcherPriceChange
        end
        object EditHireGuardPrice: TSpinEdit
          Left = 90
          Top = 105
          Width = 101
          Height = 24
          Increment = 10000
          MaxValue = 100000000
          MinValue = 10000
          TabOrder = 3
          Value = 300000
          OnChange = EditHireGuardPriceChange
        end
      end
      object GroupBox10: TGroupBox
        Left = 10
        Top = 156
        Width = 201
        Height = 85
        Caption = 'Castles max gold'
        TabOrder = 1
        object Label31: TLabel
          Left = 14
          Top = 20
          Width = 24
          Height = 15
          Caption = 'Max:'
        end
        object Label32: TLabel
          Left = 14
          Top = 50
          Width = 47
          Height = 15
          Caption = 'Per-Day:'
        end
        object EditCastleGoldMax: TSpinEdit
          Left = 90
          Top = 15
          Width = 101
          Height = 24
          Increment = 10000
          MaxValue = 100000000
          MinValue = 10000
          TabOrder = 0
          Value = 10000000
          OnChange = EditCastleGoldMaxChange
        end
        object EditCastleOneDayGold: TSpinEdit
          Left = 90
          Top = 45
          Width = 101
          Height = 24
          Increment = 10000
          MaxValue = 100000000
          MinValue = 10000
          TabOrder = 1
          Value = 2000000
          OnChange = EditCastleOneDayGoldChange
        end
      end
      object GroupBox11: TGroupBox
        Left = 370
        Top = 73
        Width = 151
        Height = 108
        Caption = 'Castle home map'
        TabOrder = 2
        object Label28: TLabel
          Left = 14
          Top = 20
          Width = 26
          Height = 15
          Caption = 'Map:'
        end
        object Label29: TLabel
          Left = 14
          Top = 50
          Width = 10
          Height = 15
          Caption = 'X:'
        end
        object Label30: TLabel
          Left = 14
          Top = 80
          Width = 10
          Height = 15
          Caption = 'Y:'
        end
        object EditCastleHomeX: TSpinEdit
          Left = 70
          Top = 45
          Width = 71
          Height = 24
          MaxValue = 1000
          MinValue = 1
          TabOrder = 0
          Value = 644
          OnChange = EditCastleHomeXChange
        end
        object EditCastleHomeY: TSpinEdit
          Left = 70
          Top = 75
          Width = 71
          Height = 24
          MaxValue = 1000
          MinValue = 1
          TabOrder = 1
          Value = 290
          OnChange = EditCastleHomeYChange
        end
        object EditCastleHomeMap: TEdit
          Left = 70
          Top = 15
          Width = 71
          Height = 23
          MaxLength = 20
          TabOrder = 2
          Text = '3'
          OnChange = EditCastleHomeMapChange
        end
      end
      object GroupBox12: TGroupBox
        Left = 220
        Top = 10
        Width = 141
        Height = 79
        Caption = 'War range'
        TabOrder = 3
        object Label34: TLabel
          Left = 14
          Top = 20
          Width = 10
          Height = 15
          Caption = 'X:'
        end
        object Label35: TLabel
          Left = 14
          Top = 50
          Width = 10
          Height = 15
          Caption = 'Y:'
        end
        object EditWarRangeX: TSpinEdit
          Left = 70
          Top = 15
          Width = 61
          Height = 24
          MaxValue = 1000
          MinValue = 1
          TabOrder = 0
          Value = 100
          OnChange = EditWarRangeXChange
        end
        object EditWarRangeY: TSpinEdit
          Left = 70
          Top = 45
          Width = 61
          Height = 24
          MaxValue = 1000
          MinValue = 1
          TabOrder = 1
          Value = 100
          OnChange = EditWarRangeYChange
        end
      end
      object ButtonCastleSave: TButton
        Left = 460
        Top = 206
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 4
        OnClick = ButtonCastleSaveClick
      end
      object GroupBox13: TGroupBox
        Left = 220
        Top = 93
        Width = 141
        Height = 78
        Caption = 'Taxs'
        TabOrder = 5
        object Label36: TLabel
          Left = 14
          Top = 50
          Width = 48
          Height = 15
          Caption = 'TaxRate:'
        end
        object EditTaxRate: TSpinEdit
          Left = 70
          Top = 45
          Width = 61
          Height = 24
          MaxValue = 1000
          MinValue = 1
          TabOrder = 0
          Value = 5
          OnChange = EditTaxRateChange
        end
        object CheckBoxGetAllNpcTax: TCheckBox
          Left = 14
          Top = 16
          Width = 117
          Height = 22
          Caption = 'All Npcs Tax'
          TabOrder = 1
          OnClick = CheckBoxGetAllNpcTaxClick
        end
      end
      object GroupBox14: TGroupBox
        Left = 370
        Top = 10
        Width = 151
        Height = 55
        Caption = 'Castle name'
        TabOrder = 6
        object Label33: TLabel
          Left = 10
          Top = 25
          Width = 37
          Height = 15
          Caption = 'Name:'
        end
        object EditCastleName: TEdit
          Left = 50
          Top = 20
          Width = 91
          Height = 23
          TabOrder = 0
          Text = '???'
          OnChange = EditCastleNameChange
        end
      end
      object GroupBox54: TGroupBox
        Left = 220
        Top = 183
        Width = 197
        Height = 58
        Caption = 'CastleMember prices - % off'
        TabOrder = 7
        object Label107: TLabel
          Left = 14
          Top = 20
          Width = 14
          Height = 15
          Caption = '%:'
        end
        object EditCastleMemberPriceRate: TSpinEdit
          Left = 70
          Top = 15
          Width = 61
          Height = 24
          Hint = '???????????????????????'
          MaxValue = 200
          MinValue = 10
          TabOrder = 0
          Value = 10
          OnChange = EditCastleMemberPriceRateChange
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Chatting'
      ImageIndex = 8
      object GroupBox36: TGroupBox
        Left = 10
        Top = 10
        Width = 161
        Height = 91
        Caption = 'Message limits'
        TabOrder = 0
        object Label71: TLabel
          Left = 14
          Top = 30
          Width = 70
          Height = 15
          Caption = 'Normal chat:'
        end
        object Label72: TLabel
          Left = 14
          Top = 60
          Width = 55
          Height = 15
          Caption = 'GM shout:'
        end
        object EditSayMsgMaxLen: TSpinEdit
          Left = 85
          Top = 25
          Width = 66
          Height = 24
          Hint = '???????????'
          MaxValue = 255
          MinValue = 1
          TabOrder = 0
          Value = 50
          OnChange = EditSayMsgMaxLenChange
        end
        object EditSayRedMsgMaxLen: TSpinEdit
          Left = 85
          Top = 55
          Width = 66
          Height = 24
          Hint = 'GM????????????'
          MaxValue = 255
          MinValue = 1
          TabOrder = 1
          Value = 50
          OnChange = EditSayRedMsgMaxLenChange
        end
      end
      object GroupBox37: TGroupBox
        Left = 10
        Top = 110
        Width = 161
        Height = 61
        Caption = 'Can shout level'
        TabOrder = 1
        object Label73: TLabel
          Left = 14
          Top = 30
          Width = 28
          Height = 15
          Caption = 'level:'
        end
        object EditCanShoutMsgLevel: TSpinEdit
          Left = 85
          Top = 25
          Width = 66
          Height = 24
          Hint = '??????,?????????????????'
          MaxValue = 65535
          MinValue = 1
          TabOrder = 0
          Value = 50
          OnChange = EditCanShoutMsgLevelChange
        end
      end
      object GroupBox38: TGroupBox
        Left = 180
        Top = 10
        Width = 171
        Height = 81
        Caption = 'GM shouts'
        TabOrder = 2
        object Label75: TLabel
          Left = 14
          Top = 50
          Width = 80
          Height = 15
          Caption = 'GMShout cmd:'
        end
        object CheckBoxShutRedMsgShowGMName: TCheckBox
          Left = 10
          Top = 20
          Width = 131
          Height = 21
          Hint = 'GM?????????????????????'
          Caption = 'Show GM name'
          TabOrder = 0
          OnClick = CheckBoxShutRedMsgShowGMNameClick
        end
        object EditGMRedMsgCmd: TEdit
          Left = 98
          Top = 46
          Width = 51
          Height = 23
          Hint = '?????????????????'#8216'!'#8217'?'
          MaxLength = 20
          TabOrder = 1
          OnChange = EditGMRedMsgCmdChange
        end
      end
      object ButtonMsgSave: TButton
        Left = 460
        Top = 206
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 3
        OnClick = ButtonMsgSaveClick
      end
      object GroupBox68: TGroupBox
        Left = 180
        Top = 100
        Width = 171
        Height = 121
        Caption = 'Normal chat'
        TabOrder = 4
        object Label135: TLabel
          Left = 14
          Top = 30
          Width = 28
          Height = 15
          Caption = 'Time'
        end
        object Label138: TLabel
          Left = 14
          Top = 60
          Width = 36
          Height = 15
          Caption = 'Count:'
        end
        object Label139: TLabel
          Left = 6
          Top = 90
          Width = 74
          Height = 15
          Caption = 'DisableTime:'
        end
        object Label140: TLabel
          Left = 144
          Top = 30
          Width = 9
          Height = 15
          Caption = 'M'
        end
        object Label141: TLabel
          Left = 144
          Top = 90
          Width = 9
          Height = 15
          Caption = 'M'
        end
        object EditSayMsgTime: TSpinEdit
          Left = 85
          Top = 25
          Width = 56
          Height = 24
          MaxValue = 1000000
          MinValue = 1
          TabOrder = 0
          Value = 50
          OnChange = EditSayMsgTimeChange
        end
        object EditSayMsgCount: TSpinEdit
          Left = 85
          Top = 55
          Width = 56
          Height = 24
          MaxValue = 255
          MinValue = 1
          TabOrder = 1
          Value = 50
          OnChange = EditSayMsgCountChange
        end
        object EditDisableSayMsgTime: TSpinEdit
          Left = 85
          Top = 85
          Width = 56
          Height = 24
          MaxValue = 100000
          MinValue = 1
          TabOrder = 2
          Value = 50
          OnChange = EditDisableSayMsgTimeChange
        end
      end
      object GroupBox71: TGroupBox
        Left = 10
        Top = 180
        Width = 161
        Height = 61
        Caption = 'Show prefix on msgs'
        TabOrder = 5
        object CheckBoxShowPreFixMsg: TCheckBox
          Left = 10
          Top = 20
          Width = 131
          Height = 21
          Hint = '?????????????????????'
          Caption = 'show?'
          TabOrder = 0
          OnClick = CheckBoxShowPreFixMsgClick
        end
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'Chat colors'
      ImageIndex = 11
      object ButtonMsgColorSave: TButton
        Left = 460
        Top = 206
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 0
        OnClick = ButtonMsgColorSaveClick
      end
      object GroupBox55: TGroupBox
        Left = 10
        Top = 10
        Width = 131
        Height = 79
        Caption = 'Normal'
        TabOrder = 1
        object Label108: TLabel
          Left = 14
          Top = 20
          Width = 27
          Height = 15
          Caption = 'Font:'
        end
        object Label109: TLabel
          Left = 14
          Top = 50
          Width = 20
          Height = 15
          Caption = 'BG:'
        end
        object LabeltHearMsgFColor: TLabel
          Left = 110
          Top = 18
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelHearMsgBColor: TLabel
          Left = 110
          Top = 48
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditHearMsgFColor: TSpinEdit
          Left = 50
          Top = 15
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditHearMsgFColorChange
        end
        object EdittHearMsgBColor: TSpinEdit
          Left = 50
          Top = 45
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EdittHearMsgBColorChange
        end
      end
      object GroupBox56: TGroupBox
        Left = 10
        Top = 90
        Width = 131
        Height = 79
        Caption = 'Whispers'
        TabOrder = 2
        object Label110: TLabel
          Left = 14
          Top = 20
          Width = 27
          Height = 15
          Caption = 'Font:'
        end
        object Label111: TLabel
          Left = 14
          Top = 50
          Width = 20
          Height = 15
          Caption = 'BG:'
        end
        object LabelWhisperMsgFColor: TLabel
          Left = 110
          Top = 18
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelWhisperMsgBColor: TLabel
          Left = 110
          Top = 48
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditWhisperMsgFColor: TSpinEdit
          Left = 50
          Top = 15
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditWhisperMsgFColorChange
        end
        object EditWhisperMsgBColor: TSpinEdit
          Left = 50
          Top = 45
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditWhisperMsgBColorChange
        end
      end
      object GroupBox57: TGroupBox
        Left = 10
        Top = 170
        Width = 131
        Height = 79
        Caption = 'Whisper from GM'
        TabOrder = 3
        object Label112: TLabel
          Left = 14
          Top = 20
          Width = 27
          Height = 15
          Caption = 'Font:'
        end
        object Label113: TLabel
          Left = 14
          Top = 50
          Width = 20
          Height = 15
          Caption = 'BG:'
        end
        object LabelGMWhisperMsgFColor: TLabel
          Left = 110
          Top = 18
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelGMWhisperMsgBColor: TLabel
          Left = 110
          Top = 48
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditGMWhisperMsgFColor: TSpinEdit
          Left = 50
          Top = 15
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditGMWhisperMsgFColorChange
        end
        object EditGMWhisperMsgBColor: TSpinEdit
          Left = 50
          Top = 45
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditGMWhisperMsgBColorChange
        end
      end
      object GroupBox58: TGroupBox
        Left = 150
        Top = 10
        Width = 131
        Height = 79
        Caption = 'GMShout'
        TabOrder = 4
        object Label116: TLabel
          Left = 14
          Top = 20
          Width = 27
          Height = 15
          Caption = 'Font:'
        end
        object Label117: TLabel
          Left = 14
          Top = 50
          Width = 20
          Height = 15
          Caption = 'BG:'
        end
        object LabelRedMsgFColor: TLabel
          Left = 110
          Top = 18
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelRedMsgBColor: TLabel
          Left = 110
          Top = 48
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditRedMsgFColor: TSpinEdit
          Left = 50
          Top = 15
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditRedMsgFColorChange
        end
        object EditRedMsgBColor: TSpinEdit
          Left = 50
          Top = 45
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditRedMsgBColorChange
        end
      end
      object GroupBox59: TGroupBox
        Left = 150
        Top = 90
        Width = 131
        Height = 79
        Caption = 'Green msg e.x.(ctrl-H)'
        TabOrder = 5
        object Label120: TLabel
          Left = 14
          Top = 20
          Width = 27
          Height = 15
          Caption = 'Font:'
        end
        object Label121: TLabel
          Left = 14
          Top = 50
          Width = 20
          Height = 15
          Caption = 'BG:'
        end
        object LabelGreenMsgFColor: TLabel
          Left = 110
          Top = 18
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelGreenMsgBColor: TLabel
          Left = 110
          Top = 48
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditGreenMsgFColor: TSpinEdit
          Left = 50
          Top = 15
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditGreenMsgFColorChange
        end
        object EditGreenMsgBColor: TSpinEdit
          Left = 50
          Top = 45
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditGreenMsgBColorChange
        end
      end
      object GroupBox60: TGroupBox
        Left = 150
        Top = 170
        Width = 131
        Height = 79
        Caption = 'Scrolling info msgs'
        TabOrder = 6
        object Label124: TLabel
          Left = 14
          Top = 20
          Width = 27
          Height = 15
          Caption = 'Font:'
        end
        object Label125: TLabel
          Left = 14
          Top = 50
          Width = 20
          Height = 15
          Caption = 'BG:'
        end
        object LabelBlueMsgFColor: TLabel
          Left = 110
          Top = 18
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelBlueMsgBColor: TLabel
          Left = 110
          Top = 48
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditBlueMsgFColor: TSpinEdit
          Left = 50
          Top = 15
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditBlueMsgFColorChange
        end
        object EditBlueMsgBColor: TSpinEdit
          Left = 50
          Top = 45
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditBlueMsgBColorChange
        end
      end
      object GroupBox61: TGroupBox
        Left = 290
        Top = 10
        Width = 131
        Height = 79
        Caption = 'Shouts'
        TabOrder = 7
        object Label128: TLabel
          Left = 14
          Top = 20
          Width = 27
          Height = 15
          Caption = 'Font:'
        end
        object Label129: TLabel
          Left = 14
          Top = 50
          Width = 20
          Height = 15
          Caption = 'BG:'
        end
        object LabelCryMsgFColor: TLabel
          Left = 110
          Top = 18
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelCryMsgBColor: TLabel
          Left = 110
          Top = 48
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditCryMsgFColor: TSpinEdit
          Left = 50
          Top = 15
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditCryMsgFColorChange
        end
        object EditCryMsgBColor: TSpinEdit
          Left = 50
          Top = 45
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditCryMsgBColorChange
        end
      end
      object GroupBox62: TGroupBox
        Left = 290
        Top = 90
        Width = 131
        Height = 79
        Caption = 'Guild'
        TabOrder = 8
        object Label132: TLabel
          Left = 14
          Top = 20
          Width = 27
          Height = 15
          Caption = 'Font:'
        end
        object Label133: TLabel
          Left = 14
          Top = 50
          Width = 20
          Height = 15
          Caption = 'BG:'
        end
        object LabelGuildMsgFColor: TLabel
          Left = 110
          Top = 18
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelGuildMsgBColor: TLabel
          Left = 110
          Top = 48
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditGuildMsgFColor: TSpinEdit
          Left = 50
          Top = 15
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditGuildMsgFColorChange
        end
        object EditGuildMsgBColor: TSpinEdit
          Left = 50
          Top = 45
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditGuildMsgBColorChange
        end
      end
      object GroupBox63: TGroupBox
        Left = 290
        Top = 170
        Width = 131
        Height = 79
        Caption = 'Group'
        TabOrder = 9
        object Label136: TLabel
          Left = 14
          Top = 20
          Width = 27
          Height = 15
          Caption = 'Font:'
        end
        object Label137: TLabel
          Left = 14
          Top = 50
          Width = 20
          Height = 15
          Caption = 'BG:'
        end
        object LabelGroupMsgFColor: TLabel
          Left = 110
          Top = 18
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelGroupMsgBColor: TLabel
          Left = 110
          Top = 48
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditGroupMsgFColor: TSpinEdit
          Left = 50
          Top = 15
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditGroupMsgFColorChange
        end
        object EditGroupMsgBColor: TSpinEdit
          Left = 50
          Top = 45
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditGroupMsgBColorChange
        end
      end
      object GroupBox65: TGroupBox
        Left = 430
        Top = 10
        Width = 131
        Height = 79
        Caption = 'Curse(*)'
        TabOrder = 10
        object Label122: TLabel
          Left = 14
          Top = 20
          Width = 27
          Height = 15
          Caption = 'Font:'
        end
        object Label123: TLabel
          Left = 14
          Top = 50
          Width = 20
          Height = 15
          Caption = 'BG:'
        end
        object LabelCustMsgFColor: TLabel
          Left = 110
          Top = 18
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object LabelCustMsgBColor: TLabel
          Left = 110
          Top = 48
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditCustMsgFColor: TSpinEdit
          Left = 50
          Top = 15
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditCustMsgFColorChange
        end
        object EditCustMsgBColor: TSpinEdit
          Left = 50
          Top = 45
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditCustMsgBColorChange
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'War/Time settings'
      ImageIndex = 9
      object GroupBox39: TGroupBox
        Left = 10
        Top = 10
        Width = 131
        Height = 61
        Caption = 'Start castle war days'
        TabOrder = 0
        object Label74: TLabel
          Left = 14
          Top = 30
          Width = 31
          Height = 15
          Caption = 'Days:'
        end
        object Label77: TLabel
          Left = 104
          Top = 30
          Width = 3
          Height = 15
        end
        object EditStartCastleWarDays: TSpinEdit
          Left = 55
          Top = 25
          Width = 46
          Height = 24
          Hint = '????????,?????'
          MaxValue = 10
          MinValue = 2
          TabOrder = 0
          Value = 4
          OnChange = EditStartCastleWarDaysChange
        end
      end
      object GroupBox40: TGroupBox
        Left = 10
        Top = 80
        Width = 131
        Height = 61
        Caption = 'Start castle war time'
        TabOrder = 1
        object Label76: TLabel
          Left = 14
          Top = 30
          Width = 31
          Height = 15
          Caption = 'Time:'
        end
        object Label78: TLabel
          Left = 104
          Top = 30
          Width = 3
          Height = 15
        end
        object EditStartCastlewarTime: TSpinEdit
          Left = 55
          Top = 25
          Width = 46
          Height = 24
          Hint = '??????,20??20:00'
          MaxValue = 24
          MinValue = 1
          TabOrder = 0
          Value = 20
          OnChange = EditStartCastlewarTimeChange
        end
      end
      object GroupBox41: TGroupBox
        Left = 10
        Top = 150
        Width = 131
        Height = 61
        Caption = 'Notify end of war time'
        TabOrder = 2
        object Label79: TLabel
          Left = 14
          Top = 30
          Width = 31
          Height = 15
          Caption = 'Time:'
        end
        object Label80: TLabel
          Left = 104
          Top = 30
          Width = 9
          Height = 15
          Caption = 'M'
        end
        object EditShowCastleWarEndMsgTime: TSpinEdit
          Left = 55
          Top = 25
          Width = 46
          Height = 24
          Hint = '?????????????'
          MaxValue = 6000000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditShowCastleWarEndMsgTimeChange
        end
      end
      object GroupBox42: TGroupBox
        Left = 150
        Top = 10
        Width = 141
        Height = 61
        Caption = 'Castle war'
        TabOrder = 3
        object Label81: TLabel
          Left = 14
          Top = 30
          Width = 31
          Height = 15
          Caption = 'Time:'
        end
        object Label82: TLabel
          Left = 114
          Top = 30
          Width = 9
          Height = 15
          Caption = 'M'
        end
        object EditCastleWarTime: TSpinEdit
          Left = 55
          Top = 25
          Width = 56
          Height = 24
          Hint = '??????,???3????'
          MaxValue = 6000000
          MinValue = 1
          TabOrder = 0
          Value = 180
          OnChange = EditCastleWarTimeChange
        end
      end
      object GroupBox43: TGroupBox
        Left = 150
        Top = 80
        Width = 131
        Height = 61
        Caption = 'Get castle time'
        TabOrder = 4
        object Label83: TLabel
          Left = 14
          Top = 30
          Width = 31
          Height = 15
          Caption = 'Time:'
        end
        object Label84: TLabel
          Left = 104
          Top = 30
          Width = 9
          Height = 15
          Caption = 'M'
        end
        object EditGetCastleTime: TSpinEdit
          Left = 55
          Top = 25
          Width = 46
          Height = 24
          Hint = '??????,???????????'
          MaxValue = 6000000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditGetCastleTimeChange
        end
      end
      object GroupBox44: TGroupBox
        Left = 300
        Top = 10
        Width = 131
        Height = 61
        Caption = 'Save HumanRCD'
        TabOrder = 5
        object Label85: TLabel
          Left = 14
          Top = 30
          Width = 31
          Height = 15
          Caption = 'Time:'
        end
        object Label86: TLabel
          Left = 104
          Top = 30
          Width = 9
          Height = 15
          Caption = 'M'
        end
        object EditSaveHumanRcdTime: TSpinEdit
          Left = 55
          Top = 25
          Width = 46
          Height = 24
          Hint = '?????????????'
          MaxValue = 6000000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditSaveHumanRcdTimeChange
        end
      end
      object GroupBox45: TGroupBox
        Left = 440
        Top = 10
        Width = 131
        Height = 61
        Caption = 'Free delay time'
        TabOrder = 6
        object Label87: TLabel
          Left = 14
          Top = 30
          Width = 31
          Height = 15
          Caption = 'Time:'
        end
        object Label88: TLabel
          Left = 104
          Top = 30
          Width = 9
          Height = 15
          Caption = 'M'
        end
        object EditHumanFreeDelayTime: TSpinEdit
          Left = 55
          Top = 25
          Width = 46
          Height = 24
          Hint = '?????????????,????????,?????????'
          Enabled = False
          MaxValue = 6000000
          MinValue = 1
          TabOrder = 0
          Value = 5
          OnChange = EditHumanFreeDelayTimeChange
        end
      end
      object GroupBox46: TGroupBox
        Left = 320
        Top = 150
        Width = 151
        Height = 91
        Caption = 'Ghost times'
        TabOrder = 7
        object Label89: TLabel
          Left = 14
          Top = 30
          Width = 33
          Height = 15
          Caption = 'Dead:'
        end
        object Label90: TLabel
          Left = 124
          Top = 30
          Width = 9
          Height = 15
          Caption = 'M'
        end
        object Label91: TLabel
          Left = 14
          Top = 60
          Width = 34
          Height = 15
          Caption = 'items:'
        end
        object Label92: TLabel
          Left = 124
          Top = 60
          Width = 7
          Height = 15
          Caption = '?'
        end
        object EditMakeGhostTime: TSpinEdit
          Left = 55
          Top = 25
          Width = 66
          Height = 24
          Hint = '?????????'
          MaxValue = 6000000
          MinValue = 1
          TabOrder = 0
          Value = 180
          OnChange = EditMakeGhostTimeChange
        end
        object EditClearDropOnFloorItemTime: TSpinEdit
          Left = 55
          Top = 55
          Width = 66
          Height = 24
          Hint = '?????????'
          MaxValue = 6000000
          MinValue = 1
          TabOrder = 1
          Value = 3600
          OnChange = EditClearDropOnFloorItemTimeChange
        end
      end
      object GroupBox47: TGroupBox
        Left = 290
        Top = 80
        Width = 141
        Height = 61
        Caption = 'Floor item(pickup time)'
        TabOrder = 8
        object Label93: TLabel
          Left = 14
          Top = 30
          Width = 31
          Height = 15
          Caption = 'Time:'
        end
        object Label94: TLabel
          Left = 114
          Top = 30
          Width = 9
          Height = 15
          Caption = 'M'
        end
        object EditFloorItemCanPickUpTime: TSpinEdit
          Left = 55
          Top = 25
          Width = 56
          Height = 24
          Hint = '??????????????????'
          MaxValue = 6000000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditFloorItemCanPickUpTimeChange
        end
      end
      object ButtonTimeSave: TButton
        Left = 10
        Top = 216
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 9
        OnClick = ButtonTimeSaveClick
      end
      object GroupBox70: TGroupBox
        Left = 150
        Top = 150
        Width = 141
        Height = 61
        Caption = 'Guild war time'
        TabOrder = 10
        object Label143: TLabel
          Left = 14
          Top = 30
          Width = 31
          Height = 15
          Caption = 'Time:'
        end
        object Label144: TLabel
          Left = 114
          Top = 30
          Width = 9
          Height = 15
          Caption = 'M'
        end
        object EditGuildWarTime: TSpinEdit
          Left = 55
          Top = 25
          Width = 56
          Height = 24
          Hint = '????????'
          MaxValue = 6000000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditGuildWarTimeChange
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Price/Repairing'
      ImageIndex = 10
      object GroupBox48: TGroupBox
        Left = 10
        Top = 10
        Width = 171
        Height = 61
        Caption = 'Make guild price'
        TabOrder = 0
        object Label95: TLabel
          Left = 14
          Top = 30
          Width = 29
          Height = 15
          Caption = 'Gold:'
        end
        object EditBuildGuildPrice: TSpinEdit
          Left = 55
          Top = 25
          Width = 96
          Height = 24
          Hint = '???????????'
          MaxValue = 100000000
          MinValue = 1000
          TabOrder = 0
          Value = 1000000
          OnChange = EditBuildGuildPriceChange
        end
      end
      object GroupBox49: TGroupBox
        Left = 10
        Top = 80
        Width = 171
        Height = 61
        Caption = 'Guild war price'
        TabOrder = 1
        object Label96: TLabel
          Left = 14
          Top = 30
          Width = 29
          Height = 15
          Caption = 'Gold:'
        end
        object EditGuildWarPrice: TSpinEdit
          Left = 55
          Top = 25
          Width = 96
          Height = 24
          Hint = '???????????'
          MaxValue = 100000000
          MinValue = 1000
          TabOrder = 0
          Value = 30000
          OnChange = EditGuildWarPriceChange
        end
      end
      object GroupBox50: TGroupBox
        Left = 10
        Top = 150
        Width = 171
        Height = 61
        Caption = 'Make drug price'
        TabOrder = 2
        object Label97: TLabel
          Left = 14
          Top = 30
          Width = 29
          Height = 15
          Caption = 'Gold:'
        end
        object EditMakeDurgPrice: TSpinEdit
          Left = 55
          Top = 25
          Width = 96
          Height = 24
          Hint = '?????????'
          MaxValue = 100000000
          MinValue = 10
          TabOrder = 0
          Value = 100
          OnChange = EditMakeDurgPriceChange
        end
      end
      object ButtonPriceSave: TButton
        Left = 10
        Top = 216
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 3
        OnClick = ButtonPriceSaveClick
      end
      object GroupBox66: TGroupBox
        Left = 190
        Top = 10
        Width = 171
        Height = 91
        Caption = 'Repairing'
        TabOrder = 4
        object Label126: TLabel
          Left = 14
          Top = 30
          Width = 68
          Height = 15
          Caption = 'Special rate:'
        end
        object Label127: TLabel
          Left = 14
          Top = 60
          Width = 87
          Height = 15
          Caption = 'Repair dec rate:'
        end
        object EditSuperRepairPriceRate: TSpinEdit
          Left = 115
          Top = 25
          Width = 46
          Height = 24
          Hint = '????????,??????'
          EditorEnabled = False
          MaxValue = 100
          MinValue = 1
          TabOrder = 0
          Value = 3
          OnChange = EditSuperRepairPriceRateChange
        end
        object EditRepairItemDecDura: TSpinEdit
          Left = 110
          Top = 55
          Width = 51
          Height = 24
          Hint = '??????????'
          EditorEnabled = False
          MaxValue = 100
          MinValue = 1
          TabOrder = 1
          Value = 3
          OnChange = EditRepairItemDecDuraChange
        end
      end
    end
    object TabSheet9: TTabSheet
      Caption = 'Dropping'
      ImageIndex = 12
      object ButtonHumanDieSave: TButton
        Left = 480
        Top = 216
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 0
        OnClick = ButtonHumanDieSaveClick
      end
      object GroupBox67: TGroupBox
        Left = 10
        Top = 10
        Width = 211
        Height = 131
        Caption = 'On Death'
        TabOrder = 1
        object CheckBoxKillByMonstDropUseItem: TCheckBox
          Left = 10
          Top = 20
          Width = 199
          Height = 21
          Hint = '????????????????????????'
          Caption = 'Mob killed, drop items equipped'
          TabOrder = 0
          OnClick = CheckBoxKillByMonstDropUseItemClick
        end
        object CheckBoxKillByHumanDropUseItem: TCheckBox
          Left = 10
          Top = 40
          Width = 191
          Height = 21
          Hint = '????????????????????????'
          Caption = 'Pked, drop items equipped'
          TabOrder = 1
          OnClick = CheckBoxKillByHumanDropUseItemClick
        end
        object CheckBoxDieScatterBag: TCheckBox
          Left = 10
          Top = 60
          Width = 141
          Height = 21
          Hint = '?????????????????????'
          Caption = 'Drops items in bag'
          TabOrder = 2
          OnClick = CheckBoxDieScatterBagClick
        end
        object CheckBoxDieDropGold: TCheckBox
          Left = 10
          Top = 80
          Width = 141
          Height = 21
          Hint = '???????????????'
          Caption = 'Drop gold'
          TabOrder = 3
          OnClick = CheckBoxDieDropGoldClick
        end
        object CheckBoxDieRedScatterBagAll: TCheckBox
          Left = 10
          Top = 100
          Width = 181
          Height = 21
          Hint = '?????????????????'
          Caption = 'Pker, drop whole bag'
          TabOrder = 4
          OnClick = CheckBoxDieRedScatterBagAllClick
        end
      end
      object GroupBox69: TGroupBox
        Left = 230
        Top = 10
        Width = 331
        Height = 111
        Caption = 'Drop Rates'
        TabOrder = 2
        object Label130: TLabel
          Left = 10
          Top = 23
          Width = 56
          Height = 15
          Caption = 'Equipped:'
        end
        object Label131: TLabel
          Left = 10
          Top = 53
          Width = 72
          Height = 15
          Caption = 'PKEquipped:'
        end
        object Label134: TLabel
          Left = 10
          Top = 83
          Width = 25
          Height = 15
          Caption = 'Bag:'
        end
        object ScrollBarDieDropUseItemRate: TScrollBar
          Left = 80
          Top = 20
          Width = 181
          Height = 21
          Hint = '??????????????,???????,?????'
          Max = 500
          PageSize = 0
          TabOrder = 0
          OnChange = ScrollBarDieDropUseItemRateChange
        end
        object EditDieDropUseItemRate: TEdit
          Left = 270
          Top = 20
          Width = 51
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
        object ScrollBarDieRedDropUseItemRate: TScrollBar
          Left = 80
          Top = 50
          Width = 181
          Height = 21
          Hint = '????????????????,???????,?????'
          PageSize = 0
          TabOrder = 2
          OnChange = ScrollBarDieRedDropUseItemRateChange
        end
        object EditDieRedDropUseItemRate: TEdit
          Left = 270
          Top = 50
          Width = 51
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 3
        end
        object ScrollBarDieScatterBagRate: TScrollBar
          Left = 80
          Top = 80
          Width = 181
          Height = 21
          Hint = '??????????????,???????,?????'
          Max = 500
          PageSize = 0
          TabOrder = 4
          OnChange = ScrollBarDieScatterBagRateChange
        end
        object EditDieScatterBagRate: TEdit
          Left = 270
          Top = 80
          Width = 51
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 5
        end
      end
    end
  end
end
