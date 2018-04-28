object KJKMForm1: TKJKMForm1
  Left = 456
  Top = 224
  Width = 355
  Height = 279
  Caption = #20250#35745#31185#30446#35774#32622'-'
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object KJKMKMDMLabel: TLabel
    Left = 60
    Top = 31
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #31185#30446#20195#30721
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object KJKMKMMCLabel: TLabel
    Left = 60
    Top = 71
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #31185#30446#21517#31216
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object lblKJKMJDFX: TLabel
    Left = 60
    Top = 144
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #20511#36151#26041#21521
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object KJKMKMDMEdit: TEdit
    Left = 145
    Top = 26
    Width = 129
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
  object KJKMKMMCEdit: TEdit
    Left = 60
    Top = 98
    Width = 214
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
    TabOrder = 1
  end
  object KJKMSureButton: TButton
    Left = 127
    Top = 190
    Width = 73
    Height = 25
    Caption = #30830#23450
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = KJKMSureButtonClick
  end
  object KJKMCancleButton: TButton
    Left = 199
    Top = 190
    Width = 73
    Height = 25
    Caption = #21462#28040
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = KJKMCancleButtonClick
  end
  object cbbKJKMJDFX: TComboBox
    Left = 145
    Top = 142
    Width = 128
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
    Text = #20511
    Items.Strings = (
      #20511
      #36151)
  end
  object KJKMADOQuerry: TADOQuery
    Connection = MainForm.conMainForm
    Parameters = <>
    Left = 104
    Top = 189
  end
end
