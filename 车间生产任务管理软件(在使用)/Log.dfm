object Form7: TForm7
  Left = 0
  Top = 0
  Caption = #20219#21153#26597#35810
  ClientHeight = 832
  ClientWidth = 1052
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 459
    Top = 8
    Width = 112
    Height = 33
    Alignment = taCenter
    Caption = #26597#35810#26041#26696
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 56
    Top = 88
    Width = 385
    Height = 153
    Caption = #25353#26102#38388#26597#35810
    TabOrder = 0
    object Label2: TLabel
      Left = 19
      Top = 28
      Width = 84
      Height = 25
      Alignment = taCenter
      Caption = #24320#22987#26102#38388
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 19
      Top = 100
      Width = 84
      Height = 25
      Alignment = taCenter
      Caption = #32467#26463#26102#38388
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DateTimePicker1: TDateTimePicker
      Left = 136
      Top = 32
      Width = 186
      Height = 21
      Date = 43128.562236469910000000
      Format = 'yyyy/MM/dd '
      Time = 43128.562236469910000000
      TabOrder = 0
    end
    object DateTimePicker2: TDateTimePicker
      Left = 136
      Top = 104
      Width = 186
      Height = 21
      Date = 43128.562236469910000000
      Format = 'yyyy/MM/dd '
      Time = 43128.562236469910000000
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 592
    Top = 88
    Width = 385
    Height = 153
    Caption = #25353#29677#32452#26597#35810
    TabOrder = 1
    object Label4: TLabel
      Left = 35
      Top = 25
      Width = 105
      Height = 25
      Alignment = taCenter
      Caption = #36873#25321#29677#32452#21495
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 216
      Top = 32
      Width = 145
      Height = 21
      TabOrder = 0
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 147
    Top = 24
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 75
    Top = 24
  end
end
