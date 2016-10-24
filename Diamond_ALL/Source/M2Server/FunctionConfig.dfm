object frmFunctionConfig: TfrmFunctionConfig
  Left = 257
  Top = 281
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Function Configurations'
  ClientHeight = 473
  ClientWidth = 589
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
  object FunctionConfigControl: TPageControl
    Left = 10
    Top = 10
    Width = 571
    Height = 431
    ActivePage = TabSheetGeneral
    MultiLine = True
    TabOrder = 0
    OnChanging = FunctionConfigControlChanging
    object TabSheetGeneral: TTabSheet
      Caption = 'General'
      ImageIndex = 3
      object GroupBox7: TGroupBox
        Left = 370
        Top = 10
        Width = 181
        Height = 231
        Caption = 'Hunger system'
        TabOrder = 0
        object CheckBoxHungerSystem: TCheckBox
          Left = 10
          Top = 20
          Width = 151
          Height = 21
          Hint = '??????,??????????????,?????????,???????'
          Caption = 'Use Hunger System'
          TabOrder = 0
          OnClick = CheckBoxHungerSystemClick
        end
        object GroupBoxHunger: TGroupBox
          Left = 10
          Top = 50
          Width = 161
          Height = 71
          Caption = 'Settings'
          TabOrder = 1
          object CheckBoxHungerDecPower: TCheckBox
            Left = 10
            Top = 40
            Width = 121
            Height = 21
            Hint = '??????,????????,?????????????????'
            Caption = 'Decrease DC'
            TabOrder = 0
            OnClick = CheckBoxHungerDecPowerClick
          end
          object CheckBoxHungerDecHP: TCheckBox
            Left = 10
            Top = 20
            Width = 111
            Height = 21
            Hint = '???????????????0?,???????HP?,??0?,?????'
            Caption = 'Decrease HP'
            TabOrder = 1
            OnClick = CheckBoxHungerDecHPClick
          end
        end
      end
      object ButtonGeneralSave: TButton
        Left = 460
        Top = 326
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 1
        OnClick = ButtonGeneralSaveClick
      end
      object GroupBox34: TGroupBox
        Left = 10
        Top = 10
        Width = 171
        Height = 201
        Caption = 'Name colors'
        TabOrder = 2
        object Label85: TLabel
          Left = 14
          Top = 20
          Width = 28
          Height = 15
          Caption = 'Pker:'
        end
        object LabelPKFlagNameColor: TLabel
          Left = 140
          Top = 18
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label87: TLabel
          Left = 14
          Top = 50
          Width = 39
          Height = 15
          Caption = 'Level1:'
        end
        object LabelPKLevel1NameColor: TLabel
          Left = 140
          Top = 48
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label89: TLabel
          Left = 14
          Top = 80
          Width = 39
          Height = 15
          Caption = 'Level2:'
        end
        object LabelPKLevel2NameColor: TLabel
          Left = 140
          Top = 78
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label91: TLabel
          Left = 14
          Top = 110
          Width = 50
          Height = 15
          Caption = 'GuildAlly:'
        end
        object LabelAllyAndGuildNameColor: TLabel
          Left = 140
          Top = 108
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label93: TLabel
          Left = 14
          Top = 140
          Width = 32
          Height = 15
          Caption = 'Guild:'
        end
        object LabelWarGuildNameColor: TLabel
          Left = 140
          Top = 138
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label95: TLabel
          Left = 14
          Top = 170
          Width = 39
          Height = 15
          Caption = 'FreePk'
        end
        object LabelInFreePKAreaNameColor: TLabel
          Left = 140
          Top = 168
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditPKFlagNameColor: TSpinEdit
          Left = 80
          Top = 15
          Width = 51
          Height = 24
          Hint = '??????????????,???47'
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditPKFlagNameColorChange
        end
        object EditPKLevel1NameColor: TSpinEdit
          Left = 80
          Top = 45
          Width = 51
          Height = 24
          Hint = '???PK???100??????,???251'
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditPKLevel1NameColorChange
        end
        object EditPKLevel2NameColor: TSpinEdit
          Left = 80
          Top = 75
          Width = 51
          Height = 24
          Hint = '???PK???200??????,???249'
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 2
          Value = 100
          OnChange = EditPKLevel2NameColorChange
        end
        object EditAllyAndGuildNameColor: TSpinEdit
          Left = 80
          Top = 105
          Width = 51
          Height = 24
          Hint = '?????????,??????????????,???180'
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 3
          Value = 100
          OnChange = EditAllyAndGuildNameColorChange
        end
        object EditWarGuildNameColor: TSpinEdit
          Left = 80
          Top = 135
          Width = 51
          Height = 24
          Hint = '?????????,??????????,???69'
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 4
          Value = 100
          OnChange = EditWarGuildNameColorChange
        end
        object EditInFreePKAreaNameColor: TSpinEdit
          Left = 80
          Top = 165
          Width = 51
          Height = 24
          Hint = '?????????????????,???221'
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 5
          Value = 100
          OnChange = EditInFreePKAreaNameColorChange
        end
      end
    end
    object PasswordSheet: TTabSheet
      Caption = 'Locks'
      ImageIndex = 2
      object GroupBox1: TGroupBox
        Left = 10
        Top = 0
        Width = 541
        Height = 241
        TabOrder = 0
        object CheckBoxEnablePasswordLock: TCheckBox
          Left = 10
          Top = -6
          Width = 183
          Height = 31
          Caption = 'Enable storage passwords'
          TabOrder = 0
          OnClick = CheckBoxEnablePasswordLockClick
        end
        object GroupBox2: TGroupBox
          Left = 10
          Top = 20
          Width = 331
          Height = 211
          TabOrder = 1
          object CheckBoxLockGetBackItem: TCheckBox
            Left = 10
            Top = 20
            Width = 151
            Height = 21
            Caption = 'Lock get back item'
            TabOrder = 0
            OnClick = CheckBoxLockGetBackItemClick
          end
          object GroupBox4: TGroupBox
            Left = 10
            Top = 50
            Width = 311
            Height = 131
            Caption = 'Triggers'
            TabOrder = 1
            object CheckBoxLockWalk: TCheckBox
              Left = 10
              Top = 40
              Width = 131
              Height = 21
              Caption = 'Lock Walking'
              TabOrder = 0
              OnClick = CheckBoxLockWalkClick
            end
            object CheckBoxLockRun: TCheckBox
              Left = 10
              Top = 60
              Width = 131
              Height = 21
              Caption = 'Lock Running'
              TabOrder = 1
              OnClick = CheckBoxLockRunClick
            end
            object CheckBoxLockHit: TCheckBox
              Left = 10
              Top = 80
              Width = 131
              Height = 21
              Caption = 'Lock hitting'
              TabOrder = 2
              OnClick = CheckBoxLockHitClick
            end
            object CheckBoxLockSpell: TCheckBox
              Left = 10
              Top = 100
              Width = 131
              Height = 21
              Caption = 'Lock Magics'
              TabOrder = 3
              OnClick = CheckBoxLockSpellClick
            end
            object CheckBoxLockSendMsg: TCheckBox
              Left = 150
              Top = 40
              Width = 131
              Height = 21
              Caption = 'Lock SendMsg'
              TabOrder = 4
              OnClick = CheckBoxLockSendMsgClick
            end
            object CheckBoxLockInObMode: TCheckBox
              Left = 150
              Top = 20
              Width = 151
              Height = 21
              Hint = '????????,??????????,????????,?????????????'
              Caption = 'Lock(in observer)'
              TabOrder = 5
              OnClick = CheckBoxLockInObModeClick
            end
            object CheckBoxLockLogin: TCheckBox
              Left = 10
              Top = 20
              Width = 131
              Height = 21
              Caption = 'Lock Login'
              TabOrder = 6
              OnClick = CheckBoxLockLoginClick
            end
            object CheckBoxLockUseItem: TCheckBox
              Left = 150
              Top = 100
              Width = 131
              Height = 21
              Caption = 'Lock use items'
              TabOrder = 7
              OnClick = CheckBoxLockUseItemClick
            end
            object CheckBoxLockDropItem: TCheckBox
              Left = 150
              Top = 80
              Width = 131
              Height = 21
              Caption = 'Lock drop items'
              TabOrder = 8
              OnClick = CheckBoxLockDropItemClick
            end
            object CheckBoxLockDealItem: TCheckBox
              Left = 150
              Top = 60
              Width = 151
              Height = 21
              Caption = 'Lock trading'
              TabOrder = 9
              OnClick = CheckBoxLockDealItemClick
            end
          end
        end
        object GroupBox3: TGroupBox
          Left = 350
          Top = 20
          Width = 181
          Height = 81
          Caption = 'Password error count'
          TabOrder = 2
          object Label1: TLabel
            Left = 10
            Top = 23
            Width = 33
            Height = 15
            Caption = 'count:'
          end
          object EditErrorPasswordCount: TSpinEdit
            Left = 85
            Top = 19
            Width = 66
            Height = 24
            Hint = '????????,????????????,?????,??????????????????'
            EditorEnabled = False
            MaxValue = 10
            MinValue = 1
            TabOrder = 0
            Value = 10
            OnChange = EditErrorPasswordCountChange
          end
          object CheckBoxErrorCountKick: TCheckBox
            Left = 10
            Top = 50
            Width = 161
            Height = 21
            Caption = 'Kick on max count?'
            Enabled = False
            TabOrder = 1
            OnClick = CheckBoxErrorCountKickClick
          end
        end
        object ButtonPasswordLockSave: TButton
          Left = 450
          Top = 196
          Width = 81
          Height = 32
          Caption = '&Save'
          TabOrder = 3
          OnClick = ButtonPasswordLockSaveClick
        end
      end
    end
    object TabSheet32: TTabSheet
      Caption = '---'
      ImageIndex = 4
    end
    object TabSheet33: TTabSheet
      Caption = 'Master'
      ImageIndex = 5
      object GroupBox21: TGroupBox
        Left = 10
        Top = 10
        Width = 201
        Height = 191
        TabOrder = 0
        object GroupBox22: TGroupBox
          Left = 10
          Top = 20
          Width = 181
          Height = 61
          Caption = 'Level to be a master'
          TabOrder = 0
          object Label29: TLabel
            Left = 10
            Top = 23
            Width = 28
            Height = 15
            Caption = 'level:'
          end
          object EditMasterOKLevel: TSpinEdit
            Left = 85
            Top = 19
            Width = 66
            Height = 24
            Hint = '??????,??????,????????????'
            MaxValue = 65535
            MinValue = 1
            TabOrder = 0
            Value = 10
            OnChange = EditMasterOKLevelChange
          end
        end
        object GroupBox23: TGroupBox
          Left = 10
          Top = 90
          Width = 181
          Height = 91
          Caption = 'level to get'
          TabOrder = 1
          object Label30: TLabel
            Left = 10
            Top = 23
            Width = 43
            Height = 15
            Caption = 'Credits:'
          end
          object Label31: TLabel
            Left = 10
            Top = 53
            Width = 39
            Height = 15
            Caption = 'Bonus:'
          end
          object EditMasterOKCreditPoint: TSpinEdit
            Left = 85
            Top = 19
            Width = 66
            Height = 24
            Hint = '?????,??????????'
            MaxValue = 100
            MinValue = 0
            TabOrder = 0
            Value = 10
            OnChange = EditMasterOKCreditPointChange
          end
          object EditMasterOKBonusPoint: TSpinEdit
            Left = 85
            Top = 49
            Width = 66
            Height = 24
            Hint = '?????,??????????'
            MaxValue = 1000
            MinValue = 0
            TabOrder = 1
            Value = 10
            OnChange = EditMasterOKBonusPointChange
          end
        end
      end
      object ButtonMasterSave: TButton
        Left = 450
        Top = 196
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 1
        OnClick = ButtonMasterSaveClick
      end
    end
    object TabSheet38: TTabSheet
      Caption = 'Re-Birth system'
      ImageIndex = 9
      object GroupBox29: TGroupBox
        Left = 10
        Top = 10
        Width = 141
        Height = 321
        Caption = 'Name colors(lvl)'
        TabOrder = 0
        object Label56: TLabel
          Left = 14
          Top = 20
          Width = 10
          Height = 15
          Caption = '1:'
        end
        object LabelReNewNameColor1: TLabel
          Left = 110
          Top = 18
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label58: TLabel
          Left = 14
          Top = 50
          Width = 10
          Height = 15
          Caption = '2:'
        end
        object LabelReNewNameColor2: TLabel
          Left = 110
          Top = 48
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label60: TLabel
          Left = 14
          Top = 80
          Width = 10
          Height = 15
          Caption = '3:'
        end
        object LabelReNewNameColor3: TLabel
          Left = 110
          Top = 78
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label62: TLabel
          Left = 14
          Top = 110
          Width = 10
          Height = 15
          Caption = '4:'
        end
        object LabelReNewNameColor4: TLabel
          Left = 110
          Top = 108
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label64: TLabel
          Left = 14
          Top = 140
          Width = 10
          Height = 15
          Caption = '5:'
        end
        object LabelReNewNameColor5: TLabel
          Left = 110
          Top = 138
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label66: TLabel
          Left = 14
          Top = 170
          Width = 10
          Height = 15
          Caption = '6:'
        end
        object LabelReNewNameColor6: TLabel
          Left = 110
          Top = 168
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label68: TLabel
          Left = 14
          Top = 200
          Width = 10
          Height = 15
          Caption = '7:'
        end
        object LabelReNewNameColor7: TLabel
          Left = 110
          Top = 198
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label70: TLabel
          Left = 14
          Top = 230
          Width = 10
          Height = 15
          Caption = '8:'
        end
        object LabelReNewNameColor8: TLabel
          Left = 110
          Top = 228
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label72: TLabel
          Left = 14
          Top = 260
          Width = 10
          Height = 15
          Caption = '9:'
        end
        object LabelReNewNameColor9: TLabel
          Left = 110
          Top = 258
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label74: TLabel
          Left = 14
          Top = 290
          Width = 17
          Height = 15
          Caption = '10:'
        end
        object LabelReNewNameColor10: TLabel
          Left = 110
          Top = 288
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditReNewNameColor1: TSpinEdit
          Left = 50
          Top = 15
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditReNewNameColor1Change
        end
        object EditReNewNameColor2: TSpinEdit
          Left = 50
          Top = 45
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditReNewNameColor2Change
        end
        object EditReNewNameColor3: TSpinEdit
          Left = 50
          Top = 75
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 2
          Value = 100
          OnChange = EditReNewNameColor3Change
        end
        object EditReNewNameColor4: TSpinEdit
          Left = 50
          Top = 105
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 3
          Value = 100
          OnChange = EditReNewNameColor4Change
        end
        object EditReNewNameColor5: TSpinEdit
          Left = 50
          Top = 135
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 4
          Value = 100
          OnChange = EditReNewNameColor5Change
        end
        object EditReNewNameColor6: TSpinEdit
          Left = 50
          Top = 165
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 5
          Value = 100
          OnChange = EditReNewNameColor6Change
        end
        object EditReNewNameColor7: TSpinEdit
          Left = 50
          Top = 195
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 6
          Value = 100
          OnChange = EditReNewNameColor7Change
        end
        object EditReNewNameColor8: TSpinEdit
          Left = 50
          Top = 225
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 7
          Value = 100
          OnChange = EditReNewNameColor8Change
        end
        object EditReNewNameColor9: TSpinEdit
          Left = 50
          Top = 255
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 8
          Value = 100
          OnChange = EditReNewNameColor9Change
        end
        object EditReNewNameColor10: TSpinEdit
          Left = 50
          Top = 285
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 9
          Value = 100
          OnChange = EditReNewNameColor10Change
        end
      end
      object ButtonReNewLevelSave: TButton
        Left = 450
        Top = 196
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 1
        OnClick = ButtonReNewLevelSaveClick
      end
      object GroupBox30: TGroupBox
        Left = 160
        Top = 10
        Width = 209
        Height = 81
        Caption = 'On rebirth change name color?'
        TabOrder = 2
        object Label57: TLabel
          Left = 10
          Top = 53
          Width = 31
          Height = 15
          Caption = 'Time:'
        end
        object Label59: TLabel
          Left = 104
          Top = 55
          Width = 9
          Height = 15
          Caption = 'M'
        end
        object EditReNewNameColorTime: TSpinEdit
          Left = 55
          Top = 49
          Width = 46
          Height = 24
          Hint = '??????,??????,????????????'
          EditorEnabled = False
          MaxValue = 10
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditReNewNameColorTimeChange
        end
        object CheckBoxReNewChangeColor: TCheckBox
          Left = 10
          Top = 20
          Width = 111
          Height = 21
          Hint = '??????,????????????????'
          Caption = 'Change'
          TabOrder = 1
          OnClick = CheckBoxReNewChangeColorClick
        end
      end
      object GroupBox33: TGroupBox
        Left = 160
        Top = 100
        Width = 209
        Height = 51
        TabOrder = 3
        object CheckBoxReNewLevelClearExp: TCheckBox
          Left = 10
          Top = 20
          Width = 183
          Height = 21
          Hint = '???????????????'
          Caption = 'On Rebirth reset exp?'
          TabOrder = 0
          OnClick = CheckBoxReNewLevelClearExpClick
        end
      end
    end
    object TabSheet39: TTabSheet
      Caption = 'Monster levels'
      ImageIndex = 10
      object ButtonMonUpgradeSave: TButton
        Left = 450
        Top = 326
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 0
        OnClick = ButtonMonUpgradeSaveClick
      end
      object GroupBox32: TGroupBox
        Left = 10
        Top = 10
        Width = 141
        Height = 291
        Caption = 'Mon level up name color'
        TabOrder = 1
        object Label65: TLabel
          Left = 14
          Top = 20
          Width = 10
          Height = 15
          Caption = '1:'
        end
        object LabelMonUpgradeColor1: TLabel
          Left = 110
          Top = 18
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label67: TLabel
          Left = 14
          Top = 50
          Width = 10
          Height = 15
          Caption = '2:'
        end
        object LabelMonUpgradeColor2: TLabel
          Left = 110
          Top = 48
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label69: TLabel
          Left = 14
          Top = 80
          Width = 10
          Height = 15
          Caption = '3:'
        end
        object LabelMonUpgradeColor3: TLabel
          Left = 110
          Top = 78
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label71: TLabel
          Left = 14
          Top = 110
          Width = 10
          Height = 15
          Caption = '4:'
        end
        object LabelMonUpgradeColor4: TLabel
          Left = 110
          Top = 108
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label73: TLabel
          Left = 14
          Top = 140
          Width = 10
          Height = 15
          Caption = '5:'
        end
        object LabelMonUpgradeColor5: TLabel
          Left = 110
          Top = 138
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label75: TLabel
          Left = 14
          Top = 170
          Width = 10
          Height = 15
          Caption = '6:'
        end
        object LabelMonUpgradeColor6: TLabel
          Left = 110
          Top = 168
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label76: TLabel
          Left = 14
          Top = 200
          Width = 10
          Height = 15
          Caption = '7:'
        end
        object LabelMonUpgradeColor7: TLabel
          Left = 110
          Top = 198
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label77: TLabel
          Left = 14
          Top = 230
          Width = 10
          Height = 15
          Caption = '8:'
        end
        object LabelMonUpgradeColor8: TLabel
          Left = 110
          Top = 228
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object Label86: TLabel
          Left = 14
          Top = 260
          Width = 10
          Height = 15
          Caption = '9:'
        end
        object LabelMonUpgradeColor9: TLabel
          Left = 110
          Top = 258
          Width = 11
          Height = 21
          AutoSize = False
          Color = clBackground
          ParentColor = False
        end
        object EditMonUpgradeColor1: TSpinEdit
          Left = 50
          Top = 15
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditMonUpgradeColor1Change
        end
        object EditMonUpgradeColor2: TSpinEdit
          Left = 50
          Top = 45
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditMonUpgradeColor2Change
        end
        object EditMonUpgradeColor3: TSpinEdit
          Left = 50
          Top = 75
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 2
          Value = 100
          OnChange = EditMonUpgradeColor3Change
        end
        object EditMonUpgradeColor4: TSpinEdit
          Left = 50
          Top = 105
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 3
          Value = 100
          OnChange = EditMonUpgradeColor4Change
        end
        object EditMonUpgradeColor5: TSpinEdit
          Left = 50
          Top = 135
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 4
          Value = 100
          OnChange = EditMonUpgradeColor5Change
        end
        object EditMonUpgradeColor6: TSpinEdit
          Left = 50
          Top = 165
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 5
          Value = 100
          OnChange = EditMonUpgradeColor6Change
        end
        object EditMonUpgradeColor7: TSpinEdit
          Left = 50
          Top = 195
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 6
          Value = 100
          OnChange = EditMonUpgradeColor7Change
        end
        object EditMonUpgradeColor8: TSpinEdit
          Left = 50
          Top = 225
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 7
          Value = 100
          OnChange = EditMonUpgradeColor8Change
        end
        object EditMonUpgradeColor9: TSpinEdit
          Left = 50
          Top = 255
          Width = 51
          Height = 24
          EditorEnabled = False
          MaxValue = 255
          MinValue = 0
          TabOrder = 8
          Value = 100
          OnChange = EditMonUpgradeColor9Change
        end
      end
      object GroupBox31: TGroupBox
        Left = 160
        Top = 10
        Width = 121
        Height = 291
        Caption = 'on kill count'
        TabOrder = 2
        object Label61: TLabel
          Left = 14
          Top = 20
          Width = 10
          Height = 15
          Caption = '1:'
        end
        object Label63: TLabel
          Left = 14
          Top = 50
          Width = 10
          Height = 15
          Caption = '2:'
        end
        object Label78: TLabel
          Left = 14
          Top = 80
          Width = 10
          Height = 15
          Caption = '3:'
        end
        object Label79: TLabel
          Left = 14
          Top = 110
          Width = 10
          Height = 15
          Caption = '4:'
        end
        object Label80: TLabel
          Left = 14
          Top = 140
          Width = 10
          Height = 15
          Caption = '5:'
        end
        object Label81: TLabel
          Left = 14
          Top = 170
          Width = 10
          Height = 15
          Caption = '6:'
        end
        object Label82: TLabel
          Left = 14
          Top = 200
          Width = 10
          Height = 15
          Caption = '7:'
        end
        object Label83: TLabel
          Left = 14
          Top = 230
          Width = 10
          Height = 15
          Caption = '8:'
        end
        object Label84: TLabel
          Left = 14
          Top = 260
          Width = 10
          Height = 15
          Caption = '9:'
        end
        object EditMonUpgradeKillCount1: TSpinEdit
          Left = 50
          Top = 15
          Width = 61
          Height = 24
          EditorEnabled = False
          Increment = 10
          MaxValue = 9999
          MinValue = 0
          TabOrder = 0
          Value = 100
          OnChange = EditMonUpgradeKillCount1Change
        end
        object EditMonUpgradeKillCount2: TSpinEdit
          Left = 50
          Top = 45
          Width = 61
          Height = 24
          EditorEnabled = False
          Increment = 10
          MaxValue = 9999
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditMonUpgradeKillCount2Change
        end
        object EditMonUpgradeKillCount3: TSpinEdit
          Left = 50
          Top = 75
          Width = 61
          Height = 24
          EditorEnabled = False
          Increment = 10
          MaxValue = 9999
          MinValue = 0
          TabOrder = 2
          Value = 100
          OnChange = EditMonUpgradeKillCount3Change
        end
        object EditMonUpgradeKillCount4: TSpinEdit
          Left = 50
          Top = 105
          Width = 61
          Height = 24
          EditorEnabled = False
          Increment = 10
          MaxValue = 9999
          MinValue = 0
          TabOrder = 3
          Value = 100
          OnChange = EditMonUpgradeKillCount4Change
        end
        object EditMonUpgradeKillCount5: TSpinEdit
          Left = 50
          Top = 135
          Width = 61
          Height = 24
          EditorEnabled = False
          Increment = 10
          MaxValue = 9999
          MinValue = 0
          TabOrder = 4
          Value = 100
          OnChange = EditMonUpgradeKillCount5Change
        end
        object EditMonUpgradeKillCount6: TSpinEdit
          Left = 50
          Top = 165
          Width = 61
          Height = 24
          EditorEnabled = False
          Increment = 10
          MaxValue = 9999
          MinValue = 0
          TabOrder = 5
          Value = 100
          OnChange = EditMonUpgradeKillCount6Change
        end
        object EditMonUpgradeKillCount7: TSpinEdit
          Left = 50
          Top = 195
          Width = 61
          Height = 24
          EditorEnabled = False
          Increment = 10
          MaxValue = 9999
          MinValue = 0
          TabOrder = 6
          Value = 100
          OnChange = EditMonUpgradeKillCount7Change
        end
        object EditMonUpLvNeedKillBase: TSpinEdit
          Left = 50
          Top = 225
          Width = 61
          Height = 24
          Hint = '????=?? * ?? + ?? + ?? + ????'
          EditorEnabled = False
          Increment = 10
          MaxValue = 9999
          MinValue = 0
          TabOrder = 7
          Value = 100
          OnChange = EditMonUpLvNeedKillBaseChange
        end
        object EditMonUpLvRate: TSpinEdit
          Left = 50
          Top = 255
          Width = 61
          Height = 24
          Hint = '????=???? * ?? + ?? + ?? + ????'
          EditorEnabled = False
          Increment = 10
          MaxValue = 9999
          MinValue = 0
          TabOrder = 8
          Value = 100
          OnChange = EditMonUpLvRateChange
        end
      end
      object GroupBox35: TGroupBox
        Left = 290
        Top = 10
        Width = 171
        Height = 141
        Caption = 'Mutiny'
        TabOrder = 3
        object Label88: TLabel
          Left = 14
          Top = 50
          Width = 29
          Height = 15
          Caption = 'Rate:'
        end
        object Label90: TLabel
          Left = 14
          Top = 80
          Width = 38
          Height = 15
          Caption = 'Power:'
        end
        object Label92: TLabel
          Left = 14
          Top = 110
          Width = 39
          Height = 15
          Caption = 'Speed:'
        end
        object CheckBoxMasterDieMutiny: TCheckBox
          Left = 10
          Top = 20
          Width = 141
          Height = 21
          Caption = 'Master die mutiny'
          TabOrder = 0
          OnClick = CheckBoxMasterDieMutinyClick
        end
        object EditMasterDieMutinyRate: TSpinEdit
          Left = 90
          Top = 45
          Width = 61
          Height = 24
          Hint = '????,???????'
          EditorEnabled = False
          MaxValue = 9999
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditMasterDieMutinyRateChange
        end
        object EditMasterDieMutinyPower: TSpinEdit
          Left = 90
          Top = 75
          Width = 61
          Height = 24
          EditorEnabled = False
          MaxValue = 9999
          MinValue = 0
          TabOrder = 2
          Value = 100
          OnChange = EditMasterDieMutinyPowerChange
        end
        object EditMasterDieMutinySpeed: TSpinEdit
          Left = 90
          Top = 105
          Width = 61
          Height = 24
          EditorEnabled = False
          MaxValue = 9999
          MinValue = 0
          TabOrder = 3
          Value = 100
          OnChange = EditMasterDieMutinySpeedChange
        end
      end
      object GroupBox47: TGroupBox
        Left = 290
        Top = 160
        Width = 171
        Height = 91
        TabOrder = 4
        object Label112: TLabel
          Left = 14
          Top = 50
          Width = 31
          Height = 15
          Caption = 'Time:'
        end
        object CheckBoxBBMonAutoChangeColor: TCheckBox
          Left = 10
          Top = 20
          Width = 151
          Height = 21
          Caption = 'Mon auto change color?'
          TabOrder = 0
          OnClick = CheckBoxBBMonAutoChangeColorClick
        end
        object EditBBMonAutoChangeColorTime: TSpinEdit
          Left = 90
          Top = 45
          Width = 61
          Height = 24
          Hint = '????,??????,??(?)?'
          EditorEnabled = False
          MaxValue = 9999
          MinValue = 1
          TabOrder = 1
          Value = 100
          OnChange = EditBBMonAutoChangeColorTimeChange
        end
      end
    end
    object MonSaySheet: TTabSheet
      Caption = 'MonSay'
      object GroupBox40: TGroupBox
        Left = 10
        Top = 10
        Width = 171
        Height = 61
        TabOrder = 0
        object CheckBoxMonSayMsg: TCheckBox
          Left = 10
          Top = 20
          Width = 141
          Height = 21
          Caption = 'Enable monsay'
          TabOrder = 0
          OnClick = CheckBoxMonSayMsgClick
        end
      end
      object ButtonMonSayMsgSave: TButton
        Left = 470
        Top = 346
        Width = 81
        Height = 25
        Caption = '&Save'
        TabOrder = 1
        OnClick = ButtonMonSayMsgSaveClick
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Magics'
      ImageIndex = 1
      object MagicPageControl: TPageControl
        Left = 0
        Top = 0
        Width = 561
        Height = 341
        ActivePage = TabSheet29
        MultiLine = True
        TabOrder = 0
        TabPosition = tpBottom
        object TabSheet36: TTabSheet
          Caption = 'Rage'
          ImageIndex = 31
          object GroupBox17: TGroupBox
            Left = 10
            Top = 10
            Width = 181
            Height = 61
            Caption = 'Magic attack rage?'
            TabOrder = 0
            object Label12: TLabel
              Left = 10
              Top = 23
              Width = 31
              Height = 15
              Caption = '????:'
            end
            object EditMagicAttackRage: TSpinEdit
              Left = 85
              Top = 19
              Width = 66
              Height = 24
              Hint = '????????,???????????'
              EditorEnabled = False
              MaxValue = 20
              MinValue = 1
              TabOrder = 0
              Value = 10
              OnChange = EditMagicAttackRageChange
            end
          end
        end
        object TabSheet30: TTabSheet
          Caption = '????'
          ImageIndex = 29
        end
        object TabSheet11: TTabSheet
          Caption = 'Thrusting'
          ImageIndex = 10
          object GroupBox9: TGroupBox
            Left = 10
            Top = 10
            Width = 141
            Height = 51
            Caption = 'Limit thrusting'
            TabOrder = 0
            object CheckBoxLimitSwordLong: TCheckBox
              Left = 10
              Top = 20
              Width = 121
              Height = 21
              Hint = '??????,??????????????,????????'
              Caption = 'Limit'
              TabOrder = 0
              OnClick = CheckBoxLimitSwordLongClick
            end
          end
          object GroupBox10: TGroupBox
            Left = 10
            Top = 70
            Width = 161
            Height = 51
            Caption = 'Power rate'
            TabOrder = 1
            object Label4: TLabel
              Left = 10
              Top = 25
              Width = 24
              Height = 15
              Caption = 'rate:'
            end
            object Label10: TLabel
              Left = 120
              Top = 25
              Width = 24
              Height = 15
              Caption = '/100'
            end
            object EditSwordLongPowerRate: TSpinEdit
              Left = 55
              Top = 19
              Width = 56
              Height = 24
              Hint = '?????,???? ?? 100??????'
              EditorEnabled = False
              MaxValue = 1000
              MinValue = 1
              TabOrder = 0
              Value = 100
              OnChange = EditSwordLongPowerRateChange
            end
          end
        end
        object TabSheet23: TTabSheet
          Caption = '????'
          ImageIndex = 22
        end
        object FiresWordTab: TTabSheet
          Caption = 'FlamingSword'
        end
        object TabSheet24: TTabSheet
          Caption = '????'
          ImageIndex = 23
        end
        object TabSheet2: TTabSheet
          Caption = '???'
          ImageIndex = 7
        end
        object TabSheet7: TTabSheet
          Caption = '????'
          ImageIndex = 5
        end
        object TabSheet8: TTabSheet
          Caption = '???'
          ImageIndex = 6
        end
        object TabSheet9: TTabSheet
          Caption = '????'
          ImageIndex = 8
        end
        object TabSheet10: TTabSheet
          Caption = '???'
          ImageIndex = 9
        end
        object TabSheet18: TTabSheet
          Caption = 'Eshock'
          ImageIndex = 17
          object GroupBox38: TGroupBox
            Left = 10
            Top = 10
            Width = 141
            Height = 51
            Caption = 'Tamming level'
            TabOrder = 0
            object Label98: TLabel
              Left = 10
              Top = 25
              Width = 17
              Height = 15
              Caption = '??:'
            end
            object EditMagTammingLevel: TSpinEdit
              Left = 55
              Top = 19
              Width = 76
              Height = 24
              Hint = '??????????????,??????????????'
              EditorEnabled = False
              MaxValue = 65535
              MinValue = 1
              TabOrder = 0
              Value = 1
              OnChange = EditMagTammingLevelChange
            end
          end
          object GroupBox39: TGroupBox
            Left = 10
            Top = 70
            Width = 141
            Height = 91
            TabOrder = 1
            object Label99: TLabel
              Left = 10
              Top = 25
              Width = 49
              Height = 15
              Caption = 'Targetlvl:'
            end
            object Label100: TLabel
              Left = 10
              Top = 55
              Width = 46
              Height = 15
              Caption = 'HPRate:'
            end
            object EditMagTammingTargetLevel: TSpinEdit
              Left = 80
              Top = 19
              Width = 51
              Height = 24
              Hint = '??????,??????????'
              EditorEnabled = False
              MaxValue = 65535
              MinValue = 1
              TabOrder = 0
              Value = 1
              OnChange = EditMagTammingTargetLevelChange
            end
            object EditMagTammingHPRate: TSpinEdit
              Left = 80
              Top = 49
              Width = 51
              Height = 24
              Hint = '??????,?????,?????'
              EditorEnabled = False
              MaxValue = 65535
              MinValue = 1
              TabOrder = 1
              Value = 1
              OnChange = EditMagTammingHPRateChange
            end
          end
          object GroupBox45: TGroupBox
            Left = 160
            Top = 10
            Width = 141
            Height = 51
            Caption = 'Max amount of pets'
            TabOrder = 2
            object Label111: TLabel
              Left = 10
              Top = 25
              Width = 10
              Height = 15
              Caption = '#:'
            end
            object EditTammingCount: TSpinEdit
              Left = 55
              Top = 19
              Width = 76
              Height = 24
              Hint = '????????'
              EditorEnabled = False
              MaxValue = 65535
              MinValue = 1
              TabOrder = 0
              Value = 1
              OnChange = EditTammingCountChange
            end
          end
        end
        object TabSheet19: TTabSheet
          Caption = '???'
          ImageIndex = 18
        end
        object TabSheet20: TTabSheet
          Caption = 'FireWall'
          ImageIndex = 19
          object GroupBox46: TGroupBox
            Left = 10
            Top = 10
            Width = 141
            Height = 51
            Caption = 'FireWall in safezone'
            TabOrder = 0
            object CheckBoxFireCrossInSafeZone: TCheckBox
              Left = 10
              Top = 20
              Width = 121
              Height = 21
              Hint = '??????,???????????'
              TabOrder = 0
              OnClick = CheckBoxFireCrossInSafeZoneClick
            end
          end
        end
        object TabSheet27: TTabSheet
          Caption = '???'
          ImageIndex = 26
        end
        object TabSheet28: TTabSheet
          Caption = 'TurnUndead'
          ImageIndex = 27
          object GroupBox37: TGroupBox
            Left = 10
            Top = 10
            Width = 141
            Height = 51
            Caption = 'Turn undead level'
            TabOrder = 0
            object Label97: TLabel
              Left = 10
              Top = 25
              Width = 14
              Height = 15
              Caption = 'lvl:'
            end
            object EditMagTurnUndeadLevel: TSpinEdit
              Left = 55
              Top = 19
              Width = 76
              Height = 24
              Hint = '??????????????,??????????????'
              EditorEnabled = False
              MaxValue = 65535
              MinValue = 1
              TabOrder = 0
              Value = 1
              OnChange = EditMagTurnUndeadLevelChange
            end
          end
        end
        object TabSheet22: TTabSheet
          Caption = 'ThunderStorm'
          ImageIndex = 21
          object GroupBox15: TGroupBox
            Left = 10
            Top = 10
            Width = 141
            Height = 51
            Caption = 'Range'
            TabOrder = 0
            object Label9: TLabel
              Left = 10
              Top = 25
              Width = 10
              Height = 15
              Caption = '#:'
            end
            object EditElecBlizzardRange: TSpinEdit
              Left = 55
              Top = 19
              Width = 76
              Height = 24
              Hint = '?????????'
              EditorEnabled = False
              MaxValue = 12
              MinValue = 1
              TabOrder = 0
              Value = 1
              OnChange = EditElecBlizzardRangeChange
            end
          end
        end
        object TabSheet21: TTabSheet
          Caption = 'FlameDisruptor'
          ImageIndex = 20
          object GroupBox13: TGroupBox
            Left = 10
            Top = 10
            Width = 141
            Height = 51
            Caption = 'Range'
            TabOrder = 0
            object Label7: TLabel
              Left = 10
              Top = 25
              Width = 10
              Height = 15
              Caption = '#:'
            end
            object EditFireBoomRage: TSpinEdit
              Left = 55
              Top = 19
              Width = 76
              Height = 24
              Hint = '?????????'
              EditorEnabled = False
              MaxValue = 12
              MinValue = 1
              TabOrder = 0
              Value = 1
              OnChange = EditFireBoomRageChange
            end
          end
        end
        object TabSheet29: TTabSheet
          Caption = 'IceStorm'
          ImageIndex = 28
          object GroupBox14: TGroupBox
            Left = 10
            Top = 10
            Width = 141
            Height = 51
            Caption = 'Range'
            TabOrder = 0
            object Label8: TLabel
              Left = 10
              Top = 25
              Width = 10
              Height = 15
              Caption = '#:'
            end
            object EditSnowWindRange: TSpinEdit
              Left = 55
              Top = 19
              Width = 76
              Height = 24
              Hint = '?????????'
              EditorEnabled = False
              MaxValue = 12
              MinValue = 1
              TabOrder = 0
              Value = 1
              OnChange = EditSnowWindRangeChange
            end
          end
        end
        object TabSheet5: TTabSheet
          Caption = '???'
          ImageIndex = 3
        end
        object TabSheet26: TTabSheet
          Caption = '?????'
          ImageIndex = 25
        end
        object TabSheet6: TTabSheet
          Caption = 'Posion'
          ImageIndex = 4
          object GroupBox16: TGroupBox
            Left = 10
            Top = 10
            Width = 171
            Height = 61
            Caption = 'Posion power'
            TabOrder = 0
            object Label11: TLabel
              Left = 10
              Top = 23
              Width = 37
              Height = 15
              Caption = 'power:'
            end
            object EditAmyOunsulPoint: TSpinEdit
              Left = 85
              Top = 19
              Width = 66
              Height = 24
              Hint = '???????????,??????????????????,????????????,?????,?????'
              EditorEnabled = False
              MaxValue = 100
              MinValue = 1
              TabOrder = 0
              Value = 10
              OnChange = EditAmyOunsulPointChange
            end
          end
        end
        object TabSheet31: TTabSheet
          Caption = '?????'
          ImageIndex = 30
        end
        object TabSheet12: TTabSheet
          Caption = '????'
          ImageIndex = 11
        end
        object TabSheet13: TTabSheet
          Caption = '???'
          ImageIndex = 12
        end
        object TabSheet14: TTabSheet
          Caption = '?????'
          ImageIndex = 13
        end
        object TabSheet15: TTabSheet
          Caption = '???'
          ImageIndex = 14
        end
        object TabSheet16: TTabSheet
          Caption = '???'
          ImageIndex = 15
        end
        object TabSheet17: TTabSheet
          Caption = '?????'
          ImageIndex = 16
        end
        object TabSheet3: TTabSheet
          Caption = 'BoneFamm'
          ImageIndex = 1
          object GroupBox5: TGroupBox
            Left = 6
            Top = 3
            Width = 165
            Height = 168
            TabOrder = 0
            object Label2: TLabel
              Left = 10
              Top = 23
              Width = 37
              Height = 15
              Caption = 'Name:'
            end
            object Label3: TLabel
              Left = 10
              Top = 73
              Width = 36
              Height = 15
              Caption = 'Count:'
            end
            object EditBoneFammName: TEdit
              Left = 10
              Top = 40
              Width = 131
              Height = 23
              Hint = '????????????'
              TabOrder = 0
              OnChange = EditBoneFammNameChange
            end
            object EditBoneFammCount: TSpinEdit
              Left = 75
              Top = 69
              Width = 66
              Height = 24
              Hint = '??????????'
              EditorEnabled = False
              MaxValue = 255
              MinValue = 1
              TabOrder = 1
              Value = 10
              OnChange = EditBoneFammCountChange
            end
          end
          object GroupBox6: TGroupBox
            Left = 180
            Top = 3
            Width = 361
            Height = 168
            TabOrder = 1
            object GridBoneFamm: TStringGrid
              Left = 10
              Top = 20
              Width = 331
              Height = 141
              ColCount = 4
              DefaultRowHeight = 18
              FixedCols = 0
              RowCount = 11
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
              TabOrder = 0
              OnSetEditText = GridBoneFammSetEditText
              ColWidths = (
                55
                76
                57
                52)
            end
          end
        end
        object TabSheet4: TTabSheet
          Caption = 'Shinsu'
          ImageIndex = 2
          object GroupBox11: TGroupBox
            Left = 6
            Top = 3
            Width = 165
            Height = 168
            TabOrder = 0
            object Label5: TLabel
              Left = 10
              Top = 23
              Width = 37
              Height = 15
              Caption = 'Name:'
            end
            object Label6: TLabel
              Left = 10
              Top = 73
              Width = 36
              Height = 15
              Caption = 'Count:'
            end
            object EditDogzName: TEdit
              Left = 10
              Top = 40
              Width = 131
              Height = 23
              Hint = '????????????'
              TabOrder = 0
              OnChange = EditDogzNameChange
            end
            object EditDogzCount: TSpinEdit
              Left = 75
              Top = 69
              Width = 66
              Height = 24
              Hint = '??????????'
              EditorEnabled = False
              MaxValue = 255
              MinValue = 1
              TabOrder = 1
              Value = 10
              OnChange = EditDogzCountChange
            end
          end
          object GroupBox12: TGroupBox
            Left = 180
            Top = 3
            Width = 361
            Height = 168
            TabOrder = 1
            object GridDogz: TStringGrid
              Left = 10
              Top = 20
              Width = 331
              Height = 141
              ColCount = 4
              DefaultRowHeight = 18
              FixedCols = 0
              RowCount = 11
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
              TabOrder = 0
              OnSetEditText = GridBoneFammSetEditText
              ColWidths = (
                55
                76
                57
                52)
            end
          end
        end
        object TabSheet25: TTabSheet
          Caption = '????'
          ImageIndex = 24
        end
        object TabSheet41: TTabSheet
          Caption = 'ParaBall'
          ImageIndex = 32
          object GroupBox41: TGroupBox
            Left = 10
            Top = 10
            Width = 181
            Height = 91
            TabOrder = 0
            object Label101: TLabel
              Left = 10
              Top = 23
              Width = 51
              Height = 15
              Caption = 'Random:'
            end
            object Label102: TLabel
              Left = 10
              Top = 53
              Width = 60
              Height = 15
              Caption = 'MinLvllimit:'
            end
            object EditMabMabeHitRandRate: TSpinEdit
              Left = 85
              Top = 19
              Width = 66
              Height = 24
              Hint = '???????????????,?????????'
              EditorEnabled = False
              MaxValue = 20
              MinValue = 1
              TabOrder = 0
              Value = 10
              OnChange = EditMabMabeHitRandRateChange
            end
            object EditMabMabeHitMinLvLimit: TSpinEdit
              Left = 85
              Top = 49
              Width = 66
              Height = 24
              Hint = '???????????????,????,?????????'
              EditorEnabled = False
              MaxValue = 20
              MinValue = 1
              TabOrder = 1
              Value = 10
              OnChange = EditMabMabeHitMinLvLimitChange
            end
          end
          object GroupBox42: TGroupBox
            Left = 10
            Top = 110
            Width = 181
            Height = 61
            Caption = 'Hit success rate'
            TabOrder = 1
            object Label103: TLabel
              Left = 10
              Top = 23
              Width = 29
              Height = 15
              Caption = 'Rate:'
            end
            object EditMabMabeHitSucessRate: TSpinEdit
              Left = 85
              Top = 19
              Width = 66
              Height = 24
              Hint = '??????,????,?????????'
              EditorEnabled = False
              MaxValue = 20
              MinValue = 1
              TabOrder = 0
              Value = 10
              OnChange = EditMabMabeHitSucessRateChange
            end
          end
          object GroupBox43: TGroupBox
            Left = 200
            Top = 10
            Width = 181
            Height = 61
            Caption = 'Hit time rate'
            TabOrder = 2
            object Label104: TLabel
              Left = 10
              Top = 23
              Width = 29
              Height = 15
              Caption = 'Rate:'
            end
            object EditMabMabeHitMabeTimeRate: TSpinEdit
              Left = 85
              Top = 19
              Width = 66
              Height = 24
              Hint = '????????,???????????'
              EditorEnabled = False
              MaxValue = 20
              MinValue = 1
              TabOrder = 0
              Value = 10
              OnChange = EditMabMabeHitMabeTimeRateChange
            end
          end
        end
        object TabSheet43: TTabSheet
          Caption = 'LionRoar'
          ImageIndex = 33
          object GroupBox48: TGroupBox
            Left = 10
            Top = 10
            Width = 141
            Height = 51
            TabOrder = 0
            object CheckBoxGroupMbAttackPlayObject: TCheckBox
              Left = 10
              Top = 20
              Width = 121
              Height = 21
              Hint = '??????,???????'
              Caption = 'Work on humans'
              TabOrder = 0
              OnClick = CheckBoxGroupMbAttackPlayObjectClick
            end
          end
        end
      end
      object ButtonSkillSave: TButton
        Left = 470
        Top = 346
        Width = 81
        Height = 25
        Caption = '&Save'
        TabOrder = 1
        OnClick = ButtonSkillSaveClick
      end
    end
    object TabSheet34: TTabSheet
      Caption = 'Refining'
      ImageIndex = 6
      object GroupBox8: TGroupBox
        Left = 10
        Top = 10
        Width = 201
        Height = 151
        Caption = 'Refining'
        TabOrder = 0
        object Label13: TLabel
          Left = 10
          Top = 23
          Width = 52
          Height = 15
          Caption = 'MaxStats:'
        end
        object Label15: TLabel
          Left = 10
          Top = 53
          Width = 31
          Height = 15
          Caption = 'Price:'
        end
        object Label16: TLabel
          Left = 10
          Top = 83
          Width = 76
          Height = 15
          Caption = 'GetbackTime:'
        end
        object Label17: TLabel
          Left = 10
          Top = 113
          Width = 57
          Height = 15
          Caption = 'HoldDays:'
        end
        object Label18: TLabel
          Left = 170
          Top = 81
          Width = 7
          Height = 15
          Caption = '?'
        end
        object Label19: TLabel
          Left = 170
          Top = 111
          Width = 7
          Height = 15
          Caption = '?'
        end
        object EditUpgradeWeaponMaxPoint: TSpinEdit
          Left = 85
          Top = 19
          Width = 76
          Height = 24
          EditorEnabled = False
          MaxValue = 1000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditUpgradeWeaponMaxPointChange
        end
        object EditUpgradeWeaponPrice: TSpinEdit
          Left = 85
          Top = 49
          Width = 76
          Height = 24
          EditorEnabled = False
          MaxValue = 1000000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditUpgradeWeaponPriceChange
        end
        object EditUPgradeWeaponGetBackTime: TSpinEdit
          Left = 85
          Top = 79
          Width = 76
          Height = 24
          EditorEnabled = False
          MaxValue = 36000000
          MinValue = 1
          TabOrder = 2
          Value = 10
          OnChange = EditUPgradeWeaponGetBackTimeChange
        end
        object EditClearExpireUpgradeWeaponDays: TSpinEdit
          Left = 85
          Top = 109
          Width = 76
          Height = 24
          EditorEnabled = False
          MaxValue = 100
          MinValue = 1
          TabOrder = 3
          Value = 10
          OnChange = EditClearExpireUpgradeWeaponDaysChange
        end
      end
      object GroupBox18: TGroupBox
        Left = 220
        Top = 10
        Width = 331
        Height = 111
        Caption = 'DC Rates'
        TabOrder = 1
        object Label20: TLabel
          Left = 10
          Top = 23
          Width = 21
          Height = 15
          Caption = 'DC:'
        end
        object Label21: TLabel
          Left = 10
          Top = 53
          Width = 33
          Height = 15
          Caption = 'DCx2:'
        end
        object Label22: TLabel
          Left = 10
          Top = 83
          Width = 33
          Height = 15
          Caption = 'DCx3:'
        end
        object ScrollBarUpgradeWeaponDCRate: TScrollBar
          Left = 80
          Top = 20
          Width = 181
          Height = 21
          Hint = '???????????,????????'
          Max = 500
          PageSize = 0
          TabOrder = 0
          OnChange = ScrollBarUpgradeWeaponDCRateChange
        end
        object EditUpgradeWeaponDCRate: TEdit
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
        object ScrollBarUpgradeWeaponDCTwoPointRate: TScrollBar
          Left = 80
          Top = 50
          Width = 181
          Height = 21
          Hint = '????????,????????'
          PageSize = 0
          TabOrder = 2
          OnChange = ScrollBarUpgradeWeaponDCTwoPointRateChange
        end
        object EditUpgradeWeaponDCTwoPointRate: TEdit
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
        object ScrollBarUpgradeWeaponDCThreePointRate: TScrollBar
          Left = 80
          Top = 80
          Width = 181
          Height = 21
          Hint = '????????,????????'
          Max = 500
          PageSize = 0
          TabOrder = 4
          OnChange = ScrollBarUpgradeWeaponDCThreePointRateChange
        end
        object EditUpgradeWeaponDCThreePointRate: TEdit
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
      object GroupBox19: TGroupBox
        Left = 220
        Top = 130
        Width = 331
        Height = 121
        Caption = 'SC Rates'
        TabOrder = 2
        object Label23: TLabel
          Left = 10
          Top = 23
          Width = 20
          Height = 15
          Caption = 'SC:'
        end
        object Label24: TLabel
          Left = 10
          Top = 53
          Width = 32
          Height = 15
          Caption = 'SCx2:'
        end
        object Label25: TLabel
          Left = 10
          Top = 83
          Width = 32
          Height = 15
          Caption = 'SCx3:'
        end
        object ScrollBarUpgradeWeaponSCRate: TScrollBar
          Left = 80
          Top = 20
          Width = 181
          Height = 21
          Hint = '??????????,????????'
          Max = 500
          PageSize = 0
          TabOrder = 0
          OnChange = ScrollBarUpgradeWeaponSCRateChange
        end
        object EditUpgradeWeaponSCRate: TEdit
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
        object ScrollBarUpgradeWeaponSCTwoPointRate: TScrollBar
          Left = 80
          Top = 50
          Width = 181
          Height = 21
          Hint = '????????,????????'
          PageSize = 0
          TabOrder = 2
          OnChange = ScrollBarUpgradeWeaponSCTwoPointRateChange
        end
        object EditUpgradeWeaponSCTwoPointRate: TEdit
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
        object ScrollBarUpgradeWeaponSCThreePointRate: TScrollBar
          Left = 80
          Top = 80
          Width = 181
          Height = 21
          Hint = '????????,????????'
          Max = 500
          PageSize = 0
          TabOrder = 4
          OnChange = ScrollBarUpgradeWeaponSCThreePointRateChange
        end
        object EditUpgradeWeaponSCThreePointRate: TEdit
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
      object GroupBox20: TGroupBox
        Left = 220
        Top = 260
        Width = 331
        Height = 111
        Caption = 'MC Rates'
        TabOrder = 3
        object Label26: TLabel
          Left = 10
          Top = 23
          Width = 21
          Height = 15
          Caption = 'MC:'
        end
        object Label27: TLabel
          Left = 10
          Top = 53
          Width = 33
          Height = 15
          Caption = 'MCx2:'
        end
        object Label28: TLabel
          Left = 10
          Top = 83
          Width = 33
          Height = 15
          Caption = 'MCx3:'
        end
        object ScrollBarUpgradeWeaponMCRate: TScrollBar
          Left = 80
          Top = 20
          Width = 181
          Height = 21
          Hint = '??????????,????????'
          Max = 500
          PageSize = 0
          TabOrder = 0
          OnChange = ScrollBarUpgradeWeaponMCRateChange
        end
        object EditUpgradeWeaponMCRate: TEdit
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
        object ScrollBarUpgradeWeaponMCTwoPointRate: TScrollBar
          Left = 80
          Top = 50
          Width = 181
          Height = 21
          Hint = '????????,????????'
          PageSize = 0
          TabOrder = 2
          OnChange = ScrollBarUpgradeWeaponMCTwoPointRateChange
        end
        object EditUpgradeWeaponMCTwoPointRate: TEdit
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
        object ScrollBarUpgradeWeaponMCThreePointRate: TScrollBar
          Left = 80
          Top = 80
          Width = 181
          Height = 21
          Hint = '????????,????????'
          Max = 500
          PageSize = 0
          TabOrder = 4
          OnChange = ScrollBarUpgradeWeaponMCThreePointRateChange
        end
        object EditUpgradeWeaponMCThreePointRate: TEdit
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
      object ButtonUpgradeWeaponSave: TButton
        Left = 10
        Top = 346
        Width = 81
        Height = 25
        Caption = '&Save'
        TabOrder = 4
        OnClick = ButtonUpgradeWeaponSaveClick
      end
      object ButtonUpgradeWeaponDefaulf: TButton
        Left = 100
        Top = 346
        Width = 81
        Height = 25
        Caption = '&Default'
        TabOrder = 5
        OnClick = ButtonUpgradeWeaponDefaulfClick
      end
    end
    object TabSheet35: TTabSheet
      Caption = 'Mining'
      ImageIndex = 7
      object GroupBox24: TGroupBox
        Left = 10
        Top = 10
        Width = 341
        Height = 75
        Caption = 'Make ores rate'
        TabOrder = 0
        object Label32: TLabel
          Left = 10
          Top = 23
          Width = 42
          Height = 15
          Caption = 'Hit rate:'
        end
        object Label33: TLabel
          Left = 10
          Top = 45
          Width = 77
          Height = 15
          Caption = 'Make ore rate:'
        end
        object ScrollBarMakeMineHitRate: TScrollBar
          Left = 90
          Top = 20
          Width = 161
          Height = 19
          Hint = '????????????'
          Max = 500
          PageSize = 0
          TabOrder = 0
          OnChange = ScrollBarMakeMineHitRateChange
        end
        object EditMakeMineHitRate: TEdit
          Left = 260
          Top = 20
          Width = 71
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
        object ScrollBarMakeMineRate: TScrollBar
          Left = 90
          Top = 45
          Width = 161
          Height = 19
          Hint = '????????????'
          Max = 500
          PageSize = 0
          TabOrder = 2
          OnChange = ScrollBarMakeMineRateChange
        end
        object EditMakeMineRate: TEdit
          Left = 260
          Top = 45
          Width = 71
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 3
        end
      end
      object GroupBox25: TGroupBox
        Left = 10
        Top = 90
        Width = 341
        Height = 271
        Caption = 'Ore digup rates'
        TabOrder = 1
        object Label34: TLabel
          Left = 10
          Top = 23
          Width = 44
          Height = 15
          Caption = 'Copper:'
        end
        object Label35: TLabel
          Left = 10
          Top = 48
          Width = 29
          Height = 15
          Caption = 'Gold:'
        end
        object Label36: TLabel
          Left = 10
          Top = 70
          Width = 33
          Height = 15
          Caption = 'Silver:'
        end
        object Label37: TLabel
          Left = 10
          Top = 95
          Width = 24
          Height = 15
          Caption = 'Iron:'
        end
        object Label38: TLabel
          Left = 10
          Top = 120
          Width = 54
          Height = 15
          Caption = 'BlackIron:'
        end
        object ScrollBarStoneTypeRate: TScrollBar
          Left = 90
          Top = 20
          Width = 161
          Height = 19
          Max = 500
          PageSize = 0
          TabOrder = 0
          OnChange = ScrollBarStoneTypeRateChange
        end
        object EditStoneTypeRate: TEdit
          Left = 260
          Top = 20
          Width = 71
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
        object ScrollBarGoldStoneMax: TScrollBar
          Left = 90
          Top = 45
          Width = 161
          Height = 19
          Max = 500
          PageSize = 0
          TabOrder = 2
          OnChange = ScrollBarGoldStoneMaxChange
        end
        object EditGoldStoneMax: TEdit
          Left = 260
          Top = 45
          Width = 71
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 3
        end
        object ScrollBarSilverStoneMax: TScrollBar
          Left = 90
          Top = 70
          Width = 161
          Height = 19
          Max = 500
          PageSize = 0
          TabOrder = 4
          OnChange = ScrollBarSilverStoneMaxChange
        end
        object EditSilverStoneMax: TEdit
          Left = 260
          Top = 70
          Width = 71
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 5
        end
        object ScrollBarSteelStoneMax: TScrollBar
          Left = 90
          Top = 95
          Width = 161
          Height = 19
          Max = 500
          PageSize = 0
          TabOrder = 6
          OnChange = ScrollBarSteelStoneMaxChange
        end
        object EditSteelStoneMax: TEdit
          Left = 260
          Top = 95
          Width = 71
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 7
        end
        object EditBlackStoneMax: TEdit
          Left = 260
          Top = 120
          Width = 71
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 8
        end
        object ScrollBarBlackStoneMax: TScrollBar
          Left = 90
          Top = 120
          Width = 161
          Height = 19
          Max = 500
          PageSize = 0
          TabOrder = 9
          OnChange = ScrollBarBlackStoneMaxChange
        end
      end
      object ButtonMakeMineSave: TButton
        Left = 470
        Top = 346
        Width = 81
        Height = 25
        Caption = '&Save'
        TabOrder = 2
        OnClick = ButtonMakeMineSaveClick
      end
      object GroupBox26: TGroupBox
        Left = 360
        Top = 10
        Width = 191
        Height = 151
        Caption = 'Duras'
        TabOrder = 3
        object Label39: TLabel
          Left = 10
          Top = 23
          Width = 54
          Height = 15
          Caption = 'Minimum:'
        end
        object Label40: TLabel
          Left = 10
          Top = 53
          Width = 47
          Height = 15
          Caption = 'Average:'
        end
        object Label41: TLabel
          Left = 10
          Top = 83
          Width = 24
          Height = 15
          Caption = 'Add:'
        end
        object Label42: TLabel
          Left = 10
          Top = 113
          Width = 24
          Height = 15
          Caption = 'Max:'
        end
        object EditStoneMinDura: TSpinEdit
          Left = 115
          Top = 19
          Width = 56
          Height = 24
          Hint = '???????????'
          EditorEnabled = False
          MaxValue = 1000
          MinValue = 1
          TabOrder = 0
          Value = 10
          OnChange = EditStoneMinDuraChange
        end
        object EditStoneGeneralDuraRate: TSpinEdit
          Left = 115
          Top = 49
          Width = 56
          Height = 24
          Hint = '?????????????'
          EditorEnabled = False
          MaxValue = 1000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditStoneGeneralDuraRateChange
        end
        object EditStoneAddDuraRate: TSpinEdit
          Left = 115
          Top = 79
          Width = 56
          Height = 24
          Hint = '???????????,????????20???????'
          EditorEnabled = False
          MaxValue = 1000
          MinValue = 1
          TabOrder = 2
          Value = 10
          OnChange = EditStoneAddDuraRateChange
        end
        object EditStoneAddDuraMax: TSpinEdit
          Left = 115
          Top = 109
          Width = 56
          Height = 24
          Hint = '????????????????'
          EditorEnabled = False
          MaxValue = 1000
          MinValue = 1
          TabOrder = 3
          Value = 10
          OnChange = EditStoneAddDuraMaxChange
        end
      end
      object ButtonMakeMineDefault: TButton
        Left = 370
        Top = 346
        Width = 81
        Height = 25
        Caption = '&Default'
        TabOrder = 4
        OnClick = ButtonMakeMineDefaultClick
      end
    end
    object TabSheet42: TTabSheet
      Caption = 'Luck'
      ImageIndex = 12
      object GroupBox44: TGroupBox
        Left = 10
        Top = 10
        Width = 341
        Height = 271
        Caption = 'Rates'
        TabOrder = 0
        object Label105: TLabel
          Left = 10
          Top = 23
          Width = 41
          Height = 15
          Caption = 'Unluck:'
        end
        object Label106: TLabel
          Left = 10
          Top = 48
          Width = 47
          Height = 15
          Caption = 'LuckPt1:'
        end
        object Label107: TLabel
          Left = 10
          Top = 70
          Width = 47
          Height = 15
          Caption = 'LuckPt2:'
        end
        object Label108: TLabel
          Left = 10
          Top = 95
          Width = 68
          Height = 15
          Caption = 'LuckPt2rate:'
        end
        object Label109: TLabel
          Left = 10
          Top = 120
          Width = 47
          Height = 15
          Caption = 'LuckPt3:'
        end
        object Label110: TLabel
          Left = 10
          Top = 145
          Width = 68
          Height = 15
          Caption = 'LuckPt3rate:'
        end
        object ScrollBarWeaponMakeUnLuckRate: TScrollBar
          Left = 90
          Top = 20
          Width = 161
          Height = 19
          Hint = '?????????,?????????'
          Max = 500
          PageSize = 0
          TabOrder = 0
          OnChange = ScrollBarWeaponMakeUnLuckRateChange
        end
        object EditWeaponMakeUnLuckRate: TEdit
          Left = 260
          Top = 20
          Width = 71
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
        object ScrollBarWeaponMakeLuckPoint1: TScrollBar
          Left = 90
          Top = 45
          Width = 161
          Height = 19
          Hint = '???????????????????100% ???'
          Max = 500
          PageSize = 0
          TabOrder = 2
          OnChange = ScrollBarWeaponMakeLuckPoint1Change
        end
        object EditWeaponMakeLuckPoint1: TEdit
          Left = 260
          Top = 45
          Width = 71
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 3
        end
        object ScrollBarWeaponMakeLuckPoint2: TScrollBar
          Left = 90
          Top = 70
          Width = 161
          Height = 19
          Hint = '????????????????????????????????'
          Max = 500
          PageSize = 0
          TabOrder = 4
          OnChange = ScrollBarWeaponMakeLuckPoint2Change
        end
        object EditWeaponMakeLuckPoint2: TEdit
          Left = 260
          Top = 70
          Width = 71
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 5
        end
        object ScrollBarWeaponMakeLuckPoint2Rate: TScrollBar
          Left = 90
          Top = 95
          Width = 161
          Height = 19
          Hint = '????,?????????'
          Max = 500
          PageSize = 0
          TabOrder = 6
          OnChange = ScrollBarWeaponMakeLuckPoint2RateChange
        end
        object EditWeaponMakeLuckPoint2Rate: TEdit
          Left = 260
          Top = 95
          Width = 71
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 7
        end
        object EditWeaponMakeLuckPoint3: TEdit
          Left = 260
          Top = 120
          Width = 71
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 8
        end
        object ScrollBarWeaponMakeLuckPoint3: TScrollBar
          Left = 90
          Top = 120
          Width = 161
          Height = 19
          Hint = '????????????????????????????????'
          Max = 500
          PageSize = 0
          TabOrder = 9
          OnChange = ScrollBarWeaponMakeLuckPoint3Change
        end
        object ScrollBarWeaponMakeLuckPoint3Rate: TScrollBar
          Left = 90
          Top = 145
          Width = 161
          Height = 19
          Hint = '????,?????????'
          Max = 500
          PageSize = 0
          TabOrder = 10
          OnChange = ScrollBarWeaponMakeLuckPoint3RateChange
        end
        object EditWeaponMakeLuckPoint3Rate: TEdit
          Left = 260
          Top = 145
          Width = 71
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 11
        end
      end
      object ButtonWeaponMakeLuckDefault: TButton
        Left = 370
        Top = 346
        Width = 81
        Height = 25
        Caption = '&Default'
        TabOrder = 1
        OnClick = ButtonWeaponMakeLuckDefaultClick
      end
      object ButtonWeaponMakeLuckSave: TButton
        Left = 470
        Top = 346
        Width = 81
        Height = 25
        Caption = '&Save'
        TabOrder = 2
        OnClick = ButtonWeaponMakeLuckSaveClick
      end
    end
    object TabSheet37: TTabSheet
      Caption = 'Lottery'
      ImageIndex = 8
      object GroupBox27: TGroupBox
        Left = 10
        Top = 10
        Width = 341
        Height = 211
        Caption = 'Rates'
        TabOrder = 0
        object Label43: TLabel
          Left = 10
          Top = 53
          Width = 33
          Height = 15
          Caption = '1max:'
        end
        object Label44: TLabel
          Left = 10
          Top = 78
          Width = 33
          Height = 15
          Caption = '2max:'
        end
        object Label45: TLabel
          Left = 10
          Top = 100
          Width = 33
          Height = 15
          Caption = '3max:'
        end
        object Label46: TLabel
          Left = 10
          Top = 125
          Width = 33
          Height = 15
          Caption = '4max:'
        end
        object Label47: TLabel
          Left = 10
          Top = 150
          Width = 33
          Height = 15
          Caption = '5max:'
        end
        object Label48: TLabel
          Left = 10
          Top = 175
          Width = 33
          Height = 15
          Caption = '6max:'
        end
        object Label49: TLabel
          Left = 10
          Top = 23
          Width = 29
          Height = 15
          Caption = 'Rate:'
        end
        object ScrollBarWinLottery1Max: TScrollBar
          Left = 70
          Top = 50
          Width = 161
          Height = 19
          Max = 1000000
          PageSize = 0
          TabOrder = 0
          OnChange = ScrollBarWinLottery1MaxChange
        end
        object EditWinLottery1Max: TEdit
          Left = 240
          Top = 50
          Width = 91
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 1
        end
        object ScrollBarWinLottery2Max: TScrollBar
          Left = 70
          Top = 75
          Width = 161
          Height = 19
          Max = 1000000
          PageSize = 0
          TabOrder = 2
          OnChange = ScrollBarWinLottery2MaxChange
        end
        object EditWinLottery2Max: TEdit
          Left = 240
          Top = 75
          Width = 91
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 3
        end
        object ScrollBarWinLottery3Max: TScrollBar
          Left = 70
          Top = 100
          Width = 161
          Height = 19
          Max = 1000000
          PageSize = 0
          TabOrder = 4
          OnChange = ScrollBarWinLottery3MaxChange
        end
        object EditWinLottery3Max: TEdit
          Left = 240
          Top = 100
          Width = 91
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 5
        end
        object ScrollBarWinLottery4Max: TScrollBar
          Left = 70
          Top = 125
          Width = 161
          Height = 19
          Max = 1000000
          PageSize = 0
          TabOrder = 6
          OnChange = ScrollBarWinLottery4MaxChange
        end
        object EditWinLottery4Max: TEdit
          Left = 240
          Top = 125
          Width = 91
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 7
        end
        object EditWinLottery5Max: TEdit
          Left = 240
          Top = 150
          Width = 91
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 8
        end
        object ScrollBarWinLottery5Max: TScrollBar
          Left = 70
          Top = 150
          Width = 161
          Height = 19
          Max = 1000000
          PageSize = 0
          TabOrder = 9
          OnChange = ScrollBarWinLottery5MaxChange
        end
        object ScrollBarWinLottery6Max: TScrollBar
          Left = 70
          Top = 175
          Width = 161
          Height = 19
          Max = 1000000
          PageSize = 0
          TabOrder = 10
          OnChange = ScrollBarWinLottery6MaxChange
        end
        object EditWinLottery6Max: TEdit
          Left = 240
          Top = 175
          Width = 91
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 11
        end
        object EditWinLotteryRate: TEdit
          Left = 240
          Top = 20
          Width = 91
          Height = 21
          Ctl3D = False
          Enabled = False
          ParentCtl3D = False
          ReadOnly = True
          TabOrder = 12
        end
        object ScrollBarWinLotteryRate: TScrollBar
          Left = 70
          Top = 20
          Width = 161
          Height = 19
          Max = 100000
          PageSize = 0
          TabOrder = 13
          OnChange = ScrollBarWinLotteryRateChange
        end
      end
      object GroupBox28: TGroupBox
        Left = 360
        Top = 10
        Width = 181
        Height = 211
        Caption = 'Prizes'
        TabOrder = 1
        object Label50: TLabel
          Left = 10
          Top = 23
          Width = 10
          Height = 15
          Caption = '1:'
        end
        object Label51: TLabel
          Left = 10
          Top = 53
          Width = 10
          Height = 15
          Caption = '2:'
        end
        object Label52: TLabel
          Left = 10
          Top = 83
          Width = 10
          Height = 15
          Caption = '3:'
        end
        object Label53: TLabel
          Left = 10
          Top = 113
          Width = 10
          Height = 15
          Caption = '4:'
        end
        object Label54: TLabel
          Left = 10
          Top = 143
          Width = 10
          Height = 15
          Caption = '5:'
        end
        object Label55: TLabel
          Left = 10
          Top = 173
          Width = 10
          Height = 15
          Caption = '6:'
        end
        object EditWinLottery1Gold: TSpinEdit
          Left = 70
          Top = 19
          Width = 101
          Height = 24
          Increment = 500
          MaxValue = 100000000
          MinValue = 1
          TabOrder = 0
          Value = 100000000
          OnChange = EditWinLottery1GoldChange
        end
        object EditWinLottery2Gold: TSpinEdit
          Left = 70
          Top = 49
          Width = 101
          Height = 24
          Increment = 500
          MaxValue = 100000000
          MinValue = 1
          TabOrder = 1
          Value = 10
          OnChange = EditWinLottery2GoldChange
        end
        object EditWinLottery3Gold: TSpinEdit
          Left = 70
          Top = 79
          Width = 101
          Height = 24
          Increment = 500
          MaxValue = 100000000
          MinValue = 1
          TabOrder = 2
          Value = 10
          OnChange = EditWinLottery3GoldChange
        end
        object EditWinLottery4Gold: TSpinEdit
          Left = 70
          Top = 109
          Width = 101
          Height = 24
          Increment = 500
          MaxValue = 100000000
          MinValue = 1
          TabOrder = 3
          Value = 10
          OnChange = EditWinLottery4GoldChange
        end
        object EditWinLottery5Gold: TSpinEdit
          Left = 70
          Top = 139
          Width = 101
          Height = 24
          Increment = 500
          MaxValue = 100000000
          MinValue = 1
          TabOrder = 4
          Value = 10
          OnChange = EditWinLottery5GoldChange
        end
        object EditWinLottery6Gold: TSpinEdit
          Left = 70
          Top = 169
          Width = 101
          Height = 24
          Increment = 500
          MaxValue = 100000000
          MinValue = 1
          TabOrder = 5
          Value = 10
          OnChange = EditWinLottery6GoldChange
        end
      end
      object ButtonWinLotterySave: TButton
        Left = 470
        Top = 346
        Width = 81
        Height = 25
        Caption = '&Save'
        ModalResult = 1
        TabOrder = 2
        OnClick = ButtonWinLotterySaveClick
      end
      object ButtonWinLotteryDefault: TButton
        Left = 370
        Top = 346
        Width = 81
        Height = 25
        Caption = '&Default'
        TabOrder = 3
        OnClick = ButtonWinLotteryDefaultClick
      end
    end
    object TabSheet40: TTabSheet
      Caption = 'Mutiny'
      ImageIndex = 11
      object GroupBox36: TGroupBox
        Left = 10
        Top = 10
        Width = 171
        Height = 111
        TabOrder = 0
        object Label94: TLabel
          Left = 14
          Top = 50
          Width = 31
          Height = 15
          Caption = 'Time:'
        end
        object Label96: TLabel
          Left = 14
          Top = 80
          Width = 38
          Height = 15
          Caption = 'Power:'
          Enabled = False
        end
        object CheckBoxSpiritMutiny: TCheckBox
          Left = 10
          Top = 20
          Width = 141
          Height = 21
          Caption = 'Mutiny enabled'
          TabOrder = 0
          OnClick = CheckBoxSpiritMutinyClick
        end
        object EditSpiritMutinyTime: TSpinEdit
          Left = 90
          Top = 45
          Width = 61
          Height = 24
          EditorEnabled = False
          MaxValue = 9999
          MinValue = 0
          TabOrder = 1
          Value = 100
          OnChange = EditSpiritMutinyTimeChange
        end
        object EditSpiritPowerRate: TSpinEdit
          Left = 90
          Top = 75
          Width = 61
          Height = 24
          EditorEnabled = False
          Enabled = False
          MaxValue = 9999
          MinValue = 0
          TabOrder = 2
          Value = 100
          OnChange = EditSpiritPowerRateChange
        end
      end
      object ButtonSpiritMutinySave: TButton
        Left = 450
        Top = 326
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 1
        OnClick = ButtonSpiritMutinySaveClick
      end
    end
  end
end
