object frmViewKernelInfo: TfrmViewKernelInfo
  Left = 321
  Top = 267
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '??????'
  ClientHeight = 316
  ClientWidth = 593
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
  object PageControl1: TPageControl
    Left = 10
    Top = 10
    Width = 571
    Height = 261
    ActivePage = TabSheet4
    TabOrder = 0
    object TabSheet4: TTabSheet
      Caption = '????'
      ImageIndex = 3
      object GroupBox6: TGroupBox
        Left = 10
        Top = 10
        Width = 241
        Height = 121
        Caption = '????'
        TabOrder = 0
        object Label25: TLabel
          Left = 10
          Top = 25
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object Label26: TLabel
          Left = 10
          Top = 55
          Width = 38
          Height = 15
          Caption = '?????:'
        end
        object EditAllocMemCount: TEdit
          Left = 110
          Top = 50
          Width = 91
          Height = 23
          ReadOnly = True
          TabOrder = 0
        end
        object EditAllocMemSize: TEdit
          Left = 110
          Top = 20
          Width = 91
          Height = 23
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    object TabSheet1: TTabSheet
      Caption = '????'
      object GroupBox1: TGroupBox
        Left = 10
        Top = 5
        Width = 191
        Height = 151
        Caption = '?????'
        TabOrder = 0
        object Label1: TLabel
          Left = 10
          Top = 25
          Width = 45
          Height = 15
          Caption = '??????:'
        end
        object Label2: TLabel
          Left = 10
          Top = 55
          Width = 45
          Height = 15
          Caption = '??????:'
        end
        object Label3: TLabel
          Left = 10
          Top = 85
          Width = 45
          Height = 15
          Caption = '??????:'
        end
        object Label4: TLabel
          Left = 10
          Top = 115
          Width = 45
          Height = 15
          Caption = '??????:'
        end
        object EditLoadHumanDBCount: TEdit
          Left = 110
          Top = 20
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 0
        end
        object EditLoadHumanDBErrorCoun: TEdit
          Left = 110
          Top = 50
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 1
        end
        object EditSaveHumanDBCount: TEdit
          Left = 110
          Top = 80
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 2
        end
        object EditHumanDBQueryID: TEdit
          Left = 110
          Top = 110
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 3
        end
      end
      object GroupBox4: TGroupBox
        Left = 210
        Top = 5
        Width = 221
        Height = 86
        Caption = '?????'
        TabOrder = 1
        object Label7: TLabel
          Left = 10
          Top = 25
          Width = 45
          Height = 15
          Caption = '??????:'
        end
        object Label8: TLabel
          Left = 10
          Top = 55
          Width = 45
          Height = 15
          Caption = '??????:'
        end
        object EditItemNumber: TEdit
          Left = 110
          Top = 20
          Width = 91
          Height = 20
          ReadOnly = True
          TabOrder = 0
        end
        object EditItemNumberEx: TEdit
          Left = 110
          Top = 50
          Width = 91
          Height = 20
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '????'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 10
        Top = 5
        Width = 191
        Height = 96
        Caption = '????'
        TabOrder = 0
        object Label5: TLabel
          Left = 10
          Top = 25
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object Label6: TLabel
          Left = 10
          Top = 55
          Width = 31
          Height = 15
          Caption = '????:'
        end
        object EditWinLotteryCount: TEdit
          Left = 110
          Top = 20
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 0
        end
        object EditNoWinLotteryCount: TEdit
          Left = 110
          Top = 50
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 210
        Top = 5
        Width = 161
        Height = 206
        Caption = '????'
        TabOrder = 1
        object Label9: TLabel
          Left = 10
          Top = 25
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object Label10: TLabel
          Left = 10
          Top = 55
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object Label11: TLabel
          Left = 10
          Top = 85
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object Label12: TLabel
          Left = 10
          Top = 115
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object Label13: TLabel
          Left = 10
          Top = 145
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object Label14: TLabel
          Left = 10
          Top = 175
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object EditWinLotteryLevel1: TEdit
          Left = 70
          Top = 20
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 0
        end
        object EditWinLotteryLevel2: TEdit
          Left = 70
          Top = 50
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 1
        end
        object EditWinLotteryLevel3: TEdit
          Left = 70
          Top = 80
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 2
        end
        object EditWinLotteryLevel4: TEdit
          Left = 70
          Top = 110
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 3
        end
        object EditWinLotteryLevel5: TEdit
          Left = 70
          Top = 140
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 4
        end
        object EditWinLotteryLevel6: TEdit
          Left = 70
          Top = 170
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 5
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = '????'
      ImageIndex = 2
      object GroupBox5: TGroupBox
        Left = 10
        Top = 5
        Width = 531
        Height = 206
        Caption = '??????'
        TabOrder = 0
        object Label15: TLabel
          Left = 10
          Top = 25
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object Label16: TLabel
          Left = 10
          Top = 55
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object Label17: TLabel
          Left = 10
          Top = 85
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object Label18: TLabel
          Left = 10
          Top = 115
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object Label19: TLabel
          Left = 10
          Top = 145
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object Label20: TLabel
          Left = 10
          Top = 175
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object Label21: TLabel
          Left = 150
          Top = 115
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object Label22: TLabel
          Left = 150
          Top = 25
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object Label23: TLabel
          Left = 150
          Top = 55
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object Label24: TLabel
          Left = 150
          Top = 85
          Width = 24
          Height = 15
          Caption = '???:'
        end
        object EditGlobalVal1: TEdit
          Left = 70
          Top = 20
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 0
        end
        object EditGlobalVal2: TEdit
          Left = 70
          Top = 50
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 1
        end
        object EditGlobalVal3: TEdit
          Left = 70
          Top = 80
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 2
        end
        object EditGlobalVal4: TEdit
          Left = 70
          Top = 110
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 3
        end
        object EditGlobalVal5: TEdit
          Left = 70
          Top = 140
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 4
        end
        object EditGlobalVal6: TEdit
          Left = 70
          Top = 170
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 5
        end
        object EditGlobalVal7: TEdit
          Left = 210
          Top = 20
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 6
        end
        object EditGlobalVal8: TEdit
          Left = 210
          Top = 50
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 7
        end
        object EditGlobalVal9: TEdit
          Left = 210
          Top = 80
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 8
        end
        object EditGlobalVal10: TEdit
          Left = 210
          Top = 110
          Width = 71
          Height = 20
          ReadOnly = True
          TabOrder = 9
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = '????'
      ImageIndex = 4
      object GroupBox7: TGroupBox
        Left = 10
        Top = 5
        Width = 531
        Height = 206
        Caption = '????'
        TabOrder = 0
        object GridThread: TStringGrid
          Left = 10
          Top = 20
          Width = 511
          Height = 171
          DefaultRowHeight = 18
          FixedCols = 0
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
          TabOrder = 0
          ColWidths = (
            35
            50
            51
            90
            64)
        end
      end
    end
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 280
    Top = 200
  end
end
