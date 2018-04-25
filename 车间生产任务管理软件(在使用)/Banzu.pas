unit Banzu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Buttons,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls;

type
  TForm4 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    ADOQuery2: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource2: TDataSource;
    ListBox1: TListBox;
    ListBox2: TListBox;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    ListBox3: TListBox;
    ADOQuery3: TADOQuery;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    Edit2: TEdit;
    procedure BanZuMiniTbale(Sender: TOBject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);                                     //ComboBox�������
    Function BMID():String;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BtnEnAble(Sender: TObject);
    procedure BtnDisAble(Sender: TObject);
    procedure PeopleAll(Sender: TObject);  //��ʾԱ������
    procedure IDAll(Sender: TObject);      //��ʾԱ��id
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;


implementation
//����������Ԫ
Uses
  LogIn,Process,Product,Human,PrintExcel,Log,Password;
{$R *.dfm}

procedure TForm4.PeopleAll(Sender: TObject);
var
  I: Integer;
begin
  ADOQuery3.SQL.Text := 'Select *From human';
  ADOQuery3.Active := True;
  ListBox2.Items.Clear;
  for I := 1 to ADOQuery3.RecordCount do
    begin
      ADOQuery3.RecNo := I;
      ListBox2.Items.Add(ADOQuery3.FieldByName('name').AsString);
    end;
end;

procedure TForm4.IDAll(Sender: TObject);
var
  I: Integer;
begin
  ADOQuery3.SQL.Text := 'Select *From human';
  ADOQuery3.Active := True;
  ListBox3.Items.Clear;
  for I := 1 to ADOQuery3.RecordCount do
    begin
      ADOQuery3.RecNo := I;
      ListBox3.Items.Add(ADOQuery3.FieldByName('id').AsString);
    end;
end;

//��ťʹ��
procedure TForm4.BtnEnAble(Sender: TObject);
begin
  {���˱���ȡ����ť������Ķ�ʹ��}
  SpeedButton2.Enabled := True;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
  SpeedButton5.Enabled := True;
  SpeedButton6.Enabled := True;
  SpeedButton7.Enabled := True;
  SpeedButton8.Enabled := False;
  SpeedButton9.Enabled := False;
  Edit1.Enabled := False;
end;

//˫��dbgrid��listbox����ʾ������Ա
procedure TForm4.DBGrid1DblClick(Sender: TObject);
Var
  BanzuID:STRING;
  I: Integer;
begin
  BanzuID := ADOQuery2.FieldByName('banzunum').AsString;
  ADOQuery2.SQL.Text := 'select *from banzu where banzunum like '+''''+'%'+Trim(BanzuID)+'%'+'''';
  ADOQuery2.Active := True;
  ListBox1.Clear;
  for I := 1 to ADOQuery2.RecordCount do
    begin
      ADOQuery2.RecNo := I;
      ListBox1.Items.Add(ADOQuery2.FieldByName('name').AsString);
    end;
  ADOQuery2.SQL.Text := 'select *from banzu';
  ADOQuery2.Open;
end;

//ȡ����ťʹ��
procedure TForm4.BtnDisAble(Sender: TObject);
begin
  {���˱���ȡ����ť������Ķ�ȡ��ʹ��}
  SpeedButton2.Enabled := False;
  SpeedButton3.Enabled := False;
  SpeedButton8.Enabled := True;
  SpeedButton9.Enabled := True;
  Edit1.Enabled := True;
end;

//�����Ӧ��Ա�ӱ�
procedure TForm4.BanZuMiniTbale(Sender: TObject);
begin

end;

//�Զ����������ˮ��
Function TForm4.BMID():String;
Var
  Num:String;
  L:Integer;
begin
  ADOquery2.Last;                                                              //��Ҫָ�����һ����¼
  if ADOQuery2.FieldByName('banzunum').Value=NULL then
    begin
      Num := '001';
    end
  else
    begin                                             //�����ǰ��λȡ����������λ���и�ֵ��1
      L := strtoint(ADOQuery2.FieldByName('banzunum').Value);         //��ȡ������λֵת��Ϊint�ͣ�ѭ������+1����ת��Ϊstr
      L := L + 1;                                                              //����ֵ��ͨ��while...doִ��λ�����ϼ�
      Num := inttostr(L);
      while Length(Num)<3 do                        //�Զ���'0'
        begin
          Num := '0' + Num
        end;
    end;
  Result := Num;
