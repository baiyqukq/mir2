object frmMonsterConfig: TfrmMonsterConfig
  Left = 227
  Top = 251
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #24618#29289#35774#32622
  ClientHeight = 320
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 8
    Top = 8
    Width = 601
    Height = 297
    ActivePage = TabSheet1
    TabIndex = 0
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #22522#26412#21442#25968
      object GroupBox1: TGroupBox
        Left = 8
        Top = 8
        Width = 577
        Height = 257
        TabOrder = 0
        object GroupBox8: TGroupBox
          Left = 8
          Top = 16
          Width = 153
          Height = 73
          Caption = #29190#29289#21697#35774#32622
          TabOrder = 0
          object Label23: TLabel
            Left = 11
            Top = 24
            Width = 39
            Height = 13
            Caption = #37329#24065#22534':'
          end
          object EditMonOneDropGoldCount: TSpinEdit
            Left = 60
            Top = 20
            Width = 77
            Height = 22
            MaxValue = 99999999
            MinValue = 1
            TabOrder = 0
            Value = 10
            OnChange = EditMonOneDropGoldCountChange
          end
        end
        object ButtonGeneralSave: TButton
          Left = 504
          Top = 221
          Width = 65
          Height = 25
          Caption = #20445#23384'(&S)'
          TabOrder = 1
          OnClick = ButtonGeneralSaveClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = #24618#29289#31867#22411
      ImageIndex = 1
    end
  end
end
