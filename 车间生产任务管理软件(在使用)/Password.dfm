object Form8: TForm8
  Left = 0
  Top = 0
  Caption = 'Form8'
  ClientHeight = 330
  ClientWidth = 567
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
    Left = 165
    Top = 21
    Width = 228
    Height = 37
    Alignment = taCenter
    Caption = #30331#24405#20449#24687#24405#20837
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -37
    Font.Name = #21326#25991#34892#26999
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Panel1: TPanel
    Left = 8
    Top = 80
    Width = 549
    Height = 140
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 0
      Top = 0
      Width = 549
      Height = 140
      DataSource = DataSource1
      ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'name'
          Title.Alignment = taCenter
          Title.Caption = #29992#25143'ID'
          Width = 266
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'password'
          Title.Alignment = taCenter
          Title.Caption = #23494#30721
          Width = 266
          Visible = True
        end>
    end
  end
  object Button1: TButton
    Left = 24
    Top = 280
    Width = 75
    Height = 25
    Caption = #26032#22686
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 136
    Top = 280
    Width = 75
    Height = 25
    Caption = #20462#25913
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 245
    Top = 280
    Width = 75
    Height = 25
    Caption = #21024#38500
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 359
    Top = 280
    Width = 75
    Height = 25
    Caption = #20445#23384
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 464
    Top = 280
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 5
    OnClick = Button5Click
  end
  object DBEdit1: TDBEdit
    Left = 44
    Top = 242
    Width = 183
    Height = 21
    DataField = 'name'
    DataSource = DataSource1
    ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
    TabOrder = 6
  end
  object DBEdit2: TDBEdit
    Left = 322
    Top = 242
    Width = 183
    Height = 21
    DataField = 'password'
    DataSource = DataSource1
    ImeName = #20013#25991'('#31616#20307') - '#30334#24230#36755#20837#27861
    TabOrder = 7
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 32
    Top = 16
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 88
    Top = 16
  end
end
