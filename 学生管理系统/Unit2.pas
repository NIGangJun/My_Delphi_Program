unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, DBCtrls, StdCtrls, Grids, DBGrids, Mask, DB,
  ADODB, ExtDlgs;

type
  TForm2 = class(TForm)
    SpeedButton1: TSpeedButton;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBMemo1: TDBMemo;
    Label10: TLabel;
    DBEdit9: TDBEdit;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    DBNavigator1: TDBNavigator;
    Label11: TLabel;
    Label12: TLabel;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;
    SpeedButton9: TSpeedButton;
    GroupBox3: TGroupBox;
    Image1: TImage;
    SpeedButton8: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    procedure DisAble(Sender: TObject);
    procedure EnAble(Sender: TObject);
    Function Empty():Boolean;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses
   unit1, unit3, unit4, unit5;

{$R *.dfm}
Function TForm2.Empty():Boolean;
  var
      I:integer;
begin
      Result := False;
      for I:=0 to Self.Componentcount-1   do
      begin
          if Self.Components[I] is TDBEdit then
          begin
              if ((Self.Components[I]) as TDBEdit).Text = '' then
              begin
               Result := True;
               Showmessage('除学生简介外其余信息都为必填项，请确认后重试！');
               Exit;
               end;
          end;
      end;
end;

procedure TForm2.EnAble(Sender: TObject);
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
      DBMemo1.Enabled := True;
end;

procedure TForm2.DisAble(Sender: TObject);
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
      DBMemo1.Enabled := False;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if application.MessageBox('确定退出本系统？','提示',mb_yesno)=idyes then
  begin
   Form1.Close;
   end;
   Canclose := False;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
begin
  if application.MessageBox('确定注销？','提示',mb_yesno)=idyes then
  begin
    Form2.Hide;
    Form1.Position:=PoScreenCenter;
    Form1.Show;
  end;
end;

procedure TForm2.FormShow(Sender: TObject);
var
   S : String;
begin
   DisAble(Sender);
   SpeedButton1.Enabled := True;
   SpeedButton2.Enabled := True;
   SpeedButton3.Enabled := True;
   SpeedButton4.Enabled := True;
   SpeedButton5.Enabled := False;
   SpeedButton6.Enabled := True;
   SpeedButton7.Enabled := False;
   SpeedButton8.Enabled := False;
   DBNavigator1.Enabled := True;

   try
     S :=  ExtractFilePath(ParamStr(0)) + ADOTable1.FieldByName('PcPath').AsString;
     Image1.Picture.LoadFromFile(S);
   except
   end;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
    EnAble(Sender);
    SpeedButton2.Enabled := False;
    SpeedButton3.Enabled := False;
    SpeedButton4.Enabled := False;
    SpeedButton5.Enabled := True;
    SpeedButton6.Enabled := False;
    SpeedButton7.Enabled := True;
    SpeedButton8.Enabled := True;
    SpeedButton5.Caption := '取消新增';
    DBNavigator1.Enabled := False;

    ADOTable1.Append;
end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin
    EnAble(Sender);
    SpeedButton2.Enabled := False;
    SpeedButton3.Enabled := False;
    SpeedButton4.Enabled := False;
    SpeedButton5.Enabled := True;
    SpeedButton6.Enabled := False;
    SpeedButton7.Enabled := True;
    SpeedButton8.Enabled := True;
    DBNavigator1.Enabled := False;
    SpeedButton5.Caption := '取消修改';

    ADOTable1.Edit;
end;

procedure TForm2.SpeedButton5Click(Sender: TObject);
begin
   DisAble(Sender);
   SpeedButton1.Enabled := True;
   SpeedButton2.Enabled := True;
   SpeedButton3.Enabled := True;
   SpeedButton4.Enabled := True;
   SpeedButton5.Enabled := False;
   SpeedButton6.Enabled := True;
   SpeedButton7.Enabled := False;
   SpeedButton8.Enabled := False;
   DBNavigator1.Enabled := True;
   SpeedButton5.Caption := '取消';

   ADOTable1.Cancel;
end;

procedure TForm2.SpeedButton7Click(Sender: TObject);
begin
if not (Empty()) then
begin
   DisAble(Sender);
   SpeedButton1.Enabled := True;
   SpeedButton2.Enabled := True;
   SpeedButton3.Enabled := True;
   SpeedButton4.Enabled := True;
   SpeedButton5.Enabled := False;
   SpeedButton6.Enabled := True;
   SpeedButton7.Enabled := False;
   SpeedButton8.Enabled := False;
   DBNavigator1.Enabled := True;
   SpeedButton5.Caption := '取消';

   ADOTable1.Post;
   CopyFile(PChar(OpenPictureDialog1.FileName),
      PChar((ExtractFilePath(ParamStr(0)) + 'Image\' +
      ExtractFileName(OpenPictureDialog1.FileName))), True);
   Showmessage('保存成功！');
end;
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
  if application.MessageBox('确定删除？','提示',mb_yesno)=idyes then
  begin
    ADOTable1.Delete;
    Showmessage('删除成功！');
   end;
end;

procedure TForm2.SpeedButton8Click(Sender: TObject);
var
   S: String;
begin
  if OpenPictureDialog1.Execute then
  begin
     S := 'Image\' + ExtractFileName(OpenPictureDialog1.FileName);
     Image1.Picture.LoadFromFile(OpenPictureDialog1.FileName);
     ADOTable1.FieldByName('PcPath').Value := S;
  end;
end;

procedure TForm2.DataSource1DataChange(Sender: TObject; Field: TField);
var
   S: String;
begin
if  SpeedButton8.Enabled = False then
try
     S :=  ExtractFilePath(ParamStr(0)) + ADOTable1.FieldByName('PcPath').AsString;
     Image1.Picture.LoadFromFile(S);
except
     Image1.Picture := nil;
end;
end;

procedure TForm2.SpeedButton6Click(Sender: TObject);
begin
     Form3.Position := PoScreenCenter;
     Form3.ShowModal;
end;

procedure TForm2.SpeedButton9Click(Sender: TObject);
begin
     Form4.Position := PoScreenCenter;
     Form4.ShowModal;
end;

procedure TForm2.SpeedButton10Click(Sender: TObject);
begin
     Form5.Position := PoScreenCenter;
     Form5.ShowModal;
end;

end.
