object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Excel'#25171#21360#31383#21475
  ClientHeight = 302
  ClientWidth = 517
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 16
    Width = 81
    Height = 17
    AutoSize = False
    Caption = #20219#21153#34920#25171#21360
  end
  object Label2: TLabel
    Left = 72
    Top = 91
    Width = 81
    Height = 17
    AutoSize = False
    Caption = #24037#24207#34920#25171#21360
  end
  object Label3: TLabel
    Left = 72
    Top = 163
    Width = 81
    Height = 17
    AutoSize = False
    Caption = #29677#32452#34920#25171#21360
  end
  object Label6: TLabel
    Left = 72
    Top = 227
    Width = 81
    Height = 17
    AutoSize = False
    Caption = #26085#24535#34920#25171#21360
  end
  object Button1: TButton
    Left = 208
    Top = 40
    Width = 90
    Height = 25
    Caption = #20219#21153#34920#25171#21360
    TabOrder = 0
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 42
    Width = 145
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
    TabOrder = 1
  end
  object Button2: TButton
    Left = 208
    Top = 112
    Width = 90
    Height = 25
    Caption = #24037#24207#34920#25171#21360
    TabOrder = 2
    OnClick = Button2Click
  end
  object ComboBox2: TComboBox
    Left = 24
    Top = 114
    Width = 145
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
    TabOrder = 3
    OnClick = ComboBox2Click
  end
  object Button3: TButton
    Left = 208
    Top = 184
    Width = 90
    Height = 25
    Caption = #29677#32452#34920#25171#21360
    TabOrder = 4
    OnClick = Button3Click
  end
  object ComboBox3: TComboBox
    Left = 24
    Top = 186
    Width = 145
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
    TabOrder = 5
    OnClick = ComboBox3Click
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 325
    Width = 761
    Height = 228
    DataSource = DataSource1
    ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
  end
  object ComboBox4: TComboBox
    Left = 24
    Top = 114
    Width = 145
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
    TabOrder = 7
    Visible = False
    OnClick = ComboBox4Click
  end
  object ComboBox5: TComboBox
    Left = 24
    Top = 186
    Width = 145
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
    TabOrder = 8
    Visible = False
    OnClick = ComboBox5Click
  end
  object ComboBox6: TComboBox
    Left = 24
    Top = 250
    Width = 145
    Height = 21
    ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
    TabOrder = 9
  end
  object Button4: TButton
    Left = 208
    Top = 248
    Width = 90
    Height = 25
    Caption = #26085#24535#34920#25171#21360
    TabOrder = 10
    OnClick = Button4Click
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 376
    Top = 144
  end
  object ADOQuery2: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 376
    Top = 192
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 408
    Top = 144
  end
  object DataSource2: TDataSource
    Left = 408
    Top = 192
  end
end
