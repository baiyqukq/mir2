object frmViewSession: TfrmViewSession
  Left = 359
  Top = 235
  Width = 438
  Height = 243
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Session Viewer'
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
  object ButtonRefGrid: TButton
    Left = 10
    Top = 172
    Width = 91
    Height = 31
    Caption = '&Refresh'
    TabOrder = 0
    OnClick = ButtonRefGridClick
  end
  object PanelStatus: TPanel
    Left = 0
    Top = 0
    Width = 430
    Height = 161
    Align = alTop
    TabOrder = 1
    object GridSession: TStringGrid
      Left = 1
      Top = 1
      Width = 428
      Height = 159
      Align = alClient
      ColCount = 6
      DefaultRowHeight = 18
      FixedCols = 0
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
      TabOrder = 0
      ColWidths = (
        34
        83
        86
        73
        67
        72)
    end
  end
end
