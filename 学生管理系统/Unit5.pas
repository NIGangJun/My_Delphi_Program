unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, Mask, Buttons;

type
  TForm5 = class(TForm)
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label11: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit9: TDBEdit;
    Image1: TImage;
    PrintDialog1: TPrintDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    procedure ScreenShot(x: integer; y: integer; Width: integer; Height: integer; bm: TBitMap);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation
 uses
    unit2, Printers;
{$R *.dfm}

procedure TForm5.ScreenShot(x: integer; y: integer; Width: integer; Height: integer; bm: TBitMap);
var
  dc: HDC;
  lpPal: PLOGPALETTE;
begin
  if ((Width = 0) or (Height = 0)) then
    exit;
  bm.Width := Width;
  bm.Height := Height;
  dc := GetDc(0);
  if (dc = 0) then
    exit;
  if (GetDeviceCaps(dc, RASTERCAPS) AND RC_PALETTE = RC_PALETTE) then
  begin
    GetMem(lpPal, sizeof(TLOGPALETTE) + (255 * sizeof(TPALETTEENTRY)));
    FillChar(lpPal^, sizeof(TLOGPALETTE) + (255 * sizeof(TPALETTEENTRY)), #0);
    lpPal^.palVersion := $300;
    lpPal^.palNumEntries := GetSystemPaletteEntries(dc, 0, 256, lpPal^.palPalEntry);
    if (lpPal^.palNumEntries <> 0) then
    begin
      bm.Palette := CreatePalette(lpPal^);
    end;
    FreeMem(lpPal, sizeof(TLOGPALETTE) + (255 * sizeof(TPALETTEENTRY)));
  end;
  BitBlt(bm.Canvas.Handle, 0, 0, Width, Height, dc, x, y, SRCCOPY);
  ReleaseDc(0, dc);
end;


procedure TForm5.FormShow(Sender: TObject);
begin
     Image1.Picture.Assign(Form2.Image1.Picture.Graphic);
end;

procedure TForm5.SpeedButton2Click(Sender: TObject);
begin
  close;
end;

procedure TForm5.SpeedButton1Click(Sender: TObject);
var
  FBMP: TBitMap;
  ScaleX, ScaleY: Integer;
  RR: TRect;
begin
    FBMP := TBitMap.Create;
    //Form5.Color := clWhite;
    ScreenShot(Form5.Left + 20, Form5.Top + 33, Form5.Width - 40,500 - 33, FBMP);
    //Form5.Color := clSkyBlue;
    FBMP.SaveToFile(ExtractFilePath(ParamStr(0)) + 'Image\USE FOR PRINT.bmp');
    FBMP.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'Image\USE FOR PRINT.bmp');
    if PrintDialog1.Execute then
    begin
        if PrinterSetupDialog1.Execute then
            begin

              with Printer do
                begin
                  BeginDoc;
                  try
                    ScaleX := GetDeviceCaps(Handle, logPixelsX) div PixelsPerInch;
                    ScaleY := GetDeviceCaps(Handle, logPixelsY) div PixelsPerInch;
                    RR := Rect(600, 200, FBMP.Width * scaleX, FBMP.Height * ScaleY);
                    Canvas.StretchDraw(RR, FBMP);
                  finally
                    EndDoc;
                  end;
                end;

            end;
    end;       
   FBMP.Free;
end;

end.