end;

//������ʾ
procedure TForm4.FormShow(Sender: TObject);
begin
  //���������ȡ���������������id������������
  try
    ADOQuery2.SQL.Text :='Select *From banzu';
    ADOQuery2.Active := True;
    //ADOQuery1.Close;
    BtnEnAble(Sender);
    PeopleAll(Sender);
    IDAll(Sender);
  except
  //Ϊ�쳣������Try..except..end����
  end;
end;

procedure TForm4.SpeedButton1Click(Sender: TObject);
Var
  BanzuID: String;
begin
  {��������}
  try
    BanzuID := BMID();
    if Edit1.Text = '' then
      begin
        Showmessage('���������');
      end;
    Edit1.Enabled := True;
    Edit1.SetFocus;
    Edit2.Text := BanzuID;
  except
  //Ϊ�쳣������Try..except..end����
  end;
  listbox1.Clear;
end;

procedure TForm4.SpeedButton2Click(Sender: TObject);
begin
  {�޸�}
  try
    if ADOQuery2.RecordCount < 1 then
      begin
        Showmessage('��ǰ�������δ�а��飬�޸�ʧ�ܣ�');
      end
    else
      begin
        Edit1.Text := ADOQuery2.FieldByName('banzuname').AsString;
        Edit2.Text := ADOQuery2.FieldByName('banzunum').AsString;
        if Edit1.Text = '' then
          begin
            Showmessage('�����������');
          end
        else
          begin
            ADOQuery2.Edit;
          end;
      end;
    BtnDisAble(Sender);
  except
  //Ϊ�쳣������Try..except..end����
  end;

end;

procedure TForm4.SpeedButton3Click(Sender: TObject);
Var
  I: Integer; //��ȡ�����id
  BanzuName:String;//��ȡ��ָ��ǰ�����İ�����
  //����Ϊ����ת���� StringתΪPWideChar
  ws:widestring;
  pws:pwidechar;
begin
  {ɾ��}
  BanzuName := DBGrid1.Fields[1].AsString;
  ws :=  'ȷ��ɾ��    '+BanzuName+'   ����';
  pws :=  pwidechar(WS);
  if Application.MessageBox(pws,'����',MB_YESNO) = IDYES then
    begin
      try
        ADOQuery2.SQL.Text := 'select *from banzu where banzuname like '+''''+'%'+Trim(BanzuName)+'%'+'''';
        ADOQuery2.Open;
        for I := 1 to ADOQuery2.RecordCount do
          begin
            ADOQuery2.Delete;
          end;
        ADOQuery2.SQL.Text := 'Select *From banzu';
        ADOQuery2.Active := True;
      except
      //Ϊ�쳣������Try..except..end����
        Showmessage('ɾ���쳣');
      end;
    end;
end;

procedure TForm4.SpeedButton4Click(Sender: TObject);
Var
  I:integer;
begin
  {�Ƴ��б�Ա��}
  try
    for I := 0 to listbox1.Items.Count - 1 do
      begin
        if listbox1.Selected[I] = true then
          begin
            ADOQuery2.SQL.Text := 'select *from banzu where name like '+''''+'%'+Trim(listbox1.Items[I])+'%'+'''';
            ADOQuery2.Open;
            ADOQuery2.Delete;
          end;
      end;
    ADOQuery2.SQL.Text := 'Select *From banzu';
    ADOQuery2.Active := True;
    listbox1.DeleteSelected;
  except
  //Ϊ�쳣������Try..except..end����
  end;
end;

procedure TForm4.SpeedButton5Click(Sender: TObject);
var
  I: Integer;
  H: integer;
  C:  array of String;    //�����������
  L: Integer;
  G: Integer;
