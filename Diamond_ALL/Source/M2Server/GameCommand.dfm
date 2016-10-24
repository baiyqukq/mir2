object frmGameCmd: TfrmGameCmd
  Left = 323
  Top = 260
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Game Commands'
  ClientHeight = 386
  ClientWidth = 726
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '??'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object PageControl: TPageControl
    Left = 10
    Top = 10
    Width = 711
    Height = 371
    ActivePage = TabSheet1
    HotTrack = True
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'General'
      object StringGridGameCmd: TStringGrid
        Left = 3
        Top = 10
        Width = 688
        Height = 201
        ColCount = 4
        DefaultRowHeight = 18
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goRowSelect]
        TabOrder = 0
        OnClick = StringGridGameCmdClick
        ColWidths = (
          88
          71
          129
          248)
      end
      object GroupBox1: TGroupBox
        Left = 3
        Top = 220
        Width = 688
        Height = 111
        Caption = '????'
        TabOrder = 1
        object Label1: TLabel
          Left = 10
          Top = 25
          Width = 30
          Height = 15
          Caption = 'Cmd:'
        end
        object Label6: TLabel
          Left = 220
          Top = 23
          Width = 67
          Height = 15
          Caption = 'Permission:'
        end
        object LabelUserCmdFunc: TLabel
          Left = 80
          Top = 55
          Width = 501
          Height = 15
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = '??'
          Font.Style = []
          ParentFont = False
        end
        object LabelUserCmdParam: TLabel
          Left = 80
          Top = 85
          Width = 501
          Height = 15
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = '??'
          Font.Style = []
          ParentFont = False
        end
        object Label2: TLabel
          Left = 10
          Top = 55
          Width = 32
          Height = 15
          Caption = 'Desc:'
        end
        object Label3: TLabel
          Left = 10
          Top = 85
          Width = 40
          Height = 15
          Caption = 'Param:'
        end
        object EditUserCmdName: TEdit
          Left = 80
          Top = 20
          Width = 131
          Height = 23
          TabOrder = 0
          OnChange = EditUserCmdNameChange
        end
        object EditUserCmdPerMission: TSpinEdit
          Left = 295
          Top = 19
          Width = 56
          Height = 24
          MaxValue = 10
          MinValue = 0
          TabOrder = 1
          Value = 10
          OnChange = EditUserCmdPerMissionChange
        end
        object EditUserCmdOK: TButton
          Left = 590
          Top = 20
          Width = 81
          Height = 31
          Caption = '&Ok'
          TabOrder = 2
          OnClick = EditUserCmdOKClick
        end
        object EditUserCmdSave: TButton
          Left = 590
          Top = 70
          Width = 81
          Height = 31
          Caption = '&Save'
          TabOrder = 3
          OnClick = EditUserCmdSaveClick
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'GameMaster'
      ImageIndex = 1
      object StringGridGameMasterCmd: TStringGrid
        Left = 3
        Top = 10
        Width = 688
        Height = 201
        ColCount = 4
        DefaultRowHeight = 18
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goRowSelect]
        TabOrder = 0
        OnClick = StringGridGameMasterCmdClick
        ColWidths = (
          88
          71
          129
          248)
      end
      object GroupBox2: TGroupBox
        Left = 3
        Top = 220
        Width = 688
        Height = 111
        Caption = '????'
        TabOrder = 1
        object Label4: TLabel
          Left = 10
          Top = 25
          Width = 30
          Height = 15
          Caption = 'Cmd:'
        end
        object Label5: TLabel
          Left = 220
          Top = 23
          Width = 67
          Height = 15
          Caption = 'Permission:'
        end
        object LabelGameMasterCmdFunc: TLabel
          Left = 80
          Top = 55
          Width = 501
          Height = 15
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = '??'
          Font.Style = []
          ParentFont = False
        end
        object LabelGameMasterCmdParam: TLabel
          Left = 80
          Top = 85
          Width = 501
          Height = 15
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = '??'
          Font.Style = []
          ParentFont = False
        end
        object Label7: TLabel
          Left = 10
          Top = 55
          Width = 32
          Height = 15
          Caption = 'Desc:'
        end
        object Label8: TLabel
          Left = 10
          Top = 85
          Width = 40
          Height = 15
          Caption = 'Param:'
        end
        object EditGameMasterCmdName: TEdit
          Left = 80
          Top = 20
          Width = 131
          Height = 23
          TabOrder = 0
          OnChange = EditGameMasterCmdNameChange
        end
        object EditGameMasterCmdPerMission: TSpinEdit
          Left = 295
          Top = 19
          Width = 56
          Height = 24
          MaxValue = 10
          MinValue = 0
          TabOrder = 1
          Value = 10
          OnChange = EditGameMasterCmdPerMissionChange
        end
        object EditGameMasterCmdOK: TButton
          Left = 590
          Top = 20
          Width = 81
          Height = 31
          Caption = '&Ok'
          TabOrder = 2
          OnClick = EditGameMasterCmdOKClick
        end
        object EditGameMasterCmdSave: TButton
          Left = 590
          Top = 70
          Width = 81
          Height = 31
          Caption = '&Save'
          TabOrder = 3
          OnClick = EditGameMasterCmdSaveClick
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Debug'
      ImageIndex = 2
      object StringGridGameDebugCmd: TStringGrid
        Left = 3
        Top = 10
        Width = 688
        Height = 201
        ColCount = 4
        DefaultRowHeight = 18
        FixedCols = 0
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing, goRowSelect]
        TabOrder = 0
        OnClick = StringGridGameDebugCmdClick
        ColWidths = (
          88
          71
          129
          248)
      end
      object GroupBox3: TGroupBox
        Left = 3
        Top = 220
        Width = 688
        Height = 111
        Caption = '????'
        TabOrder = 1
        object Label9: TLabel
          Left = 10
          Top = 25
          Width = 30
          Height = 15
          Caption = 'Cmd:'
        end
        object Label10: TLabel
          Left = 220
          Top = 23
          Width = 67
          Height = 15
          Caption = 'Permission:'
        end
        object LabelGameDebugCmdFunc: TLabel
          Left = 80
          Top = 55
          Width = 501
          Height = 15
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = '??'
          Font.Style = []
          ParentFont = False
        end
        object LabelGameDebugCmdParam: TLabel
          Left = 80
          Top = 85
          Width = 501
          Height = 15
          AutoSize = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = '??'
          Font.Style = []
          ParentFont = False
        end
        object Label11: TLabel
          Left = 10
          Top = 55
          Width = 32
          Height = 15
          Caption = 'Desc:'
        end
        object Label12: TLabel
          Left = 10
          Top = 85
          Width = 40
          Height = 15
          Caption = 'Param:'
        end
        object EditGameDebugCmdName: TEdit
          Left = 80
          Top = 20
          Width = 131
          Height = 23
          TabOrder = 0
          OnChange = EditGameDebugCmdNameChange
        end
        object EditGameDebugCmdPerMission: TSpinEdit
          Left = 295
          Top = 19
          Width = 56
          Height = 24
          MaxValue = 10
          MinValue = 0
          TabOrder = 1
          Value = 10
          OnChange = EditGameDebugCmdPerMissionChange
        end
        object EditGameDebugCmdOK: TButton
          Left = 590
          Top = 20
          Width = 81
          Height = 31
          Caption = '&Ok'
          TabOrder = 2
          OnClick = EditGameDebugCmdOKClick
        end
        object EditGameDebugCmdSave: TButton
          Left = 590
          Top = 70
          Width = 81
          Height = 31
          Caption = '&Save'
          TabOrder = 3
          OnClick = EditGameDebugCmdSaveClick
        end
      end
    end
  end
end
