unit Log;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TForm7 = class(TForm)
    Label1: TLabel;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure MakeTeam(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

procedure TForm7.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := True;
end;

procedure TForm7.FormShow(Sender: TObject);
begin
  //MakeTeam(Sender);
end;

procedure TForm7.MakeTeam(Sender: TObject);
Var
  I: Integer;
begin
  try
    ADOQuery1.SQL.Text := 'SELECT banzuname,banzunum,GROUP_CONCAT(name) FROM banzu GROUP BY banzuname';
    ADOQuery1.Active := True;
    Combobox1.Clear;
    for I := 1 to ADOQuery1.RecordCount do
      begin
        ADOQuery1.RecNo := I;
        if ADOQuery1.FieldByName('banzuname').AsString <> null then
          begin
            Combobox1.Items.Add(ADOQuery1.FieldByName('banzuname').AsString);
          end;
      end;
  except
    //�쳣����
  end;
end;

end.
