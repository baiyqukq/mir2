object FrmMain: TFrmMain
  Left = 652
  Top = 243
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 369
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MemoLog: TMemo
    Left = 0
    Top = 65
    Width = 433
    Height = 227
    Align = alClient
    BevelInner = bvNone
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = 16384
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    OnChange = MemoLogChange
    OnDblClick = MemoLogDblClick
  end
  object GridGate: TStringGrid
    Left = 0
    Top = 292
    Width = 433
    Height = 77
    Align = alBottom
    ColCount = 7
    Ctl3D = True
    DefaultRowHeight = 18
    FixedCols = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRowSelect]
    ParentCtl3D = False
    TabOrder = 1
    ColWidths = (
      28
      110
      56
      54
      52
      50
      56)
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 433
    Height = 65
    Align = alTop
    Color = clBlack
    TabOrder = 2
    object LbUserCount: TLabel
      Left = 325
      Top = 24
      Width = 3
      Height = 13
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LbTimeCount: TLabel
      Left = 325
      Top = 40
      Width = 3
      Height = 13
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LbRunTime: TLabel
      Left = 325
      Top = 8
      Width = 3
      Height = 13
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label20: TLabel
      Left = 2
      Top = 40
      Width = 3
      Height = 13
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 2
      Top = 24
      Width = 3
      Height = 13
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 2
      Top = 8
      Width = 3
      Height = 13
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 2000
    Left = 56
    Top = 16
  end
  object RunTimer: TTimer
    Enabled = False
    Interval = 1
    Left = 88
    Top = 16
  end
  object DBSocket: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 6000
    Left = 56
    Top = 80
  end
  object ConnectTimer: TTimer
    Enabled = False
    Interval = 3000
    Left = 56
    Top = 48
  end
  object StartTimer: TTimer
    Enabled = False
    Interval = 100
    Left = 120
    Top = 16
  end
  object SaveVariableTimer: TTimer
    Interval = 10000
    Left = 152
    Top = 16
  end
  object CloseTimer: TTimer
    Enabled = False
    Interval = 100
    Left = 88
    Top = 48
  end
  object LogUDP: TNMUDP
    RemotePort = 10000
    LocalPort = 0
    ReportLevel = 1
    Left = 88
    Top = 80
  end
  object MainMenu: TMainMenu
    Left = 120
    Top = 80
    object MENU_CONTROL: TMenuItem
      Caption = 'Control'
      OnClick = MENU_CONTROLClick
      object MENU_CONTROL_START: TMenuItem
        Caption = 'Start'
        ShortCut = 16467
        OnClick = MENU_CONTROL_STARTClick
      end
      object MENU_CONTROL_STOP: TMenuItem
        Caption = 'Stop'
        ShortCut = 16468
        OnClick = MENU_CONTROL_STOPClick
      end
      object MENU_CONTROL_CLEARLOGMSG: TMenuItem
        Caption = 'Clear Log'
        OnClick = MENU_CONTROL_CLEARLOGMSGClick
      end
      object MENU_CONTROL_RELOAD: TMenuItem
        Caption = 'Reload'
        object MENU_CONTROL_RELOAD_ITEMDB: TMenuItem
          Caption = 'Items'
          OnClick = MENU_CONTROL_RELOAD_ITEMDBClick
        end
        object MENU_CONTROL_RELOAD_MAGICDB: TMenuItem
          Caption = 'Magics'
          OnClick = MENU_CONTROL_RELOAD_MAGICDBClick
        end
        object MENU_CONTROL_RELOAD_MONSTERDB: TMenuItem
          Caption = 'Monsters'
          OnClick = MENU_CONTROL_RELOAD_MONSTERDBClick
        end
        object MENU_CONTROL_RELOAD_MONSTERSAY: TMenuItem
          Caption = 'MonSay'
          OnClick = MENU_CONTROL_RELOAD_MONSTERSAYClick
        end
        object MENU_CONTROL_RELOAD_DISABLEMAKE: TMenuItem
          Caption = 'DisableMake'
          OnClick = MENU_CONTROL_RELOAD_DISABLEMAKEClick
        end
        object MENU_CONTROL_RELOAD_STARTPOINT: TMenuItem
          Caption = 'Start Points'
          OnClick = MENU_CONTROL_RELOAD_STARTPOINTClick
        end
        object MENU_CONTROL_RELOAD_CONF: TMenuItem
          Caption = 'Configuration'
          OnClick = MENU_CONTROL_RELOAD_CONFClick
        end
      end
      object MENU_CONTROL_GATE: TMenuItem
        Caption = 'Gate'
        object MENU_CONTROL_GATE_OPEN: TMenuItem
          Caption = 'Open'
          OnClick = MENU_CONTROL_GATE_OPENClick
        end
        object MENU_CONTROL_GATE_CLOSE: TMenuItem
          Caption = 'Close'
          OnClick = MENU_CONTROL_GATE_CLOSEClick
        end
      end
      object MENU_CONTROL_EXIT: TMenuItem
        Caption = 'Exit'
        ShortCut = 16472
        OnClick = MENU_CONTROL_EXITClick
      end
    end
    object MENU_VIEW: TMenuItem
      Caption = 'View'
      object MENU_VIEW_ONLINEHUMAN: TMenuItem
        Caption = 'Online Players'
        OnClick = MENU_VIEW_ONLINEHUMANClick
      end
      object MENU_VIEW_SESSION: TMenuItem
        Caption = 'Sessions'
        OnClick = MENU_VIEW_SESSIONClick
      end
      object MENU_VIEW_LEVEL: TMenuItem
        Caption = 'Levels'
        OnClick = MENU_VIEW_LEVELClick
      end
      object MENU_VIEW_LIST: TMenuItem
        Caption = 'Lists'
        OnClick = MENU_VIEW_LISTClick
      end
      object MENU_VIEW_KERNELINFO: TMenuItem
        Caption = 'Kernel Info'
        OnClick = MENU_VIEW_KERNELINFOClick
      end
      object MENU_VIEW_GATE: TMenuItem
        Caption = 'Gates'
        Checked = True
        OnClick = MENU_VIEW_GATEClick
      end
    end
    object MENU_OPTION: TMenuItem
      Caption = 'Options'
      object MENU_OPTION_GENERAL: TMenuItem
        Caption = 'General'
        OnClick = MENU_OPTION_GENERALClick
      end
      object MENU_OPTION_GAME: TMenuItem
        Caption = 'Game'
        OnClick = MENU_OPTION_GAMEClick
      end
      object MENU_OPTION_ITEMFUNC: TMenuItem
        Caption = 'Item Func'
        OnClick = MENU_OPTION_ITEMFUNCClick
      end
      object MENU_OPTION_FUNCTION: TMenuItem
        Caption = 'Function'
        OnClick = MENU_OPTION_FUNCTIONClick
      end
      object G1: TMenuItem
        Caption = 'Commands'
        OnClick = G1Click
      end
      object MENU_OPTION_MONSTER: TMenuItem
        Caption = 'Monsters'
        OnClick = MENU_OPTION_MONSTERClick
      end
      object MENU_OPTION_SERVERCONFIG: TMenuItem
        Caption = 'Server Config'
        OnClick = MENU_OPTION_SERVERCONFIGClick
      end
    end
    object MENU_MANAGE: TMenuItem
      Caption = 'Manage'
      object MENU_MANAGE_ONLINEMSG: TMenuItem
        Caption = 'Online Messenger'
        OnClick = MENU_MANAGE_ONLINEMSGClick
      end
      object MENU_MANAGE_CASTLE: TMenuItem
        Caption = 'Castles'
        OnClick = MENU_MANAGE_CASTLEClick
      end
    end
    object MENU_TOOLS: TMenuItem
      Caption = 'Tools'
      object MENU_TOOLS_MERCHANT: TMenuItem
        Caption = 'Merchant'
        OnClick = MENU_TOOLS_MERCHANTClick
      end
      object MENU_TOOLS_NPC: TMenuItem
        Caption = 'NPC'
      end
      object MENU_TOOLS_MONGEN: TMenuItem
        Caption = 'Mongen'
        OnClick = MENU_TOOLS_MONGENClick
      end
      object MENU_TOOLS_IPSEARCH: TMenuItem
        Caption = 'IP Search'
        OnClick = MENU_TOOLS_IPSEARCHClick
      end
    end
    object MENU_HELP: TMenuItem
      Caption = 'Help'
      object MENU_HELP_ABOUT: TMenuItem
        Caption = 'About'
        ShortCut = 16449
        OnClick = MENU_HELP_ABOUTClick
      end
    end
  end
end
