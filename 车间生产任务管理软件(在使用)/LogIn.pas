unit LogIn;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Buttons;

type
  TForm1 = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    Edit1: TEdit;
    Edit2: TEdit;
    procedure Checkmodel1(Sender: TObject);
    procedure Checkmodel2(Sender: TObject);
    procedure Checkmodel3(Sender: TObject);
    procedure checkmodel4(Sender: TObject);
    procedure checkmodel5(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ReadFirst(Sender: TObject);
    procedure OpenADOConn(HostName: string; DatabaseName: string;
                         UserID: string; UserPWD: string);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
//调用其他单元
Uses
  Product,Process,Banzu,Human,PrintExcel,Log,Password;

{$R *.dfm}

//ADOConnection数据库连接函数
procedure TForm1.OpenADOConn(HostName: string; DatabaseName: string; UserID: string; UserPWD: string);
begin
  with ADOConnection1 do
    begin
      Connected:= false;                                  //若有连接，先使连接断开
      Provider:= 'MSDASQL.1';
      Properties['Data Source'].Value:= HostName;         //服务器名或者ip地址
      Properties['Initial Catalog'].Value:= DatabaseName; //表名
      Properties['User ID'].Value:= UserID;               //用户名
      Properties['password'].Value:= UserPWD;             //密码
      LoginPrompt:= false;
      try
        Connected:= true;
        Showmessage('远程数据库连接成功!');
      except
        begin
          Application.MessageBox('无法连结远程数据库,请确定网络正常后重试！','注意', MB_OK);
          close;
        end;
      end;
    end;
end;

//判断方法，程序是否是第一次使用
procedure TForm1.ReadFirst(Sender: TObject);
Var
   F :Textfile;
   Promission: String;
   TmpStrs: Tstrings;
begin
  //查找根目录下Promission.txt文件————权限信息'0'为第一次使用
  AssignFile(F, ExtractFilePath(ParamStr(0)) + 'Promission.txt');
  Reset(F);
  Readln(F,Promission);
  Closefile(F);
  //判断是否是第一次使用软件
  if Promission = '0' then
    begin
      Showmessage('检测到为第一次打开软件，请注册软件使用用户名和密码');
      Speedbutton3.Visible := True;
      Form1.Height := 235;
      try
        //执行文本操作，将Promission.txt中'0'更改为'1'
        TmpStrs:=Tstringlist.Create;
        TmpStrs.Add('1');
        TmpStrs.SavetoFile(ExtractFilePath(ParamStr(0))+'Promission.txt');
        TmpStrs.Free;
      except
        Showmessage('未找到注册文件！');
      end;
    end
  else
    begin
      //清空编辑框文本信息
      Edit1.Text := '';
      Edit2.Text := '';
      Edit1.Tabstop := False;
      Edit2.Tabstop := False;
    end;
end;

//以下CheckModel*为数据库建表
procedure TForm1.Checkmodel1(Sender: TObject);
begin
  {登录选项密码PASSWORD}
  try
    ADOQuery1.SQL.Text := 'Select *From password';
    ADOQuery1.Active := True;
  except
    ADOQuery1.SQL.Text := 'Create Table password(name VarChar(20) Primary Key,password VarChar(20))';
    ADOQuery1.ExecSQL;
    //插入000000,123456以便登录
    ADOQuery1.SQL.Text := 'Insert Into password Values(' + #39 + '000000' + #39 +','+ #39 + '123456' + #39 + ')';
    ADOQuery1.ExecSQL;
  end;
end;

procedure TForm1.Checkmodel2(Sender: TObject);
begin
  {员工基本信息表}
  try
    ADOQuery1.SQL.Text := 'Select *From human';
    ADOQuery1.Active := True;
  except
    ADOQuery1.SQL.Text := 'Create Table human(name VarChar(1000),id VarChar(1000),telephone VarChar(1000),'
                                                        +'profession VarChar(1000),level VarChar(1000),'          //profession-工种，level-级别
                                                        +'permission VarChar(1000),I Int Auto_Increment Primary Key)';
    ADOQuery1.ExecSQL;
  end;
end;

procedure TForm1.Checkmodel3(Sender: TObject);
begin
  {任务工艺表}
  try
    ADOQuery1.SQL.Text := 'Select *From product';
    ADOQuery1.Active := True;
  except
    ADOQuery1.SQL.Text := 'Create Table product(proserial VarChar(1000),proname VarChar(1000),procheck VarChar(100),'
                                                          +'taifennum VarChar(100),partsname VarChar(100),fignum VarChar(100),'
                                                          +'material VarChar(100),techtype VarChar(100),plansta VarChar(100),'
                                                          +'planfin VarChar(100),reallsta VarChar(100),reallfin VarChar(100),'
                                                          +'number VarChar(100),remark VarChar(100),I Int Auto_Increment Primary Key)';
    ADOQuery1.ExecSQL;
  end;
end;

procedure TForm1.checkmodel4(Sender: TObject);
begin
  {日志表}
  try
    ADOQuery1.SQL.Text := 'Select *From rz';
    ADOQuery1.Active := True;
  except
    ADOQuery1.SQL.Text := 'Create Table rz(proname VarChar(1000),taifennum VarChar(1000),partsname VarChar(1000),'
                                                  +'fignum VarChar(1000),procheck VarChar(1000),'
                                                  +'prostatime VarChar(1000),profintime VarChar(1000),'
                                                  +'I Int Auto_Increment Primary Key)';
    ADOQuery1.ExecSQL
  end;
end;

procedure TForm1.checkmodel5(Sender: TObject);
begin
  {班组表}
  try
    ADOQuery1.SQL.Text := 'Select *From banzu';
    ADOQuery1.Active := True;
  except
    ADOQuery1.SQL.Text := 'Create Table banzu(banzuname VarChar(100),banzunum VarChar(100),name VarChar(100),'
                                                  +'id VarChar(100),permission VarChar(100),I Int Auto_Increment Primary Key)';
    ADOQuery1.ExecSQL
  end;
end;

//窗体创建
procedure TForm1.FormCreate(Sender: TObject);
Var
   F : Textfile;
   IP : String;
   Database : String;
   User_Name : String;
   User_Password : String;
begin
  //调整窗体位置和大小
  Form1.Position := poScreenCenter;
  Form1.Width := 400;
  Form1.Height := 200;
  //查找根目录下Config.txt文件-ODBC数据库信息
  AssignFile(F, ExtractFilePath(ParamStr(0)) + 'Config.txt');
  Reset(F);
  Readln(F, IP);
  Readln(F, Database);
  Readln(F, User_Name);
  Readln(F, User_Password);
  Closefile(F);
  //将文本信息取出来，调用procedure执行SQL连接
  OpenADOConn(IP,Database,User_Name,User_Password);
  {调用第一次软件使用ReadFrist}
  ReadFirst(Sender);
  try
    Checkmodel1(Sender);
    Checkmodel2(Sender);
    Checkmodel3(Sender);
    Checkmodel4(Sender);
    checkmodel5(Sender);
  except
    ShowMessage('建表出错，请联系工程人员！');
  end;
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  I: Integer;
begin
  {登录按钮}
  try
    //查找登录密码表
    ADOQuery1.SQL.Text := 'Select *From password';
    ADOQuery1.Open;
    //使用遍历的方法进行判断，账号密码是否正确
    for I := 1 to ADOQuery1.RecordCount do
      begin
        ADOQuery1.RecNo := I;
        if (ADOQuery1.FieldByName('name').AsString = Edit1.Text) and (ADOQuery1.FieldByName('password').AsString = Edit2.Text) then
          begin
            Edit1.Text := '';
            Edit2.Text := '';
            Form2.Position := PoScreenCenter;
            Form2.ShowModal;
          end
        else
          begin
            Showmessage('账号密码错误，请重新输入！');
            Exit;
          end;
      end;
  except
    Showmessage('数据库连接失败，请关闭系统重试！');
  end;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  {退出按钮}
  Close;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  {登录注册按钮}
  Form8.Position := PoScreenCenter;
  Form8.ShowModal;
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  {退出系统}
  if Application.MessageBox('确认退出系统','提示',mb_YesNo)=IDYes then
    begin
      CanClose := True;
    end
  else
    CanClose := False;
end;
end.
