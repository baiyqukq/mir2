object frmActionSpeed: TfrmActionSpeed
  Left = 239
  Top = 294
  ActiveControl = ButtonClose
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = '????????'
  ClientHeight = 321
  ClientWidth = 398
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '??'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 15
  object Label5: TLabel
    Left = 10
    Top = 300
    Width = 184
    Height = 17
    Caption = '?????,???????????,??????'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -15
    Font.Name = '??'
    Font.Style = []
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 10
    Top = 10
    Width = 371
    Height = 241
    TabOrder = 0
    object GroupBox3: TGroupBox
      Left = 190
      Top = 20
      Width = 171
      Height = 61
      TabOrder = 0
      object Label15: TLabel
        Left = 14
        Top = 30
        Width = 31
        Height = 15
        Caption = '????:'
      end
      object EditRunLongHitIntervalTime: TSpinEdit
        Left = 85
        Top = 25
        Width = 66
        Height = 24
        Hint = '????????????,???(??)?'
        EditorEnabled = False
        Increment = 10
        MaxValue = 2000
        MinValue = 10
        TabOrder = 0
        Value = 350
        OnChange = EditRunLongHitIntervalTimeChange
      end
      object CheckBoxControlRunLongHit: TCheckBox
        Left = 10
        Top = -1
        Width = 151
        Height = 21
        Hint = '????????????'
        Caption = '????????'
        TabOrder = 1
        OnClick = CheckBoxControlRunLongHitClick
      end
    end
    object GroupBox2: TGroupBox
      Left = 10
      Top = 20
      Width = 171
      Height = 61
      Caption = '??????'
      TabOrder = 1
      object Label2: TLabel
        Left = 14
        Top = 30
        Width = 31
        Height = 15
        Caption = '????:'
      end
      object EditActionIntervalTime: TSpinEdit
        Left = 85
        Top = 25
        Width = 66
        Height = 24
        Hint = '????????????,???(??)?'
        EditorEnabled = False
        Increment = 10
        MaxValue = 2000
        MinValue = 10
        TabOrder = 0
        Value = 350
        OnChange = EditActionIntervalTimeChange
      end
    end
    object CheckBoxControlActionInterval: TCheckBox
      Left = 10
      Top = -1
      Width = 151
      Height = 21
      Hint = '????????????'
      Caption = '????????'
      TabOrder = 2
      OnClick = CheckBoxControlActionIntervalClick
    end
    object GroupBox4: TGroupBox
      Left = 10
      Top = 90
      Width = 171
      Height = 61
      TabOrder = 3
      object Label1: TLabel
        Left = 14
        Top = 30
        Width = 31
        Height = 15
        Caption = '????:'
      end
      object EditRunHitIntervalTime: TSpinEdit
        Left = 85
        Top = 25
        Width = 66
        Height = 24
        Hint = '??????????,???(??)?'
        EditorEnabled = False
        Increment = 10
        MaxValue = 2000
        MinValue = 10
        TabOrder = 0
        Value = 350
        OnChange = EditRunHitIntervalTimeChange
      end
      object CheckBoxControlRunHit: TCheckBox
        Left = 10
        Top = -1
        Width = 151
        Height = 21
        Hint = '????????????'
        Caption = '????????'
        TabOrder = 1
        OnClick = CheckBoxControlRunHitClick
      end
    end
    object GroupBox5: TGroupBox
      Left = 190
      Top = 90
      Width = 171
      Height = 61
      TabOrder = 4
      object Label3: TLabel
        Left = 14
        Top = 30
        Width = 31
        Height = 15
        Caption = '????:'
      end
      object EditWalkHitIntervalTime: TSpinEdit
        Left = 85
        Top = 25
        Width = 66
        Height = 24
        Hint = '??????????,???(??)?'
        EditorEnabled = False
        Increment = 10
        MaxValue = 2000
        MinValue = 10
        TabOrder = 0
        Value = 350
        OnChange = EditWalkHitIntervalTimeChange
      end
      object CheckBoxControlWalkHit: TCheckBox
        Left = 10
        Top = -1
        Width = 151
        Height = 21
        Hint = '????????????'
        Caption = '????????'
        TabOrder = 1
        OnClick = CheckBoxControlWalkHitClick
      end
    end
    object GroupBox6: TGroupBox
      Left = 10
      Top = 160
      Width = 171
      Height = 61
      TabOrder = 5
      object Label4: TLabel
        Left = 14
        Top = 30
        Width = 31
        Height = 15
        Caption = '????:'
      end
      object EditRunMagicIntervalTime: TSpinEdit
        Left = 85
        Top = 25
        Width = 66
        Height = 24
        Hint = '??????????,???(??)?'
        EditorEnabled = False
        Increment = 10
        MaxValue = 2000
        MinValue = 10
        TabOrder = 0
        Value = 350
        OnChange = EditRunMagicIntervalTimeChange
      end
      object CheckBoxControlRunMagic: TCheckBox
        Left = 10
        Top = -1
        Width = 151
        Height = 21
        Hint = '????????????'
        Caption = '????????'
        TabOrder = 1
        OnClick = CheckBoxControlRunMagicClick
      end
    end
  end
  object ButtonSave: TButton
    Left = 100
    Top = 256
    Width = 81
    Height = 32
    Caption = '??(&S)'
    TabOrder = 1
    OnClick = ButtonSaveClick
  end
  object ButtonDefault: TButton
    Left = 10
    Top = 256
    Width = 81
    Height = 32
    Caption = '??(&D)'
    TabOrder = 2
    OnClick = ButtonDefaultClick
  end
  object ButtonClose: TButton
    Left = 300
    Top = 255
    Width = 81
    Height = 31
    Caption = '??(&C)'
    TabOrder = 3
    OnClick = ButtonCloseClick
  end
  object CheckBoxIncremeng: TCheckBox
    Left = 200
    Top = 260
    Width = 91
    Height = 21
    Caption = '????'
    TabOrder = 4
    OnClick = CheckBoxIncremengClick
  end
end
