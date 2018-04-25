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
    procedure SpeedButton1Click(Sender: TObject);                                     //ComboBox添加数据
    Function BMID():String;
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure BtnEnAble(Sender: TObject);
    procedure BtnDisAble(Sender: TObject);
    procedure PeopleAll(Sender: TObject);  //显示员工姓名
    procedure IDAll(Sender: TObject);      //显示员工id
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
//调用其他单元
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

//按钮使能
procedure TForm4.BtnEnAble(Sender: TObject);
begin
  {除了保存取消按钮，其余的都使能}
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

//双击dbgrid在listbox中显示班组人员
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

//取消按钮使能
procedure TForm4.BtnDisAble(Sender: TObject);
begin
  {除了保存取消按钮，其余的都取消使能}
  SpeedButton2.Enabled := False;
  SpeedButton3.Enabled := False;
  SpeedButton8.Enabled := True;
  SpeedButton9.Enabled := True;
  Edit1.Enabled := True;
end;

//班组对应人员子表
procedure TForm4.BanZuMiniTbale(Sender: TObject);
begin

end;

//自动编码班组流水号
Function TForm4.BMID():String;
Var
  Num:String;
  L:Integer;
begin
  ADOquery2.Last;                                                              //需要指向最后一条记录
  if ADOQuery2.FieldByName('banzunum').Value=NULL then
    begin
      Num := '001';
    end
  else
    begin                                             //任务号前两位取出，将后四位进行赋值加1
      L := strtoint(ADOQuery2.FieldByName('banzunum').Value);         //先取出后三位值转化为int型，循环变量+1后，再转化为str
      L := L + 1;                                                              //并赋值，通过while...do执行位数的上加
      Num := inttostr(L);
      while Length(Num)<3 do                        //自动加'0'
        begin
          Num := '0' + Num
        end;
    end;
  Result := Num;
end;

//窗体显示
procedure TForm4.FormShow(Sender: TObject);
begin
  //遍历任务表取出所有任务和任务id到两个下拉框
  try
    ADOQuery2.SQL.Text :='Select *From banzu';
    ADOQuery2.Active := True;
    //ADOQuery1.Close;
    BtnEnAble(Sender);
    PeopleAll(Sender);
    IDAll(Sender);
  except
  //为异常，特作Try..except..end处理
  end;
end;

procedure TForm4.SpeedButton1Click(Sender: TObject);
Var
  BanzuID: String;
begin
  {新增班组}
  try
    BanzuID := BMID();
    if Edit1.Text = '' then
      begin
        Showmessage('输入班组名');
      end;
    Edit1.Enabled := True;
    Edit1.SetFocus;
    Edit2.Text := BanzuID;
  except
  //为异常，特作Try..except..end处理
  end;
  listbox1.Clear;
end;

procedure TForm4.SpeedButton2Click(Sender: TObject);
begin
  {修改}
  try
    if ADOQuery2.RecordCount < 1 then
      begin
        Showmessage('当前班组表中未有班组，修改失败！');
      end
    else
      begin
        Edit1.Text := ADOQuery2.FieldByName('banzuname').AsString;
        Edit2.Text := ADOQuery2.FieldByName('banzunum').AsString;
        if Edit1.Text = '' then
          begin
            Showmessage('请输入班组名');
          end
        else
          begin
            ADOQuery2.Edit;
          end;
      end;
    BtnDisAble(Sender);
  except
  //为异常，特作Try..except..end处理
  end;

end;

procedure TForm4.SpeedButton3Click(Sender: TObject);
Var
  I: Integer; //获取班组号id
  BanzuName:String;//获取到指向当前班组表的班组名
  //以下为类型转换： String转为PWideChar
  ws:widestring;
  pws:pwidechar;
begin
  {删除}
  BanzuName := DBGrid1.Fields[1].AsString;
  ws :=  '确认删除    '+BanzuName+'   班组';
  pws :=  pwidechar(WS);
  if Application.MessageBox(pws,'警告',MB_YESNO) = IDYES then
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
      //为异常，特作Try..except..end处理
        Showmessage('删除异常');
      end;
    end;
end;

procedure TForm4.SpeedButton4Click(Sender: TObject);
Var
  I:integer;
begin
  {移除列表员工}
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
  //为异常，特作Try..except..end处理
  end;
end;

procedure TForm4.SpeedButton5Click(Sender: TObject);
var
  I: Integer;
  H: integer;
  C:  array of String;    //定义数组变量
  L: Integer;
  G: Integer;
begin
  {逐个添加列表员工}
  try
  //定义数组长度
  SetLength(C,listbox1.Items.Count);
  for L := 0 to listbox1.Items.Count - 1 do
    begin
      C[L]:= Listbox1.Items[L];
    end;
  //清除表人员
  Listbox1.Items.Clear;
  for G := 0 to high(C) do
    begin
     Listbox1.Items.Add(C[G]);
    end;
  //新增到数据表
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
  //为异常，特作Try..except..end处理
  end;
  Edit1.Enabled := False;
end;

procedure TForm4.SpeedButton6Click(Sender: TObject);
var
  I: Integer;
begin
  {全部移除}
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
  //为异常，特作Try..except..end处理
  end;
end;

procedure TForm4.SpeedButton7Click(Sender: TObject);
var
  //给人员库两个listbox定义数量
  I: Integer;
  H: Integer;
begin
  {全部添加按钮}
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
  //为异常，特作Try..except..end处理
  end;
  Edit1.Enabled := False;
end;

procedure TForm4.SpeedButton8Click(Sender: TObject);
Var
  I :Integer;
begin
  {保存操作}
  if Application.MessageBox('确认保存?','提示',MB_YESNO) = IDYES then
    begin
      //遍历操作
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
        //为异常，特作Try..except..end处理
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
  {取消操作}
  try
    ADOQuery2.Cancel;
    BtnEnAble(Sender);
  except
    //为异常，特作Try..except..end处理
  end;
end;

end.
