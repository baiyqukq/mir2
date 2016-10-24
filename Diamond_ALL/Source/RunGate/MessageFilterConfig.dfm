object frmMessageFilterConfig: TfrmMessageFilterConfig
  Left = 208
  Top = 225
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Abuse Filter'
  ClientHeight = 244
  ClientWidth = 290
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '??'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 10
    Top = 10
    Width = 61
    Height = 15
    Caption = 'Messages:'
  end
  object ListBoxFilterText: TListBox
    Left = 10
    Top = 30
    Width = 191
    Height = 201
    ItemHeight = 15
    TabOrder = 0
    OnClick = ListBoxFilterTextClick
    OnDblClick = ListBoxFilterTextDblClick
  end
  object ButtonAdd: TButton
    Left = 213
    Top = 80
    Width = 71
    Height = 31
    Caption = 'Add(&A)'
    TabOrder = 1
    OnClick = ButtonAddClick
  end
  object ButtonDel: TButton
    Left = 213
    Top = 120
    Width = 71
    Height = 31
    Caption = 'Delete(&D)'
    TabOrder = 2
    OnClick = ButtonDelClick
  end
  object ButtonOK: TButton
    Left = 213
    Top = 200
    Width = 71
    Height = 31
    Caption = 'Ok(&O)'
    TabOrder = 3
    OnClick = ButtonOKClick
  end
  object ButtonMod: TButton
    Left = 213
    Top = 160
    Width = 71
    Height = 31
    Caption = 'Modify(&M)'
    TabOrder = 4
    OnClick = ButtonModClick
  end
end
