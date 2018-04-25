unit Product;

interface

uses
  Vcl.printers,Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Data.DB, Data.Win.ADODB, Vcl.ComCtrls, Vcl.Buttons, Vcl.DBCtrls,
  Vcl.Mask,Code39,BARCODELib_TLB;

type
  TForm2 = class(TForm)
    Label1: TLabel;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Button1: TButton;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit6: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    Panel3: TPanel;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit8: TEdit;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    ADOQuery3: TADOQuery;
    Label15: TLabel;
    Label18: TLabel;
    SpeedButton13: TSpeedButton;
    Label20: TLabel;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    procedure BtnEnAble(Sender: TObject);
    procedure BtnDisAble(Sender: TObject);
    procedure EnAble(Sender: TObject);
    procedure DisAble(Sender: TObject);
    Function BMID():String;
    Function NowdayTime():String;
    procedure BtnCopy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CessTable(Sender: TObject);                                      //创建工序表
    procedure BanzuTable(Sender: TObject);                                     //创建班组表
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure ClearEdit(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure xpdy;
    procedure SetPaperHeight(Value:integer);
    procedure SpeedButton12Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure BtnPaste(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure SpeedButton13Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
//调用其他单元
Uses
  LogIn,Process,Banzu,Human,PrintExcel,Log,Password;

{$R *.dfm}

//按钮使能
procedure TForm2.BtnEnAble(Sender: TObject);
begin
  {除了保存取消按钮，其余的都使能}
  Button1.Enabled := True;
  SpeedButton1.Enabled := True;
  SpeedButton2.Enabled := True;
  SpeedButton5.Enabled := True;
  SpeedButton6.Enabled := True;
  SpeedButton7.Enabled := True;
  SpeedButton8.Enabled := True;
  SpeedButton9.Enabled := True;
  SpeedButton10.Enabled := True;
  SpeedButton11.Enabled := True;
  SpeedButton12.Enabled := True;
  SpeedButton3.Enabled := False;
  SpeedButton4.Enabled := False;
end;

//取消按钮使能
procedure TForm2.BtnDisAble(Sender: TObject);
var
  I: Integer;
begin
  {除了保存取消按钮，其余的都取消使能}
  Button1.Enabled := False;
  SpeedButton1.Enabled := False;
  SpeedButton2.Enabled := False;
  SpeedButton5.Enabled := False;
  SpeedButton6.Enabled := False;
  SpeedButton7.Enabled := False;
  SpeedButton8.Enabled := False;
  SpeedButton9.Enabled := False;
  SpeedButton10.Enabled := False;
  SpeedButton11.Enabled := False;
  SpeedButton12.Enabled := False;
  SpeedButton3.Enabled := True;
  SpeedButton4.Enabled := True;
  for I := 0 to Self.ComponentCount - 1 do
    begin
      if Self.Components[I] is TDBEdit then
        begin
          ((Self.Components[I]) as TDBEdit).Enabled := False;
        end;
    end;
end;

//使能Edit控件
procedure TForm2.EnAble(Sender: TObject);
var
  I:integer;
begin
  for i:=0 to Self.Componentcount - 1   do
    begin
      if Self.Components[I] is TEdit then
        begin
          ((Self.Components[I]) as TEdit).Enabled := True;
        end;
    end;
  Edit1.Enabled := False;
  DateTimePicker1.Enabled := True;
  DateTimePicker2.Enabled := True;
  DBMemo1.Enabled := True;
end;

//取消Edit控件使能属性
procedure TForm2.DisAble(Sender: TObject);
var
  I:integer;
begin
  for i:=0 to Self.Componentcount - 1   do
    begin
      if Self.Components[I] is TEdit then
        begin
          ((Self.Components[I]) as TEdit).Enabled := False;
        end;
    end;
  DateTimePicker1.Enabled := False;
  DateTimePicker2.Enabled := False;
  DBMemo1.Enabled := False;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Show;
end;

//窗体显示
procedure TForm2.FormShow(Sender: TObject);
begin
  DisAble(Sender);
  DatetimePicker1.date:=now;
  DatetimePicker2.date:=now;
  ADOQuery1.SQL.Text := 'Select *From product';
  ADOQuery1.Active := True;
end;

//自动编码任务流水号
Function TForm2.BMID():String;
Var
  L:Integer;
  S:String;
  Num:String;
begin
  ADOquery1.Last;                                                              //需要指向最后一条记录
  if ADOquery1.FieldByName('proserial').Value=NULL then                           //判断是否为空，如果是，新建**001记录
    begin
      Num:=nowdaytime()+'001';
    end
  else
    begin
      L := strtoint(copy(ADOquery1.FieldByName('proserial').Value,3,3));         //先取出后三位值转化为int型，循环变量+1后，再转化为str
      L := L + 1;                                                              //并赋值，通过while...do执行位数的上加
      S := inttostr(L);
      while Length(S)<3 do                        //自动加'0'
        begin
          S := '0' + S
        end;
      Num := nowdaytime() + S;
    end;
  Result := Num;
end;

//提取系统当前月份
Function TForm2.Nowdaytime():String;
var
  sMonth:string;                                                            //需要用到System.SysUtils单元
begin
  sMonth := FormatDateTime('mm',Now);
  result:=sMonth;
end;

//传值到DBEdit进行保存
procedure TForm2.BtnCopy(Sender: TObject);
begin
  DBEdit1.Text := Edit1.Text ;
  DBEdit2.Text := Edit2.Text ;
  DBEdit3.Text := Edit3.Text ;
  DBEdit4.Text := Edit4.Text ;
  DBEdit5.Text := Edit5.Text ;
  DBEdit6.Text := Edit6.Text ;
  DBEdit8.Text := Edit8.Text ;
  DBEdit9.Text := FormatdateTime('yyyy-MM-dd HH',DateTimePicker1.Date);
  DBEdit11.Text := FormatdateTime('yyyy-MM-dd HH',DateTimePicker2.Date);
end;


//将DBEdit值取出保存
procedure TForm2.BtnPaste(Sender: TObject);
begin
  Edit1.Text := DBEdit1.Text;
  Edit2.Text := DBEdit2.Text;
  Edit3.Text := DBEdit3.Text;
  Edit4.Text := DBEdit4.Text;
  Edit5.Text := DBEdit5.Text;
  Edit6.Text := DBEdit6.Text;
  Edit8.Text := DBEdit8.Text;
end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  {注销按钮}
  if Application.MessageBox('确定注销？','提示',MB_YESNO) = IDYES then
    begin
      Form2.Close;
      Form1.Position := poScreenCenter;
      Form1.Show;
    end;
end;

//每次保存后清除Edit信息
procedure TForm2.ClearEdit(Sender: TObject);
var
  I:integer;
begin
  for i:=0 to Self.Componentcount - 1   do
    begin
      if Self.Components[I] is TEdit then
        begin
          ((Self.Components[I]) as TEdit).Text := '';
        end;
    end;
end;

procedure TForm2.SpeedButton1Click(Sender: TObject);
Var
  Txt: String;
begin
  {新增}
  Txt := BMID();
  BtnDisAble(Sender);
  EnAble(Sender);
  Panel1.Enabled := False;
  //设置Edit2的焦点
  Edit2.SetFocus;
  ADOQuery1.Append;
  Edit1.Text := Txt;
end;

procedure TForm2.SpeedButton2Click(Sender: TObject);
begin
  {修改}
  ADOQuery1.Refresh;
  BtnPaste(Sender);
  BtnDisAble(Sender);
  EnAble(Sender);
  Panel1.Enabled := False;
  Edit2.SetFocus;
  ADOQuery1.Edit;
end;

procedure TForm2.SpeedButton3Click(Sender: TObject);
begin
  {保存}
  if Application.MessageBox('确认无误，是否保存？','提示',MB_YESNO) = IDYES then
    begin
      BtnCopy(Sender);
      ADOQuery1.FieldByName('number').AsString := '1';
      ADOQuery1.Post;
      BtnEnAble(Sender);
      DisAble(Sender);
      Panel1.Enabled := True;
      try
        CessTable(Sender);
      except
        Showmessage('数据拉取失败，请联系工程人员！');
      end;
    end;
  ClearEdit(Sender);
end;

procedure TForm2.SpeedButton4Click(Sender: TObject);
begin
  {取消}
  BtnEnAble(Sender);
  DisAble(Sender);
  Panel1.Enabled := True;
  ADOQuery1.Cancel;
end;

procedure TForm2.SpeedButton5Click(Sender: TObject);
Var
  DuctID: String;//取得任务ID后三位进行查表
  CessID: String;
  I: Integer;
begin
  {删除}
  if Application.MessageBox('当前操作会删除此条任务对应工序表和相关工序子表，确认是否删除？','警告',MB_YESNO) = IDYES then
    begin
      try
        DuctID := Copy(ADOQuery1.FieldByName('proserial').AsString,3,3);
        ADOQuery2.SQL.Text := 'Select *From process'+DuctID;
        ADOQuery2.Open;
        //判断工序表中是否有数据
        if ADOQuery2.RecordCount < 1 then
          begin
            Showmessage('当前任务中并未有相关工序，此操作只删除当前任务以及对应工序表！');
            ADOQuery2.SQL.Text := 'Drop Table process' + DuctID;
            ADOQuery2.ExecSQL;
          end
        else
          begin
            //遍历工序表，找到工序表中流水号，依据流水号删除工序对应子表
            for I := 1 to ADOQuery2.RecordCount do
              begin
                ADOQuery2.RecNo := I;
                CessID := Copy(ADOQuery2.FieldByName('serialcess').AsString,4,3);
                try
                  ADOQuery3.SQL.Text := 'Drop Table process' + DuctID;
                  ADOQuery3.ExecSQL;
                except

                end;
              end;
            ADOQuery2.SQL.Text := 'Drop Table process' + DuctID;
            ADOQuery2.ExecSQL;
          end;
      except

      end;
      ADOQuery1.Delete;
    end;
end;

//创建工序表
procedure TForm2.CessTable(Sender: TObject);
Var
  DuctID: String;//取得任务ID后三位进行工序动态建表
begin
  //取得任务ID后三位
  DuctID := Copy(ADOQuery1.FieldByName('proserial').AsString,3,3);
  //使用ADOQuery2动态建表——process（任务序号）
  try
    ADOQuery2.SQL.Text :='Select *From process'+DuctID;
    ADOQuery2.Active := True;
  except
    ADOQuery2.SQL.Text :='Create Table process'+DuctID+'(serialcess VarChar(100),numcess VarChar(100),'
                                              +'namecess VarChar(100),arragecess VarChar(100),figcess VarChar(100),'
                                              +'frockcess VarChar(100),plansta VarChar(100),'
                                              +'banzuname VarChar(100),banzunum VarChar(100),'
                                              +'planpeo VarChar(100),reallpeo VarChar(100),checkcess varchar(100),'
                                              +'planfin VarChar(100),reallsta VarChar(100),reallfin VarChar(100),'
                                              +'number VarChar(10),remark VarChar(100),I Int auto_increment PRIMARY KEY)';
    ADOQuery2.ExecSQL;
  end;
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TForm2.BanzuTable(Sender: TObject);
begin

end;

//让DBGrid显示数据
procedure TForm2.DBGrid1DblClick(Sender: TObject);
Var
  DuctID: String;//取得任务ID后三位进行工序动态建表
begin
  //取得任务ID后三位
  DuctID := Copy(ADOQuery1.FieldByName('proserial').AsString,3,3);
  try
    //选择工序表
    ADOQuery2.SQL.Text :='Select *From process'+DuctID;
    ADOQuery2.Active := True;
    Label15.Caption := ADOQuery1.FieldByName('proserial').AsString;
    Label18.Caption := ADOQuery1.FieldByName('proname').AsString;
  except
    Showmessage('当前没有工序表，需要点击"工序管理"按钮进行创建！');
  end;

end;

//DBGrid着色
procedure TForm2.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (ADOQuery1.FieldByName('reallfin').AsString = '') or (ADOQuery1.FieldByName('reallfin').Value = NULL) then
    begin
      DbGrid1.Canvas.Brush.color:=clred;
      DbGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    end
  else
    begin
      DbGrid1.Canvas.Brush.color:=clGreen;
      DbGrid1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    end;
end;

procedure TForm2.DBGrid2DblClick(Sender: TObject);
Var
  DuctID: String;//取得任务ID后三位进行工序动态建表
begin
  //取得任务ID后三位
  DuctID := Copy(ADOQuery1.FieldByName('proserial').AsString,3,3);
  try
    ADOQuery2.SQL.Text :='Select *From process'+DuctID;
    ADOQuery2.Active := True;
    Label15.Caption := ADOQuery1.FieldByName('proserial').AsString;
    Label18.Caption := ADOQuery1.FieldByName('proname').AsString;
  except
    Showmessage('当前没有工序表，需要点击"工序管理"按钮进行创建！');
  end;
end;

procedure TForm2.DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  {DBGrid着色}
  if (ADOQuery2.FieldByName('checkcess').AsString = '检验不合格') then
    begin
      DbGrid2.Canvas.Brush.color:=clRed;
      DbGrid2.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    end
  else if (ADOQuery2.FieldByName('checkcess').AsString = '检验合格') then
    begin
      DbGrid2.Canvas.Brush.color:=clGreen;
      DbGrid2.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    end
  else if (ADOQuery2.FieldByName('reallfin').AsString <> '') then
    begin
      DbGrid2.Canvas.Brush.color:=clYellow;
      DbGrid2.DefaultDrawColumnCell(Rect,DataCol,Column,State);
    end;
end;

procedure TForm2.SpeedButton6Click(Sender: TObject);
begin
  {工序管理按钮}
  try
    if ADOQuery1.RecordCount < 1 then
      begin
        Showmessage('请先创建任务！');
      end
    else
      begin
        Form3.Position := PoScreenCenter;
        Form3.ShowModal;
      end;
  except
      //异常处理
  end;
end;

procedure TForm2.SpeedButton7Click(Sender: TObject);
begin
  {班组管理按钮}
  Form4.Position := PoScreenCenter;
  Form4.ShowModal;
end;

procedure TForm2.SpeedButton8Click(Sender: TObject);
begin
  {员工信息录入按钮}
  Form5.Position := PoScreenCenter;
  Form5.ShowModal;
end;

procedure TForm2.SpeedButton9Click(Sender: TObject);
begin
  {Excel打印按钮}
  Form6.Position := PoScreenCenter;
  Form6.ShowModal;
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  if Checkbox1.Checked = True then
    begin
      ADOQuery1.Close;
      ADOQuery1.Open;
    end
  else
    begin
      timer1.Enabled := False;
    end;
end;

procedure TForm2.SpeedButton10Click(Sender: TObject);
Var
  I:INteger;
begin
  {条码打印}
  try
    for I := 1 to ADOQuery1.RecordCount  do
      begin
        ADOQuery1.RecNo := I;
        Self.xpdy;
      end;
  except
    showmessage('打印异常，请关掉窗口重试。或联系开发人员！');
  end;

end;

procedure TForm2.SpeedButton11Click(Sender: TObject);
begin
  {日志记录按钮}
//  Form7.Position := PoScreenCenter;
//  Form7.ShowModal;
  Application.MessageBox('当前功能尚未完成,将在下个版本发布','提示',MB_OK)
end;

procedure TForm2.SpeedButton12Click(Sender: TObject);
begin
  {登录注册按钮}
  Form8.Position := PoScreenCenter;
  Form8.ShowModal;
end;

procedure TForm2.SpeedButton13Click(Sender: TObject);
var
  Str:String;
  I: Integer;
begin
  try
    Str := InputBox('条码打印','请输入打印分数','');
    for I := 1 to strtoint(str) do
      begin
        self.xpdy;
      end;
  except
     //异常处理
  end;
end;

procedure TForm2.xpdy;                                                         //打印机
begin
  setpaperHeight(200);
  printer.BeginDoc;
  printer.Canvas.Font.Name:='Courier 10Cpi';
  printer.Canvas.Font.Size:=10;
  printer.Canvas.Font.Style:=[fsBold];
  printer.Canvas.TextOut(0,10,'        任务单');
  printer.EndDoc;
  printer.BeginDoc;
  printer.Canvas.Font.Name:='Courier 10Cpi';
  printer.Canvas.TextOut(0,0,'                                              ');
  printer.Canvas.Font.Size:=8;
  printer.Canvas.Font.Style:=[fsBold];
  printer.Canvas.TextOut(0,10,'任务名：'+DBEdit2.Text);
  printer.Canvas.Font.Style:=[];
  printer.Canvas.TextOut(0,35,'         ');
  printer.Canvas.TextOut(0,60,'台份号：'+DBEdit3.Text);
  printer.Canvas.TextOut(0,85,'部件名称：'+DBEdit4.Text);
  printer.Canvas.TextOut(0,110,'部件图号：'+DBEdit5.Text);
  printer.Canvas.TextOut(0,135,'部件材质：'+DBEdit6.Text);
  printer.Canvas.TextOut(0,160,'工艺类型：'+DBEdit8.Text);
  printer.Canvas.TextOut(0,185,'                                              ');
  printer.Canvas.Draw(100,205,getBMP(DBEdit1.Text));
  printer.Canvas.Font.Size:=10;
  printer.Canvas.Font.Style:=[fsBold];
  printer.Canvas.TextOut(0,300,'---------------------------------------------');
  printer.EndDoc;
end;

procedure TForm2.SetPaperHeight(Value:integer);                                //设置打印纸高度
var
  Device:array[0..255] of char;
  Driver:array[0..255] of char;
  Port:array[0..255] of char;
  hDMode:THandle;
  PDMode:PDEVMODE;
begin
  printer.PrinterIndex:=-1;
  printer.GetPrinter(Device,Driver,Port,hDMode);
  if hDMode<>0 then
    begin
      pDMode:=GlobalLock(hDMode);
      if pDMode<>nil then
        begin
          pDMode^.dmFields:=pDMode^.dmFields or DM_PAPERSIZE or DM_PAPERLENGTH;
          PDMode^.dmPaperSize:=DMPAPER_USER;
          PDMode^.dmPaperLength:=value*10;
          PDMode^.dmFields:=PDMode^.dmFields or DMBIN_MANUAL;
          printer.SetPrinter(Device,Driver,Port,hDMode);
          GlobalUnlock(hDMode);
        end;
    end;
    printer.PrinterIndex:=-1;
end;

end.
