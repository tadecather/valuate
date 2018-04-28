object DataManageGPForm1: TDataManageGPForm1
  Left = 434
  Top = 212
  Width = 509
  Height = 251
  Caption = #32929#31080#20998#32418#20844#21578
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
  object lblZQDMDataManageGP: TLabel
    Left = 39
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
  object lblKSRQDataManageGP: TLabel
    Left = 255
    Top = 28
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #30331#35760#26085#26399
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lblJSRQDataManageGP: TLabel
    Left = 255
    Top = 70
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #21040#36134#26085#26399
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lblZQMCDataManageGP: TLabel
    Left = 39
    Top = 114
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
  object lblGHSLDataManageGP: TLabel
    Left = 255
    Top = 112
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #26435#30410#27604#20363
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lblQYBLDataManageGP: TLabel
    Left = 39
    Top = 163
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #21464#21160#25968#37327
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lblDMGPJYSCLabel: TLabel
    Left = 43
    Top = 73
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
  object edtZQDMDataManageGP: TEdit
    Left = 119
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
  object dtpKSRQDataManageGP: TDateTimePicker
    Left = 340
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
  object dtpJSRQDataManageGP: TDateTimePicker
    Left = 340
    Top = 65
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
  object edtZQMCDataManageGP: TEdit
    Left = 119
    Top = 113
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
  object edtGHSLDataManageGP: TEdit
    Left = 119
    Top = 162
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
  end
  object btnDataMGPSure: TButton
    Left = 282
    Top = 158
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
    OnClick = btnDataMGPSureClick
  end
  object btnDataMGPCancle: TButton
    Left = 354
    Top = 158
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
    OnClick = btnDataMGPCancleClick
  end
  object edtQYBLDataManageGP: TEdit
    Left = 340
    Top = 111
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
    TabOrder = 7
  end
  object edtDMGPJYSCEdit: TEdit
    Left = 120
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
    TabOrder = 8
  end
  object qryDataManageGP: TADOQuery
    Connection = MainForm.conMainForm
    Parameters = <>
    Left = 253
    Top = 156
  end
end
