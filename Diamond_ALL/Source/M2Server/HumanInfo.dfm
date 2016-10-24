object frmHumanInfo: TfrmHumanInfo
  Left = 387
  Top = 433
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '????'
  ClientHeight = 419
  ClientWidth = 806
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '??'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 10
    Top = 10
    Width = 791
    Height = 301
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = '????'
      object GroupBox1: TGroupBox
        Left = 10
        Top = 16
        Width = 251
        Height = 242
        Caption = '????'
        TabOrder = 0
        object Label1: TLabel
          Left = 10
          Top = 24
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object Label2: TLabel
          Left = 10
          Top = 54
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object Label3: TLabel
          Left = 10
          Top = 84
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object Label4: TLabel
          Left = 10
          Top = 114
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object Label5: TLabel
          Left = 10
          Top = 144
          Width = 28
          Height = 15
          Caption = '??IP:'
        end
        object Label6: TLabel
          Left = 10
          Top = 174
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object Label7: TLabel
          Left = 10
          Top = 204
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object EditName: TEdit
          Left = 80
          Top = 20
          Width = 161
          Height = 23
          ReadOnly = True
          TabOrder = 0
          Text = 'EditName'
        end
        object EditMap: TEdit
          Left = 80
          Top = 50
          Width = 161
          Height = 23
          ReadOnly = True
          TabOrder = 1
          Text = 'Edit1'
        end
        object EditXY: TEdit
          Left = 80
          Top = 80
          Width = 161
          Height = 23
          ReadOnly = True
          TabOrder = 2
          Text = 'Edit1'
        end
        object EditAccount: TEdit
          Left = 80
          Top = 110
          Width = 161
          Height = 23
          ReadOnly = True
          TabOrder = 3
          Text = 'Edit1'
        end
        object EditIPaddr: TEdit
          Left = 80
          Top = 140
          Width = 161
          Height = 23
          ReadOnly = True
          TabOrder = 4
          Text = 'Edit1'
        end
        object EditLogonTime: TEdit
          Left = 80
          Top = 170
          Width = 161
          Height = 23
          ReadOnly = True
          TabOrder = 5
          Text = 'Edit1'
        end
        object EditLogonLong: TEdit
          Left = 80
          Top = 200
          Width = 161
          Height = 23
          ReadOnly = True
          TabOrder = 6
          Text = 'Edit1'
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '????'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 10
        Top = 10
        Width = 191
        Height = 151
        Caption = '????'
        TabOrder = 0
        object Label12: TLabel
          Left = 10
          Top = 23
          Width = 17
          Height = 15
          Caption = '??:'
        end
        object Label8: TLabel
          Left = 10
          Top = 53
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object Label9: TLabel
          Left = 10
          Top = 83
          Width = 33
          Height = 15
          Caption = 'PK??:'
        end
        object Label10: TLabel
          Left = 10
          Top = 113
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object EditLevel: TSpinEdit
          Left = 85
          Top = 19
          Width = 86
          Height = 21
          MaxValue = 20000
          MinValue = 0
          TabOrder = 0
          Value = 10
        end
        object EditGold: TSpinEdit
          Left = 85
          Top = 49
          Width = 86
          Height = 21
          Increment = 1000
          MaxValue = 200000000
          MinValue = 0
          TabOrder = 1
          Value = 10
        end
        object EditPKPoint: TSpinEdit
          Left = 85
          Top = 79
          Width = 86
          Height = 21
          Increment = 50
          MaxValue = 20000
          MinValue = 0
          TabOrder = 2
          Value = 10
        end
        object EditExp: TSpinEdit
          Left = 85
          Top = 109
          Width = 86
          Height = 21
          EditorEnabled = False
          Enabled = False
          MaxValue = 0
          MinValue = 0
          TabOrder = 3
          Value = 10
        end
      end
      object GroupBox6: TGroupBox
        Left = 10
        Top = 170
        Width = 191
        Height = 91
        Caption = '????'
        TabOrder = 1
        object CheckBoxGameMaster: TCheckBox
          Left = 10
          Top = 20
          Width = 141
          Height = 21
          Caption = 'GM??'
          TabOrder = 0
        end
        object CheckBoxSuperMan: TCheckBox
          Left = 10
          Top = 40
          Width = 141
          Height = 21
          Caption = '????'
          TabOrder = 1
        end
        object CheckBoxObserver: TCheckBox
          Left = 10
          Top = 60
          Width = 141
          Height = 21
          Caption = '????'
          TabOrder = 2
        end
      end
      object GroupBox9: TGroupBox
        Left = 210
        Top = 10
        Width = 191
        Height = 251
        Caption = '????'
        TabOrder = 2
        object Label26: TLabel
          Left = 10
          Top = 23
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object Label27: TLabel
          Left = 10
          Top = 53
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object Label28: TLabel
          Left = 10
          Top = 83
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object Label29: TLabel
          Left = 10
          Top = 113
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object Label19: TLabel
          Left = 10
          Top = 143
          Width = 31
          Height = 15
          Hint = '????????'
          Caption = '????:'
        end
        object EditGameGold: TSpinEdit
          Left = 85
          Top = 19
          Width = 86
          Height = 21
          MaxValue = 20000000
          MinValue = 0
          TabOrder = 0
          Value = 10
        end
        object EditGamePoint: TSpinEdit
          Left = 85
          Top = 49
          Width = 86
          Height = 21
          MaxValue = 200000000
          MinValue = 0
          TabOrder = 1
          Value = 10
        end
        object EditCreditPoint: TSpinEdit
          Left = 85
          Top = 79
          Width = 86
          Height = 21
          MaxValue = 255
          MinValue = 0
          TabOrder = 2
          Value = 10
        end
        object EditBonusPoint: TSpinEdit
          Left = 85
          Top = 109
          Width = 86
          Height = 21
          Hint = '??????'
          MaxValue = 2000000
          MinValue = 0
          TabOrder = 3
          Value = 10
        end
        object EditEditBonusPointUsed: TSpinEdit
          Left = 85
          Top = 139
          Width = 86
          Height = 21
          Hint = '??????'
          EditorEnabled = False
          Enabled = False
          MaxValue = 0
          MinValue = 0
          TabOrder = 4
          Value = 10
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = '???'
      ImageIndex = 2
      object GroupBox3: TGroupBox
        Left = 10
        Top = 10
        Width = 191
        Height = 241
        Caption = '????'
        TabOrder = 0
        object Label11: TLabel
          Left = 10
          Top = 24
          Width = 17
          Height = 15
          Caption = '??:'
        end
        object Label13: TLabel
          Left = 10
          Top = 54
          Width = 17
          Height = 15
          Caption = '??:'
        end
        object Label14: TLabel
          Left = 10
          Top = 84
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object Label15: TLabel
          Left = 10
          Top = 114
          Width = 17
          Height = 15
          Caption = '??:'
        end
        object Label16: TLabel
          Left = 10
          Top = 144
          Width = 17
          Height = 15
          Caption = '??:'
        end
        object Label17: TLabel
          Left = 10
          Top = 174
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object Label18: TLabel
          Left = 10
          Top = 204
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object EditAC: TEdit
          Left = 70
          Top = 20
          Width = 101
          Height = 20
          ReadOnly = True
          TabOrder = 0
          Text = 'EditName'
        end
        object EditMAC: TEdit
          Left = 70
          Top = 50
          Width = 101
          Height = 20
          ReadOnly = True
          TabOrder = 1
          Text = 'EditName'
        end
        object EditDC: TEdit
          Left = 70
          Top = 80
          Width = 101
          Height = 20
          ReadOnly = True
          TabOrder = 2
          Text = 'EditName'
        end
        object EditMC: TEdit
          Left = 70
          Top = 110
          Width = 101
          Height = 20
          ReadOnly = True
          TabOrder = 3
          Text = 'EditName'
        end
        object EditSC: TEdit
          Left = 70
          Top = 140
          Width = 101
          Height = 20
          ReadOnly = True
          TabOrder = 4
          Text = 'EditName'
        end
        object EditHP: TEdit
          Left = 70
          Top = 170
          Width = 101
          Height = 20
          ReadOnly = True
          TabOrder = 5
          Text = 'EditName'
        end
        object EditMP: TEdit
          Left = 70
          Top = 200
          Width = 101
          Height = 20
          ReadOnly = True
          TabOrder = 6
          Text = 'EditName'
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = '????'
      ImageIndex = 3
      object GroupBox7: TGroupBox
        Left = 10
        Top = 10
        Width = 761
        Height = 251
        Caption = '????'
        TabOrder = 0
        object GridUserItem: TStringGrid
          Left = 10
          Top = 20
          Width = 741
          Height = 221
          ColCount = 10
          DefaultColWidth = 55
          DefaultRowHeight = 18
          RowCount = 14
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
          TabOrder = 0
          ColWidths = (
            55
            67
            63
            68
            45
            45
            44
            43
            46
            87)
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = '????'
      ImageIndex = 4
      object GroupBox8: TGroupBox
        Left = 10
        Top = 10
        Width = 761
        Height = 251
        Caption = '????'
        TabOrder = 0
        object GridBagItem: TStringGrid
          Left = 10
          Top = 20
          Width = 741
          Height = 221
          ColCount = 10
          DefaultColWidth = 55
          DefaultRowHeight = 18
          RowCount = 14
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
          TabOrder = 0
          ColWidths = (
            55
            67
            63
            68
            45
            45
            44
            43
            46
            88)
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = '????'
      ImageIndex = 5
      object GroupBox10: TGroupBox
        Left = 10
        Top = 10
        Width = 761
        Height = 251
        Caption = '????'
        TabOrder = 0
        object GridStorageItem: TStringGrid
          Left = 10
          Top = 20
          Width = 741
          Height = 221
          ColCount = 10
          DefaultColWidth = 55
          DefaultRowHeight = 18
          FixedCols = 0
          RowCount = 14
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goRowSelect]
          TabOrder = 0
          ColWidths = (
            55
            67
            63
            67
            45
            45
            44
            43
            46
            89)
        end
      end
    end
  end
  object GroupBox4: TGroupBox
    Left = 10
    Top = 320
    Width = 181
    Height = 91
    Caption = '??'
    TabOrder = 1
    object CheckBoxMonitor: TCheckBox
      Left = 10
      Top = 20
      Width = 111
      Height = 21
      Caption = '????'
      TabOrder = 0
      OnClick = CheckBoxMonitorClick
    end
    object ButtonKick: TButton
      Left = 10
      Top = 50
      Width = 81
      Height = 31
      Caption = '???'
      TabOrder = 1
      OnClick = ButtonKickClick
    end
  end
  object GroupBox5: TGroupBox
    Left = 200
    Top = 320
    Width = 151
    Height = 91
    Caption = '????'
    TabOrder = 2
    object EditHumanStatus: TEdit
      Left = 10
      Top = 30
      Width = 131
      Height = 23
      ReadOnly = True
      TabOrder = 0
    end
  end
  object ButtonSave: TButton
    Left = 420
    Top = 370
    Width = 81
    Height = 31
    Caption = '????'
    TabOrder = 3
    OnClick = ButtonSaveClick
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 144
    Top = 264
  end
end
