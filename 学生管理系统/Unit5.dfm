object Form5: TForm5
  Left = 368
  Top = 125
  BorderIcons = [biSystemMenu]
  Caption = #25171#21360
  ClientHeight = 521
  ClientWidth = 620
  Color = clSkyBlue
  Constraints.MaxHeight = 559
  Constraints.MaxWidth = 636
  Constraints.MinHeight = 559
  Constraints.MinWidth = 636
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 240
    Top = 472
    Width = 153
    Height = 33
    Caption = #30830#35748#25171#21360
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 432
    Top = 472
    Width = 73
    Height = 33
    Caption = #21462#28040
    OnClick = SpeedButton2Click
  end
  object Label11: TLabel
    Left = 248
    Top = 0
    Width = 145
    Height = 33
    AutoSize = False
    Caption = #23398#29983#31616#21382
    Font.Charset = ANSI_CHARSET
    Font.Color = clTeal
    Font.Height = -32
    Font.Name = #26999#20307
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 24
    Top = 48
    Width = 41
    Height = 25
    AutoSize = False
    Caption = #22995#21517
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 232
    Top = 48
    Width = 41
    Height = 25
    AutoSize = False
    Caption = #23398#21495
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 24
    Top = 168
    Width = 57
    Height = 25
    AutoSize = False
    Caption = #36523#20221#35777#21495
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 24
    Top = 128
    Width = 57
    Height = 25
    AutoSize = False
    Caption = #31821#36143
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 24
    Top = 208
    Width = 57
    Height = 25
    AutoSize = False
    Caption = #26242#20303#22320
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 24
    Top = 88
    Width = 57
    Height = 25
    AutoSize = False
    Caption = #32852#31995#30005#35805
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 232
    Top = 88
    Width = 57
    Height = 25
    AutoSize = False
    Caption = #22269#31821
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 24
    Top = 248
    Width = 57
    Height = 25
    AutoSize = False
    Caption = #39640#20013#23398#26657
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 24
    Top = 328
    Width = 57
    Height = 25
    AutoSize = False
    Caption = #23398#29983#31616#20171
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 24
    Top = 288
    Width = 57
    Height = 25
    AutoSize = False
    Caption = #26366#33719#33635#35465
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  object Image1: TImage
    Left = 416
    Top = 48
    Width = 185
    Height = 225
    Stretch = True
  end
  object DBEdit1: TDBEdit
    Left = 88
    Top = 48
    Width = 105
    Height = 21
    DataField = 'Name'
    DataSource = Form2.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 280
    Top = 48
    Width = 105
    Height = 21
    DataField = 'Number'
    DataSource = Form2.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 88
    Top = 168
    Width = 297
    Height = 21
    DataField = 'ID'
    DataSource = Form2.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 88
    Top = 128
    Width = 297
    Height = 21
    DataField = 'Home'
    DataSource = Form2.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ReadOnly = True
    TabOrder = 3
  end
  object DBEdit5: TDBEdit
    Left = 88
    Top = 208
    Width = 297
    Height = 21
    DataField = 'NowHome'
    DataSource = Form2.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ReadOnly = True
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 88
    Top = 88
    Width = 105
    Height = 21
    DataField = 'Telephone'
    DataSource = Form2.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ReadOnly = True
    TabOrder = 5
  end
  object DBEdit7: TDBEdit
    Left = 280
    Top = 88
    Width = 105
    Height = 21
    DataField = 'Country'
    DataSource = Form2.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ReadOnly = True
    TabOrder = 6
  end
  object DBEdit8: TDBEdit
    Left = 88
    Top = 248
    Width = 297
    Height = 21
    DataField = 'HighScl'
    DataSource = Form2.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ReadOnly = True
    TabOrder = 7
  end
  object DBMemo1: TDBMemo
    Left = 88
    Top = 328
    Width = 513
    Height = 129
    DataField = 'Ssynopsis'
    DataSource = Form2.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ReadOnly = True
    TabOrder = 8
  end
  object DBEdit9: TDBEdit
    Left = 88
    Top = 288
    Width = 513
    Height = 21
    DataField = 'Honor'
    DataSource = Form2.DataSource1
    ImeName = #20013#25991' ('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
    ReadOnly = True
    TabOrder = 9
  end
  object PrintDialog1: TPrintDialog
    Left = 56
    Top = 8
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 144
    Top = 8
  end
end
