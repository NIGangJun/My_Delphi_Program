object Form5: TForm5
  Left = 0
  Top = 0
  Caption = #21592#24037#20449#24687#31649#29702
  ClientHeight = 551
  ClientWidth = 975
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 977
    Height = 552
    TabOrder = 0
    object Label2: TLabel
      Left = 408
      Top = 16
      Width = 152
      Height = 37
      Alignment = taCenter
      Caption = #21592#24037#20449#24687
      Font.Charset = GB2312_CHARSET
      Font.Color = clNavy
      Font.Height = -37
      Font.Name = #21326#25991#34892#26999
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object SpeedButton1: TSpeedButton
      Left = 16
      Top = 487
      Width = 113
      Height = 33
      Caption = #26032#22686#20449#24687
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 224
      Top = 487
      Width = 113
      Height = 33
      Caption = #20462#25913#20449#24687
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton
      Left = 431
      Top = 487
      Width = 113
      Height = 33
      Caption = #21024#38500#20449#24687
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 832
      Top = 487
      Width = 113
      Height = 33
      Caption = #21462#28040#25805#20316
      OnClick = SpeedButton4Click
    end
    object SpeedButton5: TSpeedButton
      Left = 632
      Top = 487
      Width = 113
      Height = 33
      Caption = #20445#23384#20449#24687
      OnClick = SpeedButton5Click
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 351
      Width = 961
      Height = 114
      Caption = #20449#24687#32534#36753#22788
      TabOrder = 0
      object Label1: TLabel
        Left = 24
        Top = 32
        Width = 57
        Height = 17
        AutoSize = False
        Caption = #22995#21517#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 320
        Top = 32
        Width = 73
        Height = 17
        AutoSize = False
        Caption = #24037#21495#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 656
        Top = 32
        Width = 57
        Height = 17
        AutoSize = False
        Caption = #30005#35805#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 24
        Top = 72
        Width = 57
        Height = 17
        AutoSize = False
        Caption = #24037#31181#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 320
        Top = 72
        Width = 105
        Height = 17
        AutoSize = False
        Caption = #21592#24037#30331#24405#23494#30721#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 656
        Top = 75
        Width = 73
        Height = 17
        AutoSize = False
        Caption = #25480#26435#26435#38480#65306
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 87
        Top = 30
        Width = 121
        Height = 21
        DataField = 'name'
        DataSource = DataSource1
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 431
        Top = 30
        Width = 121
        Height = 21
        DataField = 'id'
        DataSource = DataSource1
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 751
        Top = 30
        Width = 121
        Height = 21
        DataField = 'telephone'
        DataSource = DataSource1
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 87
        Top = 70
        Width = 121
        Height = 21
        DataField = 'profession'
        DataSource = DataSource1
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 431
        Top = 70
        Width = 121
        Height = 21
        DataField = 'level'
        DataSource = DataSource1
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 751
        Top = 73
        Width = 121
        Height = 21
        DataField = 'permission'
        DataSource = DataSource1
        ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
        TabOrder = 5
      end
    end
    object DBGrid1: TDBGrid
      Left = 8
      Top = 72
      Width = 961
      Height = 257
      DataSource = DataSource1
      ImeName = #20013#25991'('#31616#20307') - '#25628#29399#25340#38899#36755#20837#27861
      TabOrder = 1
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
          Title.Caption = #22995#21517
          Width = 158
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'id'
          Title.Alignment = taCenter
          Title.Caption = #24037#21495
          Width = 158
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'telephone'
          Title.Alignment = taCenter
          Title.Caption = #30005#35805
          Width = 158
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'profession'
          Title.Alignment = taCenter
          Title.Caption = #24037#31181
          Width = 158
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'level'
          Title.Alignment = taCenter
          Title.Caption = #21592#24037#30331#24405#23494#30721
          Width = 158
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'permission'
          Title.Alignment = taCenter
          Title.Caption = #25480#26435#26435#38480
          Width = 158
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'I'
          Title.Alignment = taCenter
          Title.Caption = #26631#35782#35760#24405
          Visible = True
        end>
    end
  end
  object ADOQuery1: TADOQuery
    Connection = Form1.ADOConnection1
    Parameters = <>
    Left = 40
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 120
    Top = 23
  end
end
