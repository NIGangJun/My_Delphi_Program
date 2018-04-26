unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    SpeedButton1: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation
uses
   unit1;

{$R *.dfm}

procedure TForm4.SpeedButton1Click(Sender: TObject);
begin
     if (Edit1.Text <> Form1.ADOTable1.FieldByName('Password').AsString) then Showmessage('ԭʼ�����������')
     else if (Edit2.Text <> Edit3.Text) then Showmessage('���������벻��ͬ��')
     else if (Length(Edit2.Text) < 6) then  Showmessage('���볤��С��6��')
     else if (Length(Edit2.Text) > 20) then  Showmessage('���볤�ȴ���20��')
     else
     begin
        Form1.ADOTable1.Edit;
        Form1.ADOTable1.FieldByName('Password').Value := Edit2.Text;
        Form1.ADOTable1.Post;
        Showmessage('�޸ĳɹ���');
        close;
     end;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
    Edit1.Clear;
    Edit2.Clear;
    Edit3.Clear;
end;

end.
