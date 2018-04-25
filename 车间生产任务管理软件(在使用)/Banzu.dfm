object Form4: TForm4
  Left = 0
  Top = 0
  Caption = #29677#32452#31649#29702
  ClientHeight = 813
  ClientWidth = 1090
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
    Left = 432
    Top = 8
    Width = 225
    Height = 41
    AutoSize = False
    Caption = #29677#32452#20998#37197#31649#29702
    Font.Charset = GB2312_CHARSET
    Font.Color = clOlive
    Font.Height = -37
    Font.Name = #21326#25991#34892#26999
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object SpeedButton1: TSpeedButton
    Left = 729
    Top = 147
    Width = 99
    Height = 33
    Caption = #26032#22686#29677#32452
    OnClick = SpeedButton1Click
  end
  object SpeedButton2: TSpeedButton
    Left = 48
    Top = 685
    Width = 113
    Height = 33
    Caption = #20462#25913#29677#32452
    OnClick = SpeedButton2Click
  end
  object SpeedButton3: TSpeedButton
    Left = 320
    Top = 685
    Width = 113
    Height = 33
    Caption = #21024#38500#29677#32452
    OnClick = SpeedButton3Click
  end
  object SpeedButton4: TSpeedButton
    Left = 728
    Top = 295
    Width = 99
    Height = 33
    Caption = #31227#38500#20154#21592
    OnClick = SpeedButton4Click
  end
  object SpeedButton5: TSpeedButton
    Left = 729
    Top = 439
    Width = 99
    Height = 33
    Caption = #28155#21152#20154#21592
    OnClick = SpeedButton5Click
  end
  object SpeedButton6: TSpeedButton
    Left = 729
    Top = 599
    Width = 99
    Height = 33
    Caption = #20840#37096#31227#38500
    OnClick = SpeedButton6Click
  end
  object SpeedButton7: TSpeedButton
    Left = 728
    Top = 753
    Width = 99
    Height = 33
    Caption = #20840#37096#28155#21152
    OnClick = SpeedButton7Click
  end
  object SpeedButton8: TSpeedButton
    Left = 48
    Top = 765
    Width = 113
    Height = 33
    Caption = #20445#23384
    OnClick = SpeedButton8Click
  end
  object SpeedButton9: TSpeedButton
    Left = 320
    Top = 765
    Width = 113
    Height = 33
    Caption = #21462#28040
    OnClick = SpeedButton9Click
  end
  object Edit1: TEdit
    Left = 24
    Top = 639
    Width = 169
    Height = 24
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
    ParentFont = False
    TabOrder = 0
    TextHint = #35831#36755#20837#29677#32452#21517
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 75
    Width = 433
    Height = 558
    DataSource = DataSource2
    ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'banzunum'
        Title.Alignment = taCenter
        Title.Caption = #29677#32452#21495
        Width = 82
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'banzuname'
        Title.Alignment = taCenter
        Title.Caption = #29677#32452#21517
        Width = 82
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'name'
        Title.Alignment = taCenter
        Title.Caption = #21592#24037#21517
        Width = 82
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'id'
        Title.Alignment = taCenter
        Title.Caption = #21592#24037#21495
        Width = 82
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'permission'
        Title.Alignment = taCenter
        Title.Caption = #26435#38480
        Width = 82
        Visible = True
      end>
  end
  object ListBox1: TListBox
    Left = 479
    Top = 106
    Width = 243
    Height = 687
    ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 2
  end
  object ListBox2: TListBox
    Left = 834
    Top = 135
    Width = 120
    Height = 658
    ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 3
  end
  object Edit3: TEdit
    Left = 833
    Top = 75
    Width = 242
    Height = 24
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
    ParentFont = False
    ReadOnly = True
    TabOrder = 4
    Text = #20154#21592#24211
  end
  object Edit4: TEdit
    Left = 479
    Top = 75
    Width = 243
    Height = 24
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    Text = #22995#21517
  end
  object Edit6: TEdit
    Left = 833
    Top = 105
    Width = 121
    Height = 24
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
    ParentFont = False
    ReadOnly = True
    TabOrder = 6
    Text = #22995#21517
  end
  object Edit7: TEdit
    Left = 954
    Top = 105
    Width = 121
    Height = 24
    Alignment = taCenter
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
    ParentFont = False
    ReadOnly = True
    TabOrder = 7
    Text = #21592#24037'id'
  end
  object ListBox3: TListBox
    Left = 955
    Top = 135
    Width = 120
    Height = 658
    ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
    ItemHeight = 13
    MultiSelect = True
    TabOrder = 8
  end
  object Edit2: TEdit
    Left = 303
    Top = 639
    Width = 154
    Height = 24
    Alignment = taCenter
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
    ParentFont = False
    TabOrder = 9
    TextHint = #27492#26639#20026'ID'#21495
  end
  object ADOQuery2: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 208
    Top = 232
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 280
    Top = 232
  end
  object ADOQuery3: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 880
    Top = 240
  end
end
