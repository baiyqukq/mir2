object frmEditRcd: TfrmEditRcd
  Left = 261
  Top = 246
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Record Edit'
  ClientHeight = 390
  ClientWidth = 564
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
    Width = 541
    Height = 331
    ActivePage = TabSheet3
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Base'
      object GroupBox1: TGroupBox
        Left = 10
        Top = 10
        Width = 511
        Height = 271
        TabOrder = 0
        object Label1: TLabel
          Left = 10
          Top = 55
          Width = 57
          Height = 15
          Caption = 'Character:'
        end
        object Label2: TLabel
          Left = 10
          Top = 85
          Width = 46
          Height = 15
          Caption = 'Account:'
        end
        object Label3: TLabel
          Left = 10
          Top = 115
          Width = 59
          Height = 15
          Caption = 'Password:'
        end
        object Label4: TLabel
          Left = 10
          Top = 145
          Width = 30
          Height = 15
          Caption = 'Dear:'
        end
        object Label5: TLabel
          Left = 10
          Top = 175
          Width = 40
          Height = 15
          Caption = 'Master:'
        end
        object Label11: TLabel
          Left = 10
          Top = 25
          Width = 18
          Height = 15
          Caption = 'Idx:'
        end
        object Label12: TLabel
          Left = 210
          Top = 25
          Width = 49
          Height = 15
          Caption = 'Cur Map:'
        end
        object Label13: TLabel
          Left = 210
          Top = 55
          Width = 43
          Height = 15
          Caption = 'Co-Ord:'
        end
        object Label14: TLabel
          Left = 210
          Top = 85
          Width = 63
          Height = 15
          Caption = 'Home Map:'
        end
        object Label15: TLabel
          Left = 210
          Top = 115
          Width = 43
          Height = 15
          Caption = 'Co-Ord:'
        end
        object EditChrName: TEdit
          Left = 80
          Top = 50
          Width = 121
          Height = 23
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 0
        end
        object EditAccount: TEdit
          Left = 80
          Top = 80
          Width = 121
          Height = 23
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 1
        end
        object EditPassword: TEdit
          Left = 80
          Top = 110
          Width = 121
          Height = 23
          TabOrder = 2
          OnChange = EditPasswordChange
        end
        object EditDearName: TEdit
          Left = 80
          Top = 140
          Width = 121
          Height = 23
          TabOrder = 3
          OnChange = EditPasswordChange
        end
        object EditMasterName: TEdit
          Left = 80
          Top = 170
          Width = 121
          Height = 23
          TabOrder = 4
          OnChange = EditPasswordChange
        end
        object EditIdx: TEdit
          Left = 80
          Top = 20
          Width = 121
          Height = 23
          Color = cl3DLight
          ReadOnly = True
          TabOrder = 5
        end
        object EditCurMap: TEdit
          Left = 280
          Top = 20
          Width = 121
          Height = 23
          TabOrder = 6
          OnChange = EditPasswordChange
        end
        object EditCurX: TSpinEdit
          Left = 280
          Top = 50
          Width = 61
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 7
          Value = 0
          OnChange = EditPasswordChange
        end
        object EditCurY: TSpinEdit
          Left = 340
          Top = 50
          Width = 61
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 8
          Value = 0
          OnChange = EditPasswordChange
        end
        object EditHomeMap: TEdit
          Left = 280
          Top = 80
          Width = 121
          Height = 23
          TabOrder = 9
          OnClick = EditPasswordChange
        end
        object EditHomeX: TSpinEdit
          Left = 280
          Top = 110
          Width = 61
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 10
          Value = 0
          OnChange = EditPasswordChange
        end
        object EditHomeY: TSpinEdit
          Left = 340
          Top = 110
          Width = 61
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 11
          Value = 0
          OnChange = EditPasswordChange
        end
        object CheckBoxIsMaster: TCheckBox
          Left = 80
          Top = 200
          Width = 71
          Height = 21
          Caption = 'IsMaster'
          TabOrder = 12
          OnClick = EditPasswordChange
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Points'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 10
        Top = 10
        Width = 511
        Height = 271
        TabOrder = 0
        object Label6: TLabel
          Left = 10
          Top = 25
          Width = 32
          Height = 15
          Caption = 'Level:'
        end
        object Label7: TLabel
          Left = 10
          Top = 55
          Width = 29
          Height = 15
          Caption = 'Gold:'
        end
        object Label8: TLabel
          Left = 10
          Top = 85
          Width = 63
          Height = 15
          Caption = 'GameGold:'
        end
        object Label9: TLabel
          Left = 10
          Top = 115
          Width = 69
          Height = 15
          Caption = 'Game-Point:'
        end
        object Label16: TLabel
          Left = 10
          Top = 175
          Width = 68
          Height = 15
          Caption = 'Credit-Point:'
        end
        object Label10: TLabel
          Left = 10
          Top = 145
          Width = 55
          Height = 15
          Caption = 'Pay-Point:'
        end
        object Label17: TLabel
          Left = 10
          Top = 205
          Width = 51
          Height = 15
          Caption = 'PK-Point:'
        end
        object Label18: TLabel
          Left = 10
          Top = 235
          Width = 70
          Height = 15
          Caption = 'Contribution:'
        end
        object EditLevel: TSpinEdit
          Left = 96
          Top = 20
          Width = 81
          Height = 24
          MaxValue = 65535
          MinValue = 0
          TabOrder = 0
          Value = 0
          OnChange = EditPasswordChange
        end
        object EditGold: TSpinEdit
          Left = 96
          Top = 50
          Width = 81
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
          OnChange = EditPasswordChange
        end
        object EditGameGold: TSpinEdit
          Left = 96
          Top = 80
          Width = 81
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 0
          OnChange = EditPasswordChange
        end
        object EditGamePoint: TSpinEdit
          Left = 96
          Top = 110
          Width = 81
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 3
          Value = 0
          OnChange = EditPasswordChange
        end
        object EditCreditPoint: TSpinEdit
          Left = 96
          Top = 170
          Width = 81
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 4
          Value = 0
          OnChange = EditPasswordChange
        end
        object EditPayPoint: TSpinEdit
          Left = 96
          Top = 140
          Width = 81
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 5
          Value = 0
          OnChange = EditPasswordChange
        end
        object EditPKPoint: TSpinEdit
          Left = 96
          Top = 200
          Width = 81
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 6
          Value = 0
          OnChange = EditPasswordChange
        end
        object EditContribution: TSpinEdit
          Left = 96
          Top = 230
          Width = 81
          Height = 24
          MaxValue = 0
          MinValue = 0
          TabOrder = 7
          Value = 0
          OnChange = EditPasswordChange
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'Magic'
      ImageIndex = 2
      object GroupBox3: TGroupBox
        Left = 10
        Top = 10
        Width = 511
        Height = 271
        TabOrder = 0
        object ListViewMagic: TListView
          Left = 11
          Top = 20
          Width = 431
          Height = 231
          Columns = <
            item
              Caption = 'Level'
            end
            item
              Caption = 'Trained'
              Width = 63
            end
            item
              Caption = 'Key'
              Width = 100
            end
            item
              Caption = 'Level'
            end
            item
              Caption = 'Trained'
              Width = 75
            end
            item
              Caption = 'Key'
              Width = 63
            end>
          GridLines = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'Items'
      ImageIndex = 3
      object GroupBox4: TGroupBox
        Left = 10
        Top = 10
        Width = 511
        Height = 271
        TabOrder = 0
        object ListViewUserItem: TListView
          Left = 17
          Top = 20
          Width = 491
          Height = 231
          Columns = <
            item
              Caption = '??'
            end
            item
              Caption = '????'
              Width = 100
            end
            item
              Caption = '??'
              Width = 63
            end
            item
              Caption = '????'
              Width = 100
            end
            item
              Alignment = taCenter
              Caption = '??'
              Width = 113
            end
            item
              Caption = '??'
              Width = 275
            end>
          GridLines = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Storage'
      ImageIndex = 4
      object GroupBox5: TGroupBox
        Left = 10
        Top = 10
        Width = 511
        Height = 271
        TabOrder = 0
        object ListViewStorage: TListView
          Left = 10
          Top = 20
          Width = 491
          Height = 231
          Columns = <
            item
              Caption = '??'
            end
            item
              Caption = '????'
              Width = 100
            end
            item
              Caption = '??'
              Width = 63
            end
            item
              Caption = '????'
              Width = 100
            end
            item
              Alignment = taCenter
              Caption = '??'
              Width = 113
            end
            item
              Caption = '??'
              Width = 275
            end>
          GridLines = True
          RowSelect = True
          TabOrder = 0
          ViewStyle = vsReport
        end
      end
    end
  end
  object ButtonSaveData: TButton
    Left = 10
    Top = 350
    Width = 101
    Height = 31
    Caption = 'Save(&S)'
    TabOrder = 1
    OnClick = ButtonExportDataClick
  end
  object ButtonExportData: TButton
    Left = 120
    Top = 350
    Width = 101
    Height = 31
    Caption = 'Export(&E)'
    TabOrder = 2
    OnClick = ButtonExportDataClick
  end
  object ButtonImportData: TButton
    Left = 230
    Top = 350
    Width = 101
    Height = 31
    Caption = 'Import(&I)'
    TabOrder = 3
    OnClick = ButtonExportDataClick
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'hum'
    Filter = '???? (*.hum)|*.hum'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 296
    Top = 280
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'hum'
    Filter = '???? (*.hum)|*.hum'
    Left = 336
    Top = 280
  end
end
