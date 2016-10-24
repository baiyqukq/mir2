object FrmMain: TFrmMain
  Left = 772
  Top = 119
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  ClientHeight = 181
  ClientWidth = 306
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '??'
  Font.Style = []
  Menu = MainMenu
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 15
  object MemoLog: TMemo
    Left = 0
    Top = 161
    Width = 306
    Height = 0
    Align = alClient
    ReadOnly = True
    ScrollBars = ssHorizontal
    TabOrder = 0
    OnChange = MemoLogChange
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 161
    Width = 306
    Height = 20
    Panels = <
      item
        Alignment = taCenter
        Text = '????'
        Width = 45
      end
      item
        Alignment = taCenter
        Text = '---]    [---'
        Width = 60
      end
      item
        Alignment = taCenter
        Text = '????'
        Width = 70
      end
      item
        Alignment = taCenter
        Text = '????'
        Width = 50
      end>
  end
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 306
    Height = 161
    Align = alTop
    BevelOuter = bvNone
    Caption = ' '
    TabOrder = 2
    object LbLack: TLabel
      Left = 5
      Top = 71
      Width = 17
      Height = 15
      Caption = '0/0'
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 0
      Width = 304
      Height = 91
      Caption = '????'
      TabOrder = 0
      object LabelReviceMsgSize: TLabel
        Left = 15
        Top = 26
        Width = 29
        Height = 15
        Caption = 'MSG:'
      end
      object LabelSendBlockSize: TLabel
        Left = 15
        Top = 46
        Width = 41
        Height = 15
        Caption = 'SBlock:'
      end
      object LabelLogonMsgSize: TLabel
        Left = 115
        Top = 26
        Width = 38
        Height = 15
        Caption = 'Logon:'
      end
      object LabelPlayMsgSize: TLabel
        Left = 115
        Top = 46
        Width = 34
        Height = 15
        Caption = 'PMsg:'
      end
      object LabelDeCodeMsgSize: TLabel
        Left = 215
        Top = 26
        Width = 42
        Height = 15
        Caption = 'DCode:'
      end
      object LabelProcessMsgSize: TLabel
        Left = 215
        Top = 46
        Width = 51
        Height = 15
        Caption = 'ProcMsg:'
      end
      object LabelBufferOfM2Size: TLabel
        Left = 15
        Top = 66
        Width = 51
        Height = 15
        Caption = 'M2Buffer:'
      end
      object LabelSelfCheck: TLabel
        Left = 165
        Top = 66
        Width = 46
        Height = 15
        Caption = 'SCheck:'
      end
    end
    object GroupBoxProcessTime: TGroupBox
      Left = 1
      Top = 94
      Width = 304
      Height = 67
      Caption = 'Process Times'
      TabOrder = 1
      object LabelSendTime: TLabel
        Left = 15
        Top = 40
        Width = 32
        Height = 15
        Caption = 'Send:'
      end
      object LabelReceTime: TLabel
        Left = 15
        Top = 20
        Width = 30
        Height = 15
        Caption = 'Recv:'
      end
      object LabelLoop: TLabel
        Left = 235
        Top = 20
        Width = 31
        Height = 15
        Caption = 'Loop:'
      end
      object LabelReviceLimitTime: TLabel
        Left = 95
        Top = 20
        Width = 60
        Height = 15
        Caption = 'Recv Limit:'
      end
      object LabelSendLimitTime: TLabel
        Left = 95
        Top = 40
        Width = 62
        Height = 15
        Caption = 'Send Limit:'
      end
      object LabelLoopTime: TLabel
        Left = 235
        Top = 40
        Width = 60
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Caption = '--------'
      end
    end
  end
  object ServerSocket: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientConnect = ServerSocketClientConnect
    OnClientDisconnect = ServerSocketClientDisconnect
    OnClientRead = ServerSocketClientRead
    OnClientError = ServerSocketClientError
    Left = 34
  end
  object SendTimer: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = SendTimerTimer
    Left = 61
  end
  object ClientSocket: TClientSocket
    Active = False
    Address = '127.0.0.1'
    ClientType = ctNonBlocking
    Port = 50000
    OnConnect = ClientSocketConnect
    OnDisconnect = ClientSocketDisconnect
    OnRead = ClientSocketRead
    OnError = ClientSocketError
    Left = 2
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 92
  end
  object DecodeTimer: TTimer
    Interval = 1
    OnTimer = DecodeTimerTimer
    Left = 154
  end
  object MainMenu: TMainMenu
    Left = 187
    object MENU_CONTROL: TMenuItem
      Caption = 'Control'
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
      object MENU_CONTROL_RECONNECT: TMenuItem
        Caption = 'Reconnect'
        ShortCut = 16466
        OnClick = MENU_CONTROL_RECONNECTClick
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object MENU_CONTROL_RELOADCONFIG: TMenuItem
        Caption = 'Reload Config'
        OnClick = MENU_CONTROL_RELOADCONFIGClick
      end
      object MENU_CONTROL_CLEAELOG: TMenuItem
        Caption = 'Clear Log'
        ShortCut = 16451
        OnClick = MENU_CONTROL_CLEAELOGClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object MENU_CONTROL_EXIT: TMenuItem
        Caption = 'Exit'
        ShortCut = 16472
        OnClick = MENU_CONTROL_EXITClick
      end
    end
    object MENU_VIEW: TMenuItem
      Caption = 'View'
      object MENU_VIEW_LOGMSG: TMenuItem
        Caption = 'View Msg Logs'
        ShortCut = 16460
        OnClick = MENU_VIEW_LOGMSGClick
      end
    end
    object MENU_OPTION: TMenuItem
      Caption = 'Options'
      object MENU_OPTION_GENERAL: TMenuItem
        Caption = 'General'
        ShortCut = 16455
        OnClick = MENU_OPTION_GENERALClick
      end
      object MENU_OPTION_PERFORM: TMenuItem
        Caption = 'Preferences'
        ShortCut = 16464
        OnClick = MENU_OPTION_PERFORMClick
      end
      object MENU_OPTION_IPFILTER: TMenuItem
        Caption = 'IP Filter'
        ShortCut = 16454
        OnClick = MENU_OPTION_IPFILTERClick
      end
      object MENU_OPTION_FILTERMSG: TMenuItem
        Caption = 'Abusive Filter'
        ShortCut = 16449
        OnClick = MENU_OPTION_FILTERMSGClick
      end
    end
  end
  object StartTimer: TTimer
    Interval = 200
    OnTimer = StartTimerTimer
    Left = 124
  end
  object PopupMenu: TPopupMenu
    Left = 184
    Top = 32
    object POPMENU_PORT: TMenuItem
      AutoHotkeys = maManual
      Caption = '??'
    end
    object POPMENU_CONNSTAT: TMenuItem
      AutoHotkeys = maManual
      Caption = '????'
    end
    object POPMENU_CONNCOUNT: TMenuItem
      AutoHotkeys = maManual
      Caption = '???'
    end
    object POPMENU_CHECKTICK: TMenuItem
      AutoHotkeys = maManual
      Caption = '????'
    end
    object N1: TMenuItem
      Caption = '--------------------'
    end
    object POPMENU_OPEN: TMenuItem
      Caption = '????(&O)'
    end
    object POPMENU_START: TMenuItem
      Caption = '????(&S)'
      OnClick = MENU_CONTROL_STARTClick
    end
    object POPMENU_CONNSTOP: TMenuItem
      Caption = '????(&T)'
      OnClick = MENU_CONTROL_STOPClick
    end
    object POPMENU_RECONN: TMenuItem
      Caption = '????(&R)'
      OnClick = MENU_CONTROL_RECONNECTClick
    end
    object POPMENU_EXIT: TMenuItem
      Caption = '??(&X)'
      OnClick = MENU_CONTROL_EXITClick
    end
  end
end
