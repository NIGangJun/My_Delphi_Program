unit PrintExcel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Data.Win.ADODB, Data.DB,ComObj,clipbrd;

type
  TForm6 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Button1: TButton;
    ComboBox1: TComboBox;
    Button2: TButton;
    ComboBox2: TComboBox;
    Button3: TButton;
    ComboBox3: TComboBox;
    DBGrid1: TDBGrid;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    Button4: TButton;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    procedure ADOConnect(Sender: TObject);
    procedure DBGridExport(GRID:TDBGRID);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure ComboBox4Click(Sender: TObject);
    procedure ComboBox5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation
//����������Ԫ
Uses
  LogIn,Product;
{$R *.dfm}

procedure TForm6.ADOConnect(Sender: TObject);
var
  I: Integer;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'Select *From product';
  ADOQuery1.Open;
  //ComboBox1(������ӡ)���
  ComboBox1.Clear;
  ComboBox1.Items.Add('��������');
  //ComboBox2,3(���򣬰�����ӡ)���
  ComboBox2.Clear;
  ComboBox3.Clear;
  ComboBox4.Clear;
  ComboBox5.Clear;
  for I := 1 to ADOQuery1.RecordCount do
    begin
      ADOQuery1.RecNo := I;
      ComboBox2.Items.Add(ADOQuery1.FieldByName('proname').AsString+'������');
      ComboBox4.Items.Add(ADOQuery1.FieldByName('proserial').AsString);
      ComboBox3.Items.Add(ADOQuery1.FieldByName('proname').AsString+'�������');
      ComboBox5.Items.Add(ADOQuery1.FieldByName('proserial').AsString);
    end;
  ComboBox6.Clear;
  ComboBox6.Items.Add('��־��');
end;

procedure TForm6.DBGridExport(GRID:TDBGRID);
var       //DBGRID�ؼ����ݴ洢��EXCEL ֻ�е�һ���б���
  EclApp:Variant;
  XlsFileName:String;
  sh:olevariant;
  i,j:integer;
  s:string;
  savedailog:TSaveDialog;
begin
   savedailog:=TSaveDialog.Create(Self);
   savedailog.Filter:='Excel files (*.xls)|*.XlS';
   if savedailog.Execute then begin
        xlsfilename:=savedailog.FileName;
        savedailog.Free;
     end
   else begin
      savedailog.Free;
      exit;
   end;
   try
      eclapp:=createOleObject('Excel.Application');
      sh:=CreateOleObject('Excel.Sheet');
   except
      showmessage('���Ļ�����δ��װMicrosoft Excel��');
      exit;
   end;
   try
      sh:=eclapp.workBooks.add;
      With Grid.DataSource.DataSet do begin
        First;
        i:=GRID.FieldCount-1;
        j:=i div 26;
        s:='';
        if j>0 then s:=s+chr(64+j);
        for i:=0 to grid.FieldCount-1  do begin
           if grid.Fields[i].Visible then begin
              eclapp.cells[2,i+1]:=grid.Fields[i].DisplayName;
              if GRID.Fields[i].DisplayWidth>80 then
                 eclapp.columns[i+1].Columnwidth:=80
              else
                 eclapp.columns[i+1].Columnwidth:=GRID.Fields[i].DisplayWidth+0.3;
              eclapp.cells[2,i+1].Font.Color:=clRed;
           end;
        end;
        for i:=1 to RecordCount do begin
            for j:=0 to grid.FieldCount-1 do
              if grid.Fields[j].Visible then
                 if GRID.Fields[j].DisplayText>'' then begin
                   eclapp.cells[i+2,j+1]:=grid.Fields[j].DisplayText;
                 end;
            Next;
        end;
     end;
      sh.saveas(xlsfilename);
      sh.close;
      eclapp.quit;
      ShowMessage('��� Excel �ļ������...');
   except
      showmessage('Excelϵͳ��������');
      sh.close;
      eclapp.quit;
      exit;
   end;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
  ADOConnect(Sender);
end;

procedure TForm6.Button1Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'Select proserial AS ��ˮ��,proname as ������,taifennum as ����̨�ݺ�,partsname as ��������,'
                              +'fignum as ����ͼ��,material as ��������,number as ��������,techtype as ��������,'
                              +'plansta as ����ƻ���ʼʱ��,reallsta as ����ʵ�ʿ�ʼʱ��,planfin as ����ƻ����ʱ��,'
                              +'reallfin as ����ʵ�����ʱ��,procheck as �������״̬,remark as ��ע��Ϣ From product';
  ADOQuery1.Active := True;
  self.DBGridExport(DBgrid1);
end;

procedure TForm6.Button2Click(Sender: TObject);
Var
  CessID:String;
begin
  CessID:=copy(ComboBox4.Text,3,3);
  //Showmessage(CessID);
  try
    ADOQuery1.Close;
    ADOQuery1.SQL.Text := 'Select serialcess as ������ˮ��,numcess as�����,namecess as ������,arragecess as ��������,'
                                  +'figcess as ����ͼ��,frockcess as ����װ,plansta as ����ƻ���ʼʱ��,'
                                  +'planfin as ����ƻ����ʱ��,reallsta as ����ʵ�ʿ�ʼʱ��,'
                                  +'reallfin as ����ʵ�����ʱ��,number as ������,remark as ��ע��Ϣ From process'+CessID;
    ADOQuery1.Active := True;
    self.DBGridExport(DBgrid1);
  except

  end;

end;

procedure TForm6.Button3Click(Sender: TObject);
Var
  BanzuID:String; //����ID
begin
  BanzuID:=copy(ComboBox5.Text,3,3);
  try
    ADOQuery1.Close;
    ADOQuery1.SQL.Text := 'Select banzunum as �����,banzuname as ������,name as Ա����,id as Ա����,permission as Ȩ�� From banzu';
    ADOQuery1.Active := True;
  except
    showmessage('��ѡ��ı�Ϊ�ձ�������ѡ��');
  end;
  self.DBGridExport(DBgrid1);
end;

procedure TForm6.Button4Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'Select proname as ������,processnum as �����¹�����,profinish as ����������,prostatime as ����ʼʱ��,profintime as �������ʱ�� From rz';
  ADOQuery1.Active := True;
  self.DBGridExport(DBgrid1);
end;

procedure TForm6.ComboBox2Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'Select *From product';
  ADOQuery1.Open;
  ComboBox4.ItemIndex := ComboBox2.ItemIndex;

end;

procedure TForm6.ComboBox3Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text := 'Select *From product';
  ADOQuery1.Open;
  ComboBox5.ItemIndex := ComboBox3.ItemIndex;
end;

procedure TForm6.ComboBox4Click(Sender: TObject);
begin
  ComboBox2.ItemIndex := ComboBox4.ItemIndex;
end;

procedure TForm6.ComboBox5Click(Sender: TObject);
begin
  ComboBox3.ItemIndex := ComboBox5.ItemIndex;
end;

end.
