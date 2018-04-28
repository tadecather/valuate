object MainForm: TMainForm
  Left = 201
  Top = 121
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #20272#20540#31995#32479
  ClientHeight = 639
  ClientWidth = 1161
  Color = clBtnFace
  DragMode = dmAutomatic
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblLoginUserName: TLabel
    Left = 200
    Top = 620
    Width = 48
    Height = 16
    Caption = #29992#25143#21517
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = [fsUnderline]
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 0
    Top = -1
    Width = 1162
    Height = 619
    ActivePage = tsRCCZ
    TabHeight = 30
    TabIndex = 4
    TabOrder = 0
    object SysManageTab: TTabSheet
      Caption = '    '#31995#32479#31649#29702'    '
      OnShow = UserRefreshButtonClick
      object SubMenuSysM: TTreeView
        Left = -2
        Top = -1
        Width = 200
        Height = 590
        AutoExpand = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HideSelection = False
        Indent = 19
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnClick = SubMenuSysMOnChange
        OnCustomDrawItem = SubMenuSysMCustomDrawItem
        Items.Data = {
          0300000021000000000000000000000000000000FFFFFFFF0000000000000000
          08D3C3BBA7B9DCC0ED210000000000000000000000FFFFFFFFFFFFFFFF000000
          000000000008B9D8B1D5CFB5CDB3210000000000000000000000FFFFFFFFFFFF
          FFFF000000000000000008C7D0BBBBD3C3BBA7}
      end
      object UserDBGrid: TDBGrid
        Left = 197
        Top = 31
        Width = 959
        Height = 549
        DataSource = UserDataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ParentFont = False
        PopupMenu = UserDBGPopMenu
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
      end
      object UserSearchEdit: TEdit
        Left = 923
        Top = 4
        Width = 160
        Height = 21
        Hint = #25628#32034#29992#25143#36890#36807#29992#25143#21517
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
      object UerSearchButton: TBitBtn
        Left = 1094
        Top = -4
        Width = 49
        Height = 35
        Caption = 'Search'
        TabOrder = 3
        OnClick = UerSearchButtonClick
      end
      object UserRefreshButton: TButton
        Left = 299
        Top = 0
        Width = 41
        Height = 33
        Caption = #21047#26032
        TabOrder = 4
        OnClick = UserRefreshButtonClick
      end
      object UserScanButton: TButton
        Left = 217
        Top = 0
        Width = 41
        Height = 33
        Caption = #26597#30475
        TabOrder = 5
        OnClick = UserScanButtonClick
      end
      object UserAddButton: TButton
        Left = 259
        Top = 0
        Width = 41
        Height = 33
        Caption = #26032#22686
        TabOrder = 6
        OnClick = UserAddButtonClick
      end
    end
    object BasicSettigTab: TTabSheet
      Caption = '     '#22522#30784#35774#32622'    '
      ImageIndex = 1
      OnShow = BasicSettingTabShow
      object BasicSubMenuTreeView: TTreeView
        Left = -2
        Top = -2
        Width = 200
        Height = 590
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        HideSelection = False
        Indent = 19
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnClick = BasicSubMenuOnClick
        OnCustomDrawItem = SubMenuSysMCustomDrawItem
        Items.Data = {
          05000000250000000000000001000000FFFFFFFFFFFFFFFF0000000000000000
          0CBDBBD2D7B7D1C2CAC9E8D6C3250000000000000000000000FFFFFFFFFFFFFF
          FF00000000000000000CC8FDCCE1C1BDB7D1C9E8D6C325000000000000000000
          0000FFFFFFFFFFFFFFFF00000000000000000CBDD3CAD5C2B7BEB6C9E8D6C325
          0000000000000000000000FFFFFFFFFFFFFFFF00000000000000000CD6A4C8AF
          D0C5CFA2C9E8D6C3250000000000000000000000FFFFFFFFFFFFFFFF00000000
          000000000CBBE1BCC6BFC6C4BFC9E8D6C3}
      end
      object BasicScanButton: TButton
        Left = 218
        Top = 0
        Width = 41
        Height = 33
        Caption = #26597#30475
        TabOrder = 1
        OnClick = BasicScanButtonClick
      end
      object BasicRefreshButton: TButton
        Left = 360
        Top = 0
        Width = 41
        Height = 33
        Caption = #21047#26032
        TabOrder = 2
        OnClick = BasicRefreshButtonClick
      end
      object BasicSearchEdit: TEdit
        Left = 928
        Top = 4
        Width = 115
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Visible = False
      end
      object BasicSearchButton: TBitBtn
        Left = 1046
        Top = -4
        Width = 49
        Height = 35
        Caption = 'Search'
        TabOrder = 4
        Visible = False
        OnClick = BasicSearchButtonClick
      end
      object BasicSettingDBGrid: TDBGrid
        Left = 195
        Top = 30
        Width = 961
        Height = 549
        DataSource = UserDataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ParentFont = False
        PopupMenu = BasicDBGPopMenu
        ReadOnly = True
        TabOrder = 5
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
        OnDblClick = BasicScanButtonClick
      end
      object BasicEditButton: TButton
        Left = 257
        Top = -1
        Width = 41
        Height = 33
        Caption = #32534#36753
        TabOrder = 6
        OnClick = BasicEditButtonClick
      end
      object BasicAddButton: TButton
        Left = 296
        Top = -1
        Width = 41
        Height = 33
        Caption = #22686#21152
        TabOrder = 7
        Visible = False
        OnClick = BasicAddButtonClick
      end
      object BasicZQLXComboBox: TComboBox
        Left = 864
        Top = 4
        Width = 65
        Height = 24
        Style = csDropDownList
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = #40657#20307
        Font.Style = []
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ItemHeight = 16
        ItemIndex = 0
        ParentFont = False
        TabOrder = 8
        Text = #20840#37096
        Visible = False
        Items.Strings = (
          #20840#37096
          #32929#31080
          #20538#21048
          #22238#36141)
      end
    end
    object tsDataManage: TTabSheet
      Caption = '    '#25968#25454#32500#25252'    '
      ImageIndex = 2
      OnShow = tsDataManageShow
      object lblKSRQDataMaage: TLabel
        Left = 416
        Top = 6
        Width = 52
        Height = 19
        Caption = #38500#26435#26085#26399
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
      end
      object lblJSRQDataManage: TLabel
        Left = 568
        Top = 6
        Width = 18
        Height = 19
        Caption = '---'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
      end
      object tvDataManage: TTreeView
        Left = -2
        Top = -2
        Width = 200
        Height = 584
        HideSelection = False
        Indent = 19
        ReadOnly = True
        TabOrder = 0
        OnCustomDrawItem = SubMenuSysMCustomDrawItem
        Items.Data = {
          01000000250000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
          0CB9C9C6B1B7D6BAECB9ABB8E6}
      end
      object dbgrdDataManage: TDBGrid
        Left = 197
        Top = 31
        Width = 959
        Height = 549
        DataSource = UserDataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ParentFont = False
        PopupMenu = pmDM
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
        OnDblClick = BasicScanButtonClick
      end
      object btnScanDataManage: TButton
        Left = 195
        Top = 0
        Width = 41
        Height = 33
        Caption = #26597#30475
        TabOrder = 2
        OnClick = btnScanDataManageClick
      end
      object btnEditDataManage: TButton
        Left = 234
        Top = 0
        Width = 41
        Height = 33
        Caption = #32534#36753
        TabOrder = 3
        OnClick = btnEditDataManageClick
      end
      object btnAddDataManage: TButton
        Left = 274
        Top = 0
        Width = 41
        Height = 33
        Caption = #26032#22686
        TabOrder = 4
        OnClick = btnAddDataManageClick
      end
      object btnFreshDataManage: TButton
        Left = 346
        Top = 0
        Width = 41
        Height = 33
        Caption = #21047#26032
        TabOrder = 5
        OnClick = btnFreshDataManageClick
      end
      object edtSearchDataManage: TEdit
        Left = 912
        Top = 5
        Width = 131
        Height = 21
        Hint = #36890#36807#35777#21048#20195#30721#36873#25321#20844#21578
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
      end
      object btnSearchDataManage: TBitBtn
        Left = 1045
        Top = -3
        Width = 49
        Height = 35
        Caption = 'Search'
        TabOrder = 7
        OnClick = btnSearchDataManageClick
      end
      object dtpKSRQDataManage: TDateTimePicker
        Left = 472
        Top = 5
        Width = 95
        Height = 21
        CalAlignment = dtaLeft
        Date = 43189.6808973495
        Time = 43189.6808973495
        DateFormat = dfShort
        DateMode = dmComboBox
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #40657#20307
        Font.Style = []
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        Kind = dtkDate
        ParseInput = False
        ParentFont = False
        TabOrder = 8
        OnCloseUp = dtpDataManageOnChange
        OnChange = dtpDataManageOnChange
      end
      object dtpJSRQDataManage: TDateTimePicker
        Left = 584
        Top = 5
        Width = 95
        Height = 21
        CalAlignment = dtaLeft
        Date = 43189.6808973495
        Time = 43189.6808973495
        DateFormat = dfShort
        DateMode = dmComboBox
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #40657#20307
        Font.Style = []
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        Kind = dtkDate
        ParseInput = False
        ParentFont = False
        TabOrder = 9
        OnCloseUp = dtpDataManageOnChange
        OnChange = dtpDataManageOnChange
      end
    end
    object tsZQYW: TTabSheet
      Caption = '    '#35777#21048#19994#21153'    '
      ImageIndex = 3
      OnShow = tsZQYWShow
      object lblZQYWYWRQ: TLabel
        Left = 416
        Top = 6
        Width = 52
        Height = 19
        Caption = #20132#26131#26085#26399
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
      end
      object lbRQCenter: TLabel
        Left = 568
        Top = 6
        Width = 18
        Height = 19
        Caption = '---'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
      end
      object tvZQYW: TTreeView
        Left = -2
        Top = -2
        Width = 200
        Height = 590
        HideSelection = False
        Indent = 19
        ReadOnly = True
        TabOrder = 0
        OnClick = dtpZQYWOnChange
        OnCustomDrawItem = SubMenuSysMCustomDrawItem
        Items.Data = {
          03000000210000000000000000000000FFFFFFFFFFFFFFFF0000000007000000
          08B9C9C6B1D2B5CEF1210000000000000001000000FFFFFFFFFFFFFFFF000000
          000000000008B9C9C6B1BDBBD2D7210000000000000000000000FFFFFFFFFFFF
          FFFF000000000000000008D0C2B9C9D6D0C7A9210000000000000000000000FF
          FFFFFFFFFFFFFF000000000000000008D6D0C7A9BDC9BFEE2100000000000000
          00000000FFFFFFFFFFFFFFFF000000000000000008D6D0C7A9BDBBCAD5210000
          000000000000000000FFFFFFFFFFFFFFFF000000000000000008D0C2B9C9C1F7
          CDA8210000000000000000000000FFFFFFFFFFFFFFFF000000000000000008BA
          ECC0FBB3FDC8A8210000000000000000000000FFFFFFFFFFFFFFFF0000000000
          00000008BAECC0FBB5BDD5CB210000000000000000000000FFFFFFFFFFFFFFFF
          000000000300000008D5AEC8AFD2B5CEF1210000000000000000000000FFFFFF
          FFFFFFFFFF000000000000000008D5AEC8AFBDBBD2D721000000000000000000
          0000FFFFFFFFFFFFFFFF000000000000000008B6D2CFA2D7AAB3F62100000000
          00000000000000FFFFFFFFFFFFFFFF000000000000000008B6D2CFA2B5BDD5CB
          210000000000000000000000FFFFFFFFFFFFFFFF000000000000000008BBD8B9
          BAD2B5CEF1}
      end
      object dbgrdZQYW: TDBGrid
        Left = 196
        Top = 31
        Width = 960
        Height = 549
        DataSource = UserDataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ParentFont = False
        PopupMenu = pmZQYW
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Visible = False
      end
      object btnZQYWScan: TButton
        Left = 194
        Top = 0
        Width = 41
        Height = 33
        Caption = #26597#30475
        TabOrder = 2
        OnClick = btnZQYWScanClick
      end
      object btnZQYWEdit: TButton
        Left = 235
        Top = 0
        Width = 41
        Height = 33
        Caption = #32534#36753
        TabOrder = 3
        OnClick = btnZQYWEditClick
      end
      object btnZQYWAdd: TButton
        Left = 275
        Top = 0
        Width = 41
        Height = 33
        Caption = #26032#22686
        TabOrder = 4
        OnClick = btnZQYWAddClick
      end
      object btnZQYWFresh: TButton
        Left = 331
        Top = -3
        Width = 41
        Height = 35
        Caption = #21047#26032
        TabOrder = 5
        OnClick = btnZQYWFreshClick
      end
      object dtpZQYWKSRQ: TDateTimePicker
        Left = 472
        Top = 5
        Width = 95
        Height = 21
        CalAlignment = dtaLeft
        Date = 43189.6808973495
        Time = 43189.6808973495
        DateFormat = dfShort
        DateMode = dmComboBox
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #40657#20307
        Font.Style = []
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        Kind = dtkDate
        ParseInput = False
        ParentFont = False
        TabOrder = 6
        OnCloseUp = dtpZQYWOnChange
        OnChange = dtpZQYWOnChange
      end
      object dtpZQYWJSRQ: TDateTimePicker
        Left = 584
        Top = 5
        Width = 95
        Height = 21
        CalAlignment = dtaLeft
        Date = 43189.6808973495
        Time = 43189.6808973495
        DateFormat = dfShort
        DateMode = dmComboBox
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #40657#20307
        Font.Style = []
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        Kind = dtkDate
        ParseInput = False
        ParentFont = False
        TabOrder = 7
        OnCloseUp = dtpZQYWOnChange
        OnChange = dtpZQYWOnChange
      end
      object edtZQYWSearch: TEdit
        Left = 904
        Top = 5
        Width = 131
        Height = 21
        Hint = #36890#36807#35777#21048#20195#30721#36873#25321#19994#21153
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 8
      end
      object btnZQYWSearch: TBitBtn
        Left = 1037
        Top = -3
        Width = 49
        Height = 35
        Caption = 'Search'
        TabOrder = 9
        OnClick = btnZQYWSearchClick
      end
    end
    object tsRCCZ: TTabSheet
      Caption = '    '#26085#24120#25805#20316'    '
      ImageIndex = 4
      OnShow = tsRCCZShow
      object lblRCCZYWRQ: TLabel
        Left = 56
        Top = 6
        Width = 52
        Height = 19
        Caption = #19994#21153#26085#26399
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
      end
      object lblRCCZCLJD: TLabel
        Left = 377
        Top = 6
        Width = 52
        Height = 19
        Alignment = taRightJustify
        Caption = #27491#22312#22788#29702
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
        Visible = False
      end
      object lvRCCZ: TListView
        Left = -2
        Top = 32
        Width = 1159
        Height = 548
        Columns = <>
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnCustomDrawItem = customerDrawItem
      end
      object dtpRCCZYWRQ: TDateTimePicker
        Left = 120
        Top = 5
        Width = 113
        Height = 21
        CalAlignment = dtaLeft
        Date = 39902.4417155324
        Time = 39902.4417155324
        DateFormat = dfShort
        DateMode = dmComboBox
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #40657#20307
        Font.Style = []
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        Kind = dtkDate
        ParseInput = False
        ParentFont = False
        TabOrder = 1
        OnCloseUp = tvRCCZOnChange
      end
      object pbRCCZ: TProgressBar
        Left = 440
        Top = 2
        Width = 165
        Height = 26
        Min = 0
        Max = 100
        TabOrder = 2
        Visible = False
      end
      object btnRZQS: TButton
        Left = 647
        Top = -3
        Width = 70
        Height = 37
        Caption = #26085#32456#28165#31639
        TabOrder = 3
        OnClick = btnRZQSClick
      end
      object btnRCCZSCPZ: TButton
        Left = 784
        Top = -3
        Width = 70
        Height = 37
        Caption = #29983#25104#20973#35777
        TabOrder = 4
        OnClick = btnRCCZSCPZClick
      end
      object btnRCCZRecover: TButton
        Left = 716
        Top = -3
        Width = 70
        Height = 37
        Caption = #24674#22797
        TabOrder = 5
        OnClick = btnRCCZRecoverClick
      end
      object btnPZLL: TButton
        Left = 1083
        Top = -3
        Width = 69
        Height = 37
        Caption = #20973#35777#27983#35272
        TabOrder = 6
        OnClick = btnPZLLClick
      end
      object Button1: TButton
        Left = 853
        Top = -3
        Width = 83
        Height = 37
        Caption = #29983#25104#20272#20540#34920
        TabOrder = 7
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 935
        Top = -3
        Width = 147
        Height = 37
        Caption = #29983#25104#20250#35745#31185#30446#20313#39069#34920
        TabOrder = 8
        OnClick = Button2Click
      end
    end
    object tsBBCK: TTabSheet
      Caption = '    '#32467#26524#27983#35272'    '
      ImageIndex = 5
      OnShow = tsBBCKShow
      object lblBCKTitle: TLabel
        Left = 536
        Top = 8
        Width = 261
        Height = 38
        Alignment = taCenter
        Caption = #20250#35745#31185#30446#20313#39069#34920#26597#30475
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -29
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
      end
      object lblBBCKYWRQ: TLabel
        Left = 952
        Top = 37
        Width = 52
        Height = 19
        Caption = #19994#21153#26085#26399
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #24494#36719#38597#40657
        Font.Style = []
        ParentFont = False
      end
      object tvBBCKMenu: TTreeView
        Left = -4
        Top = -3
        Width = 198
        Height = 591
        HideSelection = False
        Indent = 19
        ReadOnly = True
        TabOrder = 0
        OnClick = tvBBCKOnChange
        OnCustomDrawItem = SubMenuSysMCustomDrawItem
        Items.Data = {
          03000000210000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
          08C6BED6A4B2E9BFB4230000000000000000000000FFFFFFFFFFFFFFFF000000
          00000000000AB9C0D6B5B1EDB2E9BFB42B0000000000000000000000FFFFFFFF
          FFFFFFFF000000000000000012BBE1BCC6BFC6C4BFD3E0B6EEB1EDB2E9BFB4}
      end
      object dbgrdBBCK: TDBGrid
        Left = 193
        Top = 56
        Width = 962
        Height = 523
        DataSource = UserDataSource
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        ParentFont = False
        PopupMenu = BasicDBGPopMenu
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object dtpBBCKYWRQ: TDateTimePicker
        Left = 1008
        Top = 36
        Width = 95
        Height = 21
        CalAlignment = dtaLeft
        Date = 42520.4417155324
        Time = 42520.4417155324
        DateFormat = dfShort
        DateMode = dmComboBox
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = #40657#20307
        Font.Style = []
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        Kind = dtkDate
        ParseInput = False
        ParentFont = False
        TabOrder = 2
        OnCloseUp = tvBBCKOnChange
      end
    end
  end
  object dtpMainForm: TDateTimePicker
    Left = 0
    Top = 618
    Width = 95
    Height = 21
    CalAlignment = dtaLeft
    Date = 42520.4417155324
    Time = 42520.4417155324
    DateFormat = dfShort
    DateMode = dmComboBox
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #40657#20307
    Font.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    Kind = dtkDate
    ParseInput = False
    ParentFont = False
    TabOrder = 1
  end
  object UserADOQuery: TADOQuery
    Connection = conMainForm
    CursorType = ctStatic
    EnableBCD = False
    Parameters = <>
    SQL.Strings = (
      'Select  *  From  TJYFL')
    Left = 536
  end
  object UserDataSource: TDataSource
    DataSet = UserADOQuery
    Left = 512
  end
  object UserDBGPopMenu: TPopupMenu
    Left = 568
    object UserDBGDel: TMenuItem
      Caption = #21024#38500#29992#25143
      OnClick = UserDBGDelClick
    end
    object UserDBGChangePasswd: TMenuItem
      Caption = #26356#25913#23494#30721
      OnClick = UserDBGChangePasswdClick
    end
  end
  object BasicDBGPopMenu: TPopupMenu
    Left = 600
    object BasicDBGScanButton: TMenuItem
      Caption = #26597#30475
      OnClick = BasicDBGScanButtonClick
    end
    object BasicDBGEditButton: TMenuItem
      Caption = #32534#36753
      OnClick = BasicDBGEditButtonClick
    end
    object BasicDBGDeleteButton: TMenuItem
      Caption = #21024#38500
      Visible = False
      OnClick = BasicDBGDeleteButtonClick
    end
  end
  object conMainForm: TADOConnection
    LoginPrompt = False
    Provider = 'OraOLEDB.Oracle.1'
    Left = 632
  end
  object pmDM: TPopupMenu
    Left = 664
    object pmDMN1: TMenuItem
      Caption = #26597#30475
      OnClick = pmDMN1Click
    end
    object pmDMN2: TMenuItem
      Caption = #32534#36753
      OnClick = pmDMN2Click
    end
    object pmDMN4: TMenuItem
      Caption = #26032#22686
      OnClick = pmDMN4Click
    end
  end
  object pmZQYW: TPopupMenu
    Left = 696
    object mni1: TMenuItem
      Caption = #26597#30475
      OnClick = btnZQYWScanClick
    end
    object mni2: TMenuItem
      Caption = #32534#36753
      OnClick = btnZQYWEditClick
    end
    object N1: TMenuItem
      Caption = #26032#22686
      OnClick = btnZQYWAddClick
    end
    object mni3: TMenuItem
      Caption = #21024#38500
      OnClick = mni3Click
    end
  end
  object qryUserPasswd: TADOQuery
    Parameters = <>
    Left = 720
  end
end
