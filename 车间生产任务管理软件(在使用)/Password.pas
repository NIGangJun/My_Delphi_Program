unit Password;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls;

type
  TForm8 = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation
//调用其他单元
Uses
  LogIn,Product;
{$R *.dfm}
{增删改查}
procedure TForm8.Button1Click(Sender: TObject);
begin
  ADOQuery1.Append;
  DBEdit1.SetFocus;
  Button4.Enabled := True;
  Button5.Enabled := True;
  Button1.Enabled := false;
  Button2.Enabled := false;
  Button3.Enabled := false;
  DBGrid1.Enabled := False;
end;

procedure TForm8.Button2Click(Sender: TObject);
begin
  ADOQuery1.Edit;
  DBEdit1.SetFocus;
  Button4.Enabled := True;
  Button5.Enabled := True;
  Button1.Enabled := false;
  Button2.Enabled := false;
  Button3.Enabled := false;
  DBGrid1.Enabled := False;
end;

procedure TForm8.Button3Click(Sender: TObject);
begin
  if Application.MessageBox('确认删除？','警告',MB_YESNO)=IDYES then
    begin
      ADOQuery1.Delete;
    end
  else
    begin
      ADOQuery1.Cancel;
    end;
end;

procedure TForm8.Button4Click(Sender: TObject);
begin
  ADOQuery1.Post;
  Button4.Enabled := false;
  Button5.Enabled := false;
  Button1.Enabled := true;
  Button2.Enabled := true;
  Button3.Enabled := true;
  DBGrid1.Enabled := true;
end;

procedure TForm8.Button5Click(Sender: TObject);
begin
  ADOQuery1.Cancel;
  Button4.Enabled := false;
  Button5.Enabled := false;
  Button1.Enabled := true;
  Button2.Enabled := true;
  Button3.Enabled := true;
  DBGrid1.Enabled := true;
end;

procedure TForm8.FormShow(Sender: TObject);
var
  I: Integer;
begin
  ADOQuery1.SQL.Text := 'Select *From password';
  ADOQuery1.Open;
  for I := 1 to ADOQuery1.RecordCount do
    begin
      ADOQuery1.RecNo := I;
      if ADOQuery1.FieldByName('name').AsString = '000000' then
        showmessage('请删除系统默认生成的用户ID和密码！');
    end;
  Button4.Enabled := false;
  Button5.Enabled := false;
end;

end.
