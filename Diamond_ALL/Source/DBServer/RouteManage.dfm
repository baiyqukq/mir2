object frmRouteManage: TfrmRouteManage
  Left = 276
  Top = 285
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Route Manager'
  ClientHeight = 279
  ClientWidth = 601
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '??'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 10
    Top = 10
    Width = 581
    Height = 261
    Caption = 'Routes'
    TabOrder = 0
    object ListViewRoute: TListView
      Left = 10
      Top = 20
      Width = 561
      Height = 191
      Columns = <
        item
          Caption = 'Idx'
        end
        item
          Caption = 'SelGate IP'
          Width = 100
        end
        item
          Caption = 'Gate Count'
          Width = 80
        end
        item
          Caption = 'GameGate IP List'
          Width = 1250
        end>
      GridLines = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnClick = ButtonDeleteClick
    end
    object ButtonEdit: TButton
      Left = 110
      Top = 220
      Width = 91
      Height = 31
      Hint = '?????????'
      Caption = 'Edit(&E)'
      TabOrder = 1
      OnClick = ButtonDeleteClick
    end
    object ButtonDelete: TButton
      Left = 210
      Top = 220
      Width = 91
      Height = 31
      Hint = '?????????'
      Caption = 'Delete(&D)'
      TabOrder = 2
      OnClick = ButtonDeleteClick
    end
    object ButtonOK: TButton
      Left = 480
      Top = 220
      Width = 91
      Height = 31
      Hint = '??????????'
      Caption = 'Ok(&O)'
      TabOrder = 3
      OnClick = ButtonDeleteClick
    end
    object ButtonAddRoute: TButton
      Left = 10
      Top = 220
      Width = 91
      Height = 31
      Hint = '?????????'
      Caption = 'Add(&A)'
      TabOrder = 4
      OnClick = ButtonDeleteClick
    end
  end
end
