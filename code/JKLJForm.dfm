object JKLJForm1: TJKLJForm1
  Left = 430
  Top = 211
  Width = 467
  Height = 250
  Caption = #25509#21475#36335#24452#35774#32622
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
  object JKLJFormJKBHLabel: TLabel
    Left = 35
    Top = 23
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #25509#21475#32534#21495
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object JKLJFormJKMCLabel: TLabel
    Left = 227
    Top = 25
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #25509#21475#21517#31216
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object JKLJFormWJMCLabel: TLabel
    Left = 35
    Top = 67
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #25991#20214#21517#31216
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object JKLJFormWJLJLabel: TLabel
    Left = 35
    Top = 113
    Width = 64
    Height = 16
    Alignment = taRightJustify
    Caption = #25991#20214#36335#24452
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
  end
  object JKLJFormJKBHEdit: TEdit
    Left = 112
    Top = 20
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
  object JKLJFormJKMCEdit: TEdit
    Left = 304
    Top = 20
    Width = 113
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
  object JKLJFormWJMCEdit: TEdit
    Left = 112
    Top = 62
    Width = 140
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
  object JKLJFormWJLJEdit: TEdit
    Left = 112
    Top = 107
    Width = 282
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
  object JKLJSureButton: TButton
    Left = 268
    Top = 163
    Width = 73
    Height = 25
    Caption = #30830#23450
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = JKLJSureButtonClick
  end
  object JKLJCancleButton: TButton
    Left = 340
    Top = 163
    Width = 73
    Height = 25
    Caption = #21462#28040
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #40657#20307
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = JKLJCancleButtonClick
  end
  object JKLJFormWJLJChooseButton: TBitBtn
    Left = 392
    Top = 106
    Width = 25
    Height = 25
    Caption = '...'
    TabOrder = 6
    OnClick = JKLJFormWJLJChooseButtonClick
  end
  object JKLJFormADOQuerry: TADOQuery
    Connection = MainForm.conMainForm
    Parameters = <>
    Left = 242
    Top = 162
  end
end
