object UserForm: TUserForm
  Left = 515
  Top = 217
  Width = 349
  Height = 243
  Caption = 'UserForm'
  Color = clActiveCaption
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object UserFormUserNameLabel: TLabel
    Left = 101
    Top = 23
    Width = 64
    Height = 18
    Alignment = taRightJustify
    Caption = #29992#25143#21517#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Adobe '#40657#20307' Std R'
    Font.Style = []
    ParentFont = False
  end
  object UserFormPasswdLabel1: TLabel
    Left = 117
    Top = 68
    Width = 48
    Height = 18
    Alignment = taRightJustify
    Caption = #23494#30721#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Adobe '#40657#20307' Std R'
    Font.Style = []
    ParentFont = False
  end
  object UserFormPasswdLabel2: TLabel
    Left = 85
    Top = 111
    Width = 80
    Height = 18
    Alignment = taRightJustify
    Caption = #30830#35748#23494#30721#65306
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Adobe '#40657#20307' Std R'
    Font.Style = []
    ParentFont = False
  end
  object UserFormUserNameEdit: TEdit
    Left = 179
    Top = 20
    Width = 81
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentFont = False
    TabOrder = 0
  end
  object UserFormPasswdEdit1: TEdit
    Left = 179
    Top = 66
    Width = 81
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentFont = False
    TabOrder = 1
  end
  object UserFormPasswdEdit2: TEdit
    Left = 179
    Top = 108
    Width = 81
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ParentFont = False
    TabOrder = 2
  end
  object UserFormSureButton: TButton
    Left = 139
    Top = 158
    Width = 60
    Height = 25
    Caption = #30830#23450
    TabOrder = 3
    OnClick = UserFormSureButtonClick
  end
  object UserFormCancleButton: TButton
    Left = 195
    Top = 158
    Width = 60
    Height = 25
    Caption = #21462#28040
    TabOrder = 4
    OnClick = UserFormCancleButtonClick
  end
  object UserOperationADOQuery: TADOQuery
    Connection = MainForm.conMainForm
    Parameters = <>
    Left = 112
    Top = 155
  end
end
