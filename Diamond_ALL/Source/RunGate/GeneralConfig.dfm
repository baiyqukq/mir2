object frmGeneralConfig: TfrmGeneralConfig
  Left = 218
  Top = 153
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Config'
  ClientHeight = 198
  ClientWidth = 463
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '??'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBoxNet: TGroupBox
    Left = 10
    Top = 10
    Width = 231
    Height = 141
    Caption = 'Internet'
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
    object LabelServerPort: TLabel
      Left = 10
      Top = 115
      Width = 63
      Height = 15
      Caption = 'Server Port:'
    end
    object LabelServerIPaddr: TLabel
      Left = 10
      Top = 85
      Width = 52
      Height = 15
      Caption = 'Server IP:'
    end
    object EditGateIPaddr: TEdit
      Left = 100
      Top = 20
      Width = 121
      Height = 23
      Hint = 
        '???????? 0.0.0.0 ,????????'#13#10'????????IP???,???????'#13#10'???IP,???????' +
        '?IP????'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = '127.0.0.1'
    end
    object EditGatePort: TEdit
      Left = 100
      Top = 50
      Width = 51
      Height = 23
      Hint = '??????????,?????? 7200,'#13#10'????????????????'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Text = '7200'
    end
    object EditServerPort: TEdit
      Left = 100
      Top = 110
      Width = 51
      Height = 23
      Hint = '????????,?????? 5000,'#13#10'??????????????,???'#13#10'?????????'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Text = '5000'
    end
    object EditServerIPaddr: TEdit
      Left = 100
      Top = 80
      Width = 121
      Height = 23
      Hint = '??????IP??,?????????'#13#10'???,???? 127.0.0.1 ?'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      Text = '127.0.0.1'
    end
  end
  object GroupBoxInfo: TGroupBox
    Left = 250
    Top = 10
    Width = 201
    Height = 141
    Caption = 'Info'
    TabOrder = 1
    object Label1: TLabel
      Left = 10
      Top = 25
      Width = 26
      Height = 15
      Caption = 'Title:'
    end
    object LabelShowLogLevel: TLabel
      Left = 10
      Top = 55
      Width = 56
      Height = 15
      Caption = 'Log Level:'
    end
    object LabelShowBite: TLabel
      Left = 10
      Top = 115
      Width = 55
      Height = 15
      Caption = 'Byte Type:'
    end
    object EditTitle: TEdit
      Left = 50
      Top = 20
      Width = 131
      Height = 23
      Hint = '??????????,????????'#13#10'?????????'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Text = 'ktest'
    end
    object TrackBarLogLevel: TTrackBar
      Left = 10
      Top = 70
      Width = 181
      Height = 31
      Hint = '?????????????'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
    end
    object ComboBoxShowBite: TComboBox
      Left = 110
      Top = 110
      Width = 71
      Height = 23
      Hint = '????????????????????'
      Style = csDropDownList
      ItemHeight = 15
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Items.Strings = (
        'KB'
        'B')
    end
  end
  object ButtonOK: TButton
    Left = 370
    Top = 160
    Width = 81
    Height = 31
    Hint = '??????,??????????'#13#10'??????'
    Caption = 'Ok(&O)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = ButtonOKClick
  end
end
