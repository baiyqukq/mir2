object frmViewLevel: TfrmViewLevel
  Left = 244
  Top = 301
  Width = 320
  Height = 308
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = '??????'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '??'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBox10: TGroupBox
    Left = 10
    Top = 10
    Width = 151
    Height = 61
    Caption = '????'
    TabOrder = 0
    object Label4: TLabel
      Left = 10
      Top = 25
      Width = 17
      Height = 15
      Caption = '??:'
    end
    object EditHumanLevel: TSpinEdit
      Left = 55
      Top = 19
      Width = 56
      Height = 24
      EditorEnabled = False
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 1
      OnChange = EditHumanLevelChange
    end
  end
  object GroupBox1: TGroupBox
    Left = 10
    Top = 80
    Width = 151
    Height = 61
    Caption = '????'
    TabOrder = 1
    object Label1: TLabel
      Left = 10
      Top = 25
      Width = 17
      Height = 15
      Caption = '??:'
    end
    object ComboBoxJob: TComboBox
      Left = 50
      Top = 20
      Width = 91
      Height = 23
      Style = csDropDownList
      ItemHeight = 15
      ItemIndex = 0
      TabOrder = 0
      Text = '??'
      OnChange = ComboBoxJobChange
      Items.Strings = (
        '??'
        '???'
        '??')
    end
  end
  object GridHumanInfo: TStringGrid
    Left = 170
    Top = 10
    Width = 211
    Height = 321
    ColCount = 2
    DefaultRowHeight = 18
    RowCount = 13
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
    TabOrder = 2
    ColWidths = (
      64
      99)
    RowHeights = (
      18
      18
      18
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
  object ButtonClose: TButton
    Left = 40
    Top = 190
    Width = 81
    Height = 31
    Caption = '??(&C)'
    TabOrder = 3
    OnClick = ButtonCloseClick
  end
end