begin
  {�������б�Ա��}
  try
  //�������鳤��
  SetLength(C,listbox1.Items.Count);
  for L := 0 to listbox1.Items.Count - 1 do
    begin
      C[L]:= Listbox1.Items[L];
    end;
  //�������Ա
  Listbox1.Items.Clear;
  for G := 0 to high(C) do
    begin
     Listbox1.Items.Add(C[G]);
    end;
  //���������ݱ�
  for I := 0 to listbox2.Items.Count - 1 do
    begin
      H:=I;
      if ListBox2.Selected[I] = True then
        begin
          ListBox3.Selected[H] := ListBox2.Selected[I];
          ADOQuery2.Append;
          ADOQuery2.FieldByName('banzuname').AsString := Edit1.Text;
          ADOQuery2.FieldByName('banzunum').AsString := Edit2.Text;
          ADOQuery2.FieldByName('name').AsString := listbox2.Items[I];
          ADOQuery2.FieldByName('id').AsString := listbox3.Items[H];
          ADOQuery2.FieldByName('permission').AsString := '0';
          ADOQuery2.Post;
          Listbox1.Items.Add(listbox2.Items[I]);
          listbox2.Selected[I] := False;
          listbox3.Selected[H] := False;
        end;
    end;
  except
  //Ϊ�쳣������Try..except..end����
  end;
  Edit1.Enabled := False;
end;

procedure TForm4.SpeedButton6Click(Sender: TObject);
var
  I: Integer;
begin
  {ȫ���Ƴ�}
  try
  for I := 0 to listbox1.Items.Count - 1 do
    begin
      ADOQuery2.SQL.Text := 'select *from banzu where name like '+''''+'%'+Trim(listbox1.Items[I])+'%'+'''';
      ADOQuery2.Open;
      ADOQuery2.Delete;
      ADOQuery2.Close;
      ADOQuery2.Open;
    end;
  listbox1.Clear;
  except
  //Ϊ�쳣������Try..except..end����
  end;
end;

procedure TForm4.SpeedButton7Click(Sender: TObject);
var
  //����Ա������listbox��������
  I: Integer;
  H: Integer;
begin
  {ȫ����Ӱ�ť}
  try

  Listbox1.Items.Clear;
  for I := 0 to ADOQuery3.RecordCount - 1 do
    begin
      H:=I;
      ADOQuery2.Append;
      ADOQuery2.FieldByName('banzuname').AsString := Edit1.Text;
      ADOQuery2.FieldByName('banzunum').AsString := Edit2.Text;
      ADOQuery2.FieldByName('name').AsString := listbox2.Items[I];
      ADOQuery2.FieldByName('id').AsString := listbox3.Items[H];
      ADOQuery2.FieldByName('permission').AsString := '0';
      ADOQuery2.Post;
      Listbox1.Items.Add(listbox2.Items[I]);
    end;
  except
  //Ϊ�쳣������Try..except..end����
  end;
  Edit1.Enabled := False;
end;

procedure TForm4.SpeedButton8Click(Sender: TObject);
Var
  I :Integer;
begin
  {�������}
  if Application.MessageBox('ȷ�ϱ���?','��ʾ',MB_YESNO) = IDYES then
    begin
      //��������
      ADOQuery2.SQL.Text := 'select *from banzu where banzunum like '+''''+'%'+Trim(Edit2.Text)+'%'+'''';
      ADOQuery2.Open;
      try
        for I := 1 to ADOQuery2.RecordCount do
          begin
            ADOQuery2.RecNo := I;
            ADOQuery2.Edit;
            ADOQuery2.FieldByName('banzuname').AsString := Edit1.Text;
            ADOQuery2.Post;
          end;
        ADOQuery2.SQL.Text := 'Select *From banzu';
        ADOQuery2.Active := True;
      except
        //Ϊ�쳣������Try..except..end����
      end;
    end
  else
    begin
      ADOQuery2.Cancel;
    end;
  Edit1.Text := '';
  BtnEnAble(Sender);
end;

procedure TForm4.SpeedButton9Click(Sender: TObject);
begin
  {ȡ������}
  try
    ADOQuery2.Cancel;
    BtnEnAble(Sender);
  except
    //Ϊ�쳣������Try..except..end����
  end;
end;

end.
