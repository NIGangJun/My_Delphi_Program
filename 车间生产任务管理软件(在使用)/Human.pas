unit Human;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TForm5 = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure DisAble(Sender: TObject);
    procedure EnAble(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation
//调用其他单元
Uses
  LogIn,Product;

{$R *.dfm}

procedure TForm5.FormShow(Sender: TObject);
begin
  try
    ADOQuery1.SQL.Text := 'SELECT *FROM human';
    ADOQuery1.Active := True;
  except
    showmessage('调用失败');
  end;
  DisAble(Sender);
  Speedbutton1.Enabled := true;
  Speedbutton2.Enabled := true;
  Speedbutton3.Enabled := true;
  Speedbutton4.Enabled := false;
  Speedbutton5.Enabled := false;
end;

procedure TForm5.EnAble(Sender: TObject);//使能Edit控件
  var
      I:integer;
begin
      for i:=0 to Self.Componentcount-1   do
      begin
          if Self.Components[i] is TDBEdit then
          begin
              ((Self.Components[i]) as TDBEdit).Enabled := True;
          end;
      end;
end;

procedure TForm5.DisAble(Sender: TObject);//取消Edit控件使能属性
  var
      I:integer;
begin
      for i:=0 to Self.Componentcount-1   do
      begin
          if Self.Components[i] is TDBEdit then
          begin
              ((Self.Components[i]) as TDBEdit).Enabled := False;
          end;
      end;
end;

procedure TForm5.SpeedButton1Click(Sender: TObject);                           //新增
begin
  EnAble(Sender);
  Speedbutton1.Enabled := false;
  Speedbutton2.Enabled := false;
  Speedbutton3.Enabled := false;
  Speedbutton4.Enabled := true;
  Speedbutton5.Enabled := true;
  DBedit1.SetFocus;
  ADOQuery1.Append;
end;

procedure TForm5.SpeedButton2Click(Sender: TObject);                           //修改
begin
  EnAble(Sender);
  Speedbutton1.Enabled := false;
  Speedbutton2.Enabled := false;
  Speedbutton3.Enabled := false;
  Speedbutton4.Enabled := true;
  Speedbutton5.Enabled := true;
  DBedit1.SetFocus;
  ADOQuery1.Edit;
end;

procedure TForm5.SpeedButton3Click(Sender: TObject);                           //删除
begin
  if application.MessageBox('确定删除？','提示',mb_yesno)=idyes then
    begin
      adoquery1.Delete;
      Showmessage('删除成功！');
    end;
end;

procedure TForm5.SpeedButton4Click(Sender: TObject);                           //取消
begin
  DisAble(Sender);
  Speedbutton1.Enabled := true;
  Speedbutton2.Enabled := true;
  Speedbutton3.Enabled := true;
  Speedbutton4.Enabled := false;
  Speedbutton5.Enabled := false;
  ADOQuery1.Cancel;
end;

procedure TForm5.SpeedButton5Click(Sender: TObject);                           //保存
begin
  if (DBEdit1.Text ='') or (DBEdit2.Text ='') or (DBEdit3.Text ='') or (DBEdit4.Text ='') then
  begin
    Showmessage('请勿留空');
    Exit;
  end;
  DisAble(Sender);
  Speedbutton1.Enabled := true;
  Speedbutton2.Enabled := true;
  Speedbutton3.Enabled := true;
  Speedbutton4.Enabled := false;
  Speedbutton5.Enabled := false;
  ADOQuery1.Post;
end;

end.
