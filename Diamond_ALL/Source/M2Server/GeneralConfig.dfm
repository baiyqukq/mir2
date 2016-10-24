object frmGeneralConfig: TfrmGeneralConfig
  Left = 279
  Top = 196
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'General Config'
  ClientHeight = 355
  ClientWidth = 523
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '??'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 15
  object Label26: TLabel
    Left = 13
    Top = 330
    Width = 204
    Height = 17
    Caption = '???????????,??????????????'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = '??'
    Font.Style = []
    ParentFont = False
  end
  object PageControl: TPageControl
    Left = 10
    Top = 10
    Width = 501
    Height = 311
    ActivePage = NetWorkSheet
    TabOrder = 0
    OnChanging = PageControlChanging
    object NetWorkSheet: TTabSheet
      Caption = 'Network'
      ImageIndex = 2
      object GroupBoxNet: TGroupBox
        Left = 10
        Top = 6
        Width = 231
        Height = 85
        Caption = 'RunGate'
        TabOrder = 0
        object LabelGateIPaddr: TLabel
          Left = 10
          Top = 25
          Width = 43
          Height = 15
          Caption = 'Gate IP:'
        end
        object LabelGatePort: TLabel
          Left = 10
          Top = 55
          Width = 54
          Height = 15
          Caption = 'Gate Port:'
        end
        object EditGateAddr: TEdit
          Left = 100
          Top = 20
          Width = 121
          Height = 23
          Hint = '??????????IP,????????IP??,?????????0.0.0.0?'
          TabOrder = 0
          Text = '127.0.0.1'
          OnChange = EditValueChange
        end
        object EditGatePort: TEdit
          Left = 100
          Top = 50
          Width = 51
          Height = 23
          Hint = '????????,??????5000?'
          TabOrder = 1
          Text = '5000'
          OnChange = EditValueChange
        end
      end
      object ButtonNetWorkSave: TButton
        Left = 400
        Top = 236
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 1
        OnClick = ButtonNetWorkSaveClick
      end
      object GroupBox1: TGroupBox
        Left = 10
        Top = 96
        Width = 231
        Height = 85
        Caption = 'DBServer'
        TabOrder = 2
        object Label4: TLabel
          Left = 10
          Top = 55
          Width = 45
          Height = 15
          Caption = 'DB Port:'
        end
        object Label5: TLabel
          Left = 10
          Top = 25
          Width = 34
          Height = 15
          Caption = 'DB IP:'
        end
        object EditDBPort: TEdit
          Left = 100
          Top = 50
          Width = 51
          Height = 23
          Hint = '?????????????'
          TabOrder = 0
          Text = '6000'
          OnChange = EditValueChange
        end
        object EditDBAddr: TEdit
          Left = 100
          Top = 20
          Width = 121
          Height = 23
          Hint = '????????IP???'
          TabOrder = 1
          Text = '127.0.0.1'
          OnChange = EditValueChange
        end
      end
      object GroupBox2: TGroupBox
        Left = 250
        Top = 6
        Width = 231
        Height = 85
        Caption = 'LoginServer'
        TabOrder = 3
        object Label2: TLabel
          Left = 10
          Top = 55
          Width = 48
          Height = 15
          Caption = 'IDS Port:'
        end
        object Label3: TLabel
          Left = 10
          Top = 25
          Width = 37
          Height = 15
          Caption = 'IDS IP:'
        end
        object EditIDSPort: TEdit
          Left = 100
          Top = 50
          Width = 51
          Height = 23
          Hint = '????????'
          TabOrder = 0
          Text = '5600'
          OnChange = EditValueChange
        end
        object EditIDSAddr: TEdit
          Left = 100
          Top = 20
          Width = 121
          Height = 23
          Hint = '?????IP???'
          TabOrder = 1
          Text = '127.0.0.1'
          OnChange = EditValueChange
        end
      end
      object GroupBox3: TGroupBox
        Left = 250
        Top = 96
        Width = 231
        Height = 85
        Caption = 'LogServer'
        TabOrder = 4
        object Label6: TLabel
          Left = 10
          Top = 55
          Width = 84
          Height = 15
          Caption = 'LogServer Port:'
        end
        object Label7: TLabel
          Left = 10
          Top = 25
          Width = 73
          Height = 15
          Caption = 'LogServer IP:'
        end
        object EditLogServerPort: TEdit
          Left = 100
          Top = 50
          Width = 51
          Height = 23
          Hint = '??????????'
          TabOrder = 0
          Text = '10000'
          OnChange = EditValueChange
        end
        object EditLogServerAddr: TEdit
          Left = 100
          Top = 20
          Width = 121
          Height = 23
          Hint = '???????IP???'
          TabOrder = 1
          Text = '127.0.0.1'
          OnChange = EditValueChange
        end
      end
      object GroupBox4: TGroupBox
        Left = 10
        Top = 186
        Width = 231
        Height = 85
        Caption = 'MsgServer'
        TabOrder = 5
        object Label8: TLabel
          Left = 10
          Top = 55
          Width = 68
          Height = 15
          Caption = 'MsgSrv Port:'
        end
        object Label9: TLabel
          Left = 10
          Top = 25
          Width = 57
          Height = 15
          Caption = 'MsgSrv IP:'
        end
        object EditMsgSrvPort: TEdit
          Left = 100
          Top = 50
          Width = 51
          Height = 23
          Hint = '????????,?????????????????????????????'
          TabOrder = 0
          Text = '4900'
          OnChange = EditValueChange
        end
        object EditMsgSrvAddr: TEdit
          Left = 100
          Top = 20
          Width = 121
          Height = 23
          Hint = '??????IP,?????????????????????????????'
          TabOrder = 1
          Text = '127.0.0.1'
          OnChange = EditValueChange
        end
      end
    end
    object ServerInfoSheet: TTabSheet
      Caption = 'Info'
      object GroupBoxInfo: TGroupBox
        Left = 10
        Top = 6
        Width = 231
        Height = 122
        Caption = '????'
        TabOrder = 0
        object Label1: TLabel
          Left = 10
          Top = 25
          Width = 37
          Height = 15
          Caption = 'Name:'
        end
        object Label10: TLabel
          Left = 10
          Top = 55
          Width = 56
          Height = 15
          Caption = 'Server Idx:'
        end
        object Label11: TLabel
          Left = 120
          Top = 55
          Width = 57
          Height = 15
          Caption = 'Server No:'
        end
        object EditGameName: TEdit
          Left = 80
          Top = 20
          Width = 141
          Height = 23
          Hint = '????????'
          TabOrder = 0
          Text = '????'
          OnChange = EditValueChange
        end
        object EditServerIndex: TEdit
          Left = 80
          Top = 50
          Width = 31
          Height = 23
          Hint = '???????,?????????????,???????0?'
          TabOrder = 1
          Text = '0'
          OnChange = EditValueChange
        end
        object EditServerNumber: TEdit
          Left = 190
          Top = 50
          Width = 31
          Height = 23
          Hint = '??????,??????'
          TabOrder = 2
          Text = '0'
          OnChange = EditValueChange
        end
        object CheckBoxServiceMode: TCheckBox
          Left = 10
          Top = 80
          Width = 91
          Height = 21
          Hint = '????,?????????????'
          Caption = 'Service Mode'
          TabOrder = 3
          Visible = False
          OnClick = EditValueChange
        end
      end
      object GroupBox5: TGroupBox
        Left = 250
        Top = 6
        Width = 207
        Height = 122
        TabOrder = 1
        Visible = False
        object Label12: TLabel
          Left = 10
          Top = 25
          Width = 59
          Height = 15
          Caption = 'Test Level:'
        end
        object Label13: TLabel
          Left = 10
          Top = 55
          Width = 56
          Height = 15
          Caption = 'Test Gold:'
        end
        object Label14: TLabel
          Left = 10
          Top = 85
          Width = 84
          Height = 15
          Caption = 'Test UserLimit:'
        end
        object EditTestLevel: TEdit
          Left = 96
          Top = 20
          Width = 91
          Height = 23
          Hint = '????,???????'
          TabOrder = 0
          Text = '0'
          OnChange = EditValueChange
        end
        object EditTestGold: TEdit
          Left = 96
          Top = 50
          Width = 91
          Height = 23
          Hint = '????,????????'
          TabOrder = 1
          Text = '0'
          OnChange = EditValueChange
        end
        object EditTestUserLimit: TEdit
          Left = 96
          Top = 80
          Width = 91
          Height = 23
          Hint = '????,???????'
          TabOrder = 2
          Text = '0'
          OnChange = EditValueChange
        end
        object CheckBoxTestServer: TCheckBox
          Left = 10
          Top = -3
          Width = 91
          Height = 22
          Hint = '????,?????,?????????????????'
          Caption = 'Test Server'
          TabOrder = 3
          OnClick = CheckBoxTestServerClick
        end
      end
      object ButtonServerInfoSave: TButton
        Left = 400
        Top = 236
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 2
        OnClick = ButtonServerInfoSaveClick
      end
      object GroupBox6: TGroupBox
        Left = 10
        Top = 140
        Width = 231
        Height = 61
        Caption = '??????'
        TabOrder = 3
        Visible = False
        object Label15: TLabel
          Left = 10
          Top = 25
          Width = 53
          Height = 15
          Caption = 'User Full:'
        end
        object EditUserFull: TEdit
          Left = 80
          Top = 20
          Width = 51
          Height = 23
          Hint = '????????????'
          TabOrder = 0
          Text = '1000'
          OnChange = EditValueChange
        end
      end
    end
    object ShareSheet: TTabSheet
      Caption = 'Share'
      ImageIndex = 1
      object Label17: TLabel
        Left = 10
        Top = 15
        Width = 51
        Height = 15
        Caption = 'Guild Dir:'
      end
      object Label18: TLabel
        Left = 10
        Top = 45
        Width = 55
        Height = 15
        Caption = 'Guild File:'
      end
      object Label24: TLabel
        Left = 10
        Top = 225
        Width = 47
        Height = 15
        BiDiMode = bdRightToLeft
        Caption = 'Plug Dir:'
        ParentBiDiMode = False
      end
      object Label23: TLabel
        Left = 10
        Top = 195
        Width = 57
        Height = 15
        Caption = 'Notice Dir:'
      end
      object Label22: TLabel
        Left = 10
        Top = 165
        Width = 45
        Height = 15
        Caption = 'Map Dir:'
      end
      object Label21: TLabel
        Left = 10
        Top = 135
        Width = 49
        Height = 15
        Caption = 'Envir Dir:'
      end
      object Label20: TLabel
        Left = 10
        Top = 105
        Width = 58
        Height = 15
        Caption = 'Castle Dir:'
      end
      object Label19: TLabel
        Left = 10
        Top = 75
        Width = 66
        Height = 15
        Caption = 'ConLog Dir:'
      end
      object Label25: TLabel
        Left = 10
        Top = 255
        Width = 64
        Height = 15
        BiDiMode = bdRightToLeft
        Caption = 'Venture Dir:'
        ParentBiDiMode = False
      end
      object EditGuildDir: TEdit
        Left = 80
        Top = 10
        Width = 301
        Height = 23
        Hint = '?????????'
        TabOrder = 0
        OnChange = EditValueChange
      end
      object EditGuildFile: TEdit
        Left = 80
        Top = 40
        Width = 301
        Height = 23
        Hint = '??????????'
        TabOrder = 1
        OnChange = EditValueChange
      end
      object EditConLogDir: TEdit
        Left = 80
        Top = 70
        Width = 301
        Height = 23
        Hint = '?????????????'
        TabOrder = 2
        OnChange = EditValueChange
      end
      object EditCastleDir: TEdit
        Left = 80
        Top = 100
        Width = 301
        Height = 23
        TabOrder = 3
        OnChange = EditValueChange
      end
      object EditEnvirDir: TEdit
        Left = 80
        Top = 130
        Width = 301
        Height = 23
        TabOrder = 4
        OnChange = EditValueChange
      end
      object EditMapDir: TEdit
        Left = 80
        Top = 160
        Width = 301
        Height = 23
        TabOrder = 5
        OnChange = EditValueChange
      end
      object EditNoticeDir: TEdit
        Left = 80
        Top = 190
        Width = 301
        Height = 23
        TabOrder = 6
        OnChange = EditValueChange
      end
      object EditPlugDir: TEdit
        Left = 80
        Top = 220
        Width = 301
        Height = 23
        TabOrder = 7
        OnChange = EditValueChange
      end
      object EditVentureDir: TEdit
        Left = 80
        Top = 250
        Width = 301
        Height = 23
        TabOrder = 8
        OnChange = EditValueChange
      end
      object ButtonShareDirSave: TButton
        Left = 400
        Top = 236
        Width = 81
        Height = 32
        Caption = '&Save'
        TabOrder = 9
        OnClick = ButtonShareDirSaveClick
      end
    end
    object TabSheet1: TTabSheet
      Caption = 'Misc'
      ImageIndex = 3
      object GroupBox8: TGroupBox
        Left = 10
        Top = 10
        Width = 241
        Height = 151
        Caption = 'Hint'
        TabOrder = 0
        object ColorBoxHint: TColorBox
          Left = 10
          Top = 20
          Width = 141
          Height = 22
          Hint = '?????????'
          ItemHeight = 16
          TabOrder = 0
          OnChange = ColorBoxHintChange
        end
      end
    end
  end
end
