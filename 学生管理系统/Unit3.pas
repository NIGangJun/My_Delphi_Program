unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm3 = class(TForm)
    SpeedButton1: TSpeedButton;
    Edit1: TEdit;
    Label1: TLabel;
    ComboBox1: TComboBox;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
uses
   unit2;

{$R *.dfm}

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
     if ComboBox1.Text = '按姓名' then
       begin if not(Form2.ADOTable1.Locate('Name',Edit1.Text,[])) then Showmessage('未找到相应信息！'); end
     else if ComboBox1.Text = '按学号' then
       begin if not(Form2.ADOTable1.Locate('Number',Edit1.Text,[])) then Showmessage('未找到相应信息！'); end
     else
       begin if not(Form2.ADOTable1.Locate('ID',Edit1.Text,[])) then Showmessage('未找到相应信息！');end;
     Close;
end;

end.
