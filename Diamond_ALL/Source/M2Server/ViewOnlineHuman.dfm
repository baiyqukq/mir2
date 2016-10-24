object frmViewOnlineHuman: TfrmViewOnlineHuman
  Left = 265
  Top = 129
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Online Players'
  ClientHeight = 328
  ClientWidth = 860
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '??'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 140
    Top = 300
    Width = 25
    Height = 15
    Caption = 'Sort:'
  end
  object PanelStatus: TPanel
    Left = 0
    Top = 0
    Width = 860
    Height = 271
    Align = alTop
    Caption = '??????...'
    TabOrder = 0
    object GridHuman: TStringGrid
      Left = 1
      Top = 1
      Width = 858
      Height = 269
      Align = alClient
      ColCount = 14
      DefaultRowHeight = 18
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
      OnDblClick = GridHumanDblClick
      ColWidths = (
        33
        78
        31
        44
        39
        37
        47
        74
        89
        32
        138
        59
        55
        57)
    end
  end
  object ButtonRefGrid: TButton
    Left = 10
    Top = 290
    Width = 91
    Height = 31
    Caption = '&Refresh'
    TabOrder = 1
    OnClick = ButtonRefGridClick
  end
  object ComboBoxSort: TComboBox
    Left = 190
    Top = 298
    Width = 141
    Height = 23
    Style = csDropDownList
    ItemHeight = 15
    TabOrder = 2
    OnClick = ComboBoxSortClick
    Items.Strings = (
      '??'
      '??'
      '??'
      '??'
      '??'
      'IP'
      '??'
      '????')
  end
  object EditSearchName: TEdit
    Left = 400
    Top = 298
    Width = 161
    Height = 23
    TabOrder = 3
  end
  object ButtonSearch: TButton
    Left = 570
    Top = 290
    Width = 91
    Height = 31
    Caption = '&Search'
    TabOrder = 4
    OnClick = ButtonSearchClick
  end
  object ButtonView: TButton
    Left = 752
    Top = 290
    Width = 101
    Height = 31
    Caption = '&View'
    TabOrder = 5
    OnClick = ButtonViewClick
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 288
    Top = 232
  end
end
