object frmPrefConfig: TfrmPrefConfig
  Left = 279
  Top = 302
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Preferences'
  ClientHeight = 160
  ClientWidth = 446
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '??'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBoxServer: TGroupBox
    Left = 10
    Top = 10
    Width = 191
    Height = 111
    TabOrder = 0
    object LabelCheckTimeOut: TLabel
      Left = 10
      Top = 25
      Width = 50
      Height = 15
      Caption = 'TimeOut:'
    end
    object EditServerCheckTimeOut: TSpinEdit
      Left = 90
      Top = 20
      Width = 61
      Height = 24
      EditorEnabled = False
      Increment = 30
      MaxLength = 600
      MaxValue = 60
      MinValue = 60
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Value = 0
      OnChange = EditServerCheckTimeOutChange
    end
  end
  object GroupBox1: TGroupBox
    Left = 220
    Top = 10
    Width = 221
    Height = 111
    TabOrder = 1
    object LabelSendBlockSize: TLabel
      Left = 10
      Top = 25
      Width = 85
      Height = 15
      Caption = 'SendBlockSize:'
    end
    object EditSendBlockSize: TSpinEdit
      Left = 98
      Top = 20
      Width = 71
      Height = 24
      Hint = '???????????'
      EditorEnabled = False
      Increment = 50
      MaxLength = 600
      MaxValue = 5000
      MinValue = 100
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Value = 100
      OnChange = EditSendBlockSizeChange
    end
  end
  object ButtonOK: TButton
    Left = 358
    Top = 122
    Width = 81
    Height = 31
    Caption = 'Ok(&O)'
    TabOrder = 2
    OnClick = ButtonOKClick
  end
end
