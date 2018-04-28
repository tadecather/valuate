object STLFForm1: TSTLFForm1
  Left = 499
  Top = 207
  Width = 475
  Height = 207
  Caption = #19977#25552#20004#36153#35774#32622#31383#21475
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object STLFFormFYLXLabel: TLabel
    Left = 35
    Top = 23
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #36153#29992#31867#22411
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object STLFFormKSRQLabel: TLabel
    Left = 251
    Top = 28
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #24320#22987#26085#26399
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object STLFFormJSRQLabel: TLabel
    Left = 251
    Top = 72
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #32467#26463#26085#26399
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object STLFFormBLJELabel: TLabel
    Left = 35
    Top = 69
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #35745#25552#27604#29575
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object STLFFormJTTSLabel: TLabel
    Left = 35
    Top = 117
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #35745#25552#27425#25968
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object STLFFormFYLXEdit: TEdit
    Left = 104
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
  object STLFFormKSRQDateTimePicker: TDateTimePicker
    Left = 344
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
  object STLFFormJSRQDateTimePicker: TDateTimePicker
    Left = 344
    Top = 67
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
    TabOrder = 2
  end
  object STLFFormBLJEEdit: TEdit
    Left = 104
    Top = 68
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
    TabOrder = 3
  end
  object STLFFormJTTSEdit: TEdit
    Left = 104
    Top = 116
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
    TabOrder = 4
    Text = '0'
  end
  object STLFSureButton: TButton
    Left = 272
    Top = 112
    Width = 73
    Height = 25
    Caption = #30830#23450
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = STLFSureButtonClick
  end
  object STLFCancleButton: TButton
    Left = 344
    Top = 112
    Width = 73
    Height = 25
    Caption = #21462#28040
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = STLFCancleButtonClick
  end
  object STLFADOOperation: TADOQuery
    Connection = MainForm.conMainForm
    Parameters = <>
    Left = 240
    Top = 110
  end
end
