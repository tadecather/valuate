object ZQYWXGForm1: TZQYWXGForm1
  Left = 540
  Top = 217
  Width = 468
  Height = 280
  Caption = 'ZQYWXGForm'
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblXGZQDM: TLabel
    Left = 33
    Top = 23
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #35777#21048#20195#30721
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lblXGYWRQ: TLabel
    Left = 249
    Top = 28
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #19994#21153#26085#26399
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lblXGYWLB: TLabel
    Left = 249
    Top = 68
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #19994#21153#31867#21035
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lblXGZQMC: TLabel
    Left = 33
    Top = 63
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #35777#21048#21517#31216
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lblXGCJSL: TLabel
    Left = 249
    Top = 105
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #25104#20132#25968#37327
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lblXGCJJE: TLabel
    Left = 33
    Top = 148
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #25104#20132#37329#39069
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lblXGCJJG: TLabel
    Left = 249
    Top = 146
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #25104#20132#20215#26684
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lblXGJYSC: TLabel
    Left = 33
    Top = 105
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #20132#26131#24066#22330
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object edtXGZQDM: TEdit
    Left = 107
    Top = 22
    Width = 81
    Height = 24
    BiDiMode = bdRightToLeftNoAlign
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
  end
  object dtpXGYWRQ: TDateTimePicker
    Left = 322
    Top = 23
    Width = 90
    Height = 25
    CalAlignment = dtaLeft
    Date = 43186.4417155324
    Time = 43186.4417155324
    DateFormat = dfShort
    DateMode = dmComboBox
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    Kind = dtkDate
    ParseInput = False
    TabOrder = 1
  end
  object edtXGZQMC: TEdit
    Left = 107
    Top = 64
    Width = 81
    Height = 24
    BiDiMode = bdRightToLeftNoAlign
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 2
  end
  object edtXGCJSL: TEdit
    Left = 322
    Top = 104
    Width = 83
    Height = 24
    BiDiMode = bdRightToLeftNoAlign
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 3
    OnEnter = EditInitContent
  end
  object cbbXGYWLB: TComboBox
    Left = 322
    Top = 64
    Width = 83
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #40657#20307
    Font.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ItemHeight = 13
    ParentFont = False
    TabOrder = 4
    Text = #26032#32929#30003#36141
    Items.Strings = (
      #26032#32929#30003#36141
      #26032#32929#20013#31614
      #26032#32929#32564#27454
      #26032#32929#20132#25910
      #26032#32929#27969#36890)
  end
  object cbbXGJYSC: TComboBox
    Left = 107
    Top = 104
    Width = 83
    Height = 21
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #40657#20307
    Font.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ItemHeight = 13
    ParentFont = False
    TabOrder = 5
    Text = #19978#28023
    Items.Strings = (
      #19978#28023
      #28145#22323)
  end
  object edtXGCJJG: TEdit
    Left = 322
    Top = 145
    Width = 83
    Height = 24
    BiDiMode = bdRightToLeftNoAlign
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 6
    OnEnter = EditInitContent
  end
  object edtXGCJJE: TEdit
    Left = 107
    Top = 145
    Width = 83
    Height = 24
    BiDiMode = bdRightToLeftNoAlign
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 7
    OnEnter = EditInitContent
  end
  object btnXGSure: TButton
    Left = 262
    Top = 192
    Width = 73
    Height = 25
    Caption = #30830#23450
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = btnXGSureClick
  end
  object btnXGCancle: TButton
    Left = 334
    Top = 192
    Width = 73
    Height = 25
    Caption = #21462#28040
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = btnXGCancleClick
  end
  object cbbXGZQDM: TComboBox
    Left = 111
    Top = 23
    Width = 143
    Height = 21
    AutoComplete = False
    AutoDropDown = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #40657#20307
    Font.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ItemHeight = 13
    ParentFont = False
    TabOrder = 10
    OnChange = SelectZQXX
    OnSelect = AutoZQXX
  end
  object qryXGYW: TADOQuery
    Connection = MainForm.conMainForm
    Parameters = <>
    Left = 233
    Top = 191
  end
end
