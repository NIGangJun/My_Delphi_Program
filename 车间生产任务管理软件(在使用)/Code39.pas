unit Code39;

interface

uses Windows, Classes, SysUtils, Graphics;

type
  TCode39 = class
  private
    FSize0: longInt;
    FSize1: longInt;
    FCodeItem: TStringList;
    procedure Reset();
  public
    Width: integer;
    Height: integer;
    constructor Create();
    destructor Destroy(); override;
    procedure DrawCode(ACanvas: TCanvas; ACode: string);
  end;
function getBMP(ACode :String): TBitmap;
implementation

function getBMP(ACode :String): TBitmap;
var
  Code39: TCode39;
begin
  Result := TBitmap.Create();
  Result.Width := 654;               //����
  Result.Height := 260;              //�߶�
  Code39 := TCode39.Create;
  Code39.DrawCode(Result.Canvas, ACode);
end;
{ TCode39 }

constructor TCode39.Create;
begin
  inherited;
  FSize0 := 2;
  FSize1 := 4;
  FCodeItem := TStringList.Create;
  Self.Reset();
end;

destructor TCode39.Destroy;
begin
  FCodeItem.Clear;
  FCodeItem.Free;
  inherited;
end;

procedure TCode39.DrawCode(ACanvas: TCanvas; ACode: string);
var
  b: Boolean;
  i: longInt;
  j: longInt;
  len: longInt;
  code: string;
  s: string;
  c: char;
  h: longInt;
  rect: TRect;
begin
  code := '*' + ACode + '*';
  len := System.Length(code);
  h := 100;
  rect.Top := 3;
  rect.Left := 3;
  rect.Right := 3;
  rect.Bottom := rect.Top + h;
  ACanvas.Pen.Style := Graphics.psClear;
  for i := 1 to len do
    begin
      s := FCodeItem.Values[SysUtils.UpperCase(code[i])] + '1';
      b := false;
      for j := 1 to 10 do
        begin
          b := not b;
          case b of
            true: ACanvas.Brush.Color := Graphics.clBlack;
            false: ACanvas.Brush.Color := Graphics.clWhite;
          end;
          c := s[j];
          rect.Left := rect.Right;
          case c of
            '0':
              begin
                rect.Right := rect.Left + FSize0;
              end;
            '1':
              begin
                rect.Right := rect.Left + FSize1;
              end;
        end;
      ACanvas.FillRect(rect);
    end;
    Width := rect.Right;
    Height := rect.Bottom;
  end;
end;

procedure TCode39.Reset;
begin
  FCodeItem.Values['0'] := '000110100'; //   0
  FCodeItem.Values['1'] := '100100001'; //   1
  FCodeItem.Values['2'] := '001100001'; //   2
  FCodeItem.Values['3'] := '101100000'; //   3
  FCodeItem.Values['4'] := '000110001'; //   4
  FCodeItem.Values['5'] := '100110000'; //   5
  FCodeItem.Values['6'] := '001110000'; //   6
  FCodeItem.Values['7'] := '000100101'; //   7
  FCodeItem.Values['8'] := '100100100'; //   8
  FCodeItem.Values['9'] := '001100100'; //   9
  FCodeItem.Values['A'] := '100001001'; //   A
  FCodeItem.Values['B'] := '001001001'; //   B
  FCodeItem.Values['C'] := '101001000'; //   C
  FCodeItem.Values['D'] := '000011001'; //   D
  FCodeItem.Values['E'] := '100011000'; //   E
  FCodeItem.Values['F'] := '001011000'; //   F
  FCodeItem.Values['G'] := '000001101'; //   G
  FCodeItem.Values['H'] := '100001100'; //   H
  FCodeItem.Values['I'] := '001001100'; //   I
  FCodeItem.Values['J'] := '000011100'; //   J
  FCodeItem.Values['K'] := '100000011'; //   K
  FCodeItem.Values['L'] := '001000011'; //   L
  FCodeItem.Values['M'] := '101000010'; //   M
  FCodeItem.Values['N'] := '000010011'; //   N
  FCodeItem.Values['O'] := '100010010'; //   O
  FCodeItem.Values['P'] := '001010010'; //   P
  FCodeItem.Values['Q'] := '000000111'; //   Q
  FCodeItem.Values['R'] := '100000110'; //   R
  FCodeItem.Values['S'] := '001000110'; //   S
  FCodeItem.Values['T'] := '000010110'; //   T
  FCodeItem.Values['U'] := '110000001'; //   U
  FCodeItem.Values['V'] := '011000001'; //   V
  FCodeItem.Values['W'] := '111000000'; //   W
  FCodeItem.Values['X'] := '010010001'; //   X
  FCodeItem.Values['Y'] := '110010000'; //   Y
  FCodeItem.Values['Z'] := '011010000'; //   Z
  FCodeItem.Values['-'] := '010000101'; //   -
  FCodeItem.Values['.'] := '110000100'; //   .
  FCodeItem.Values[' '] := '011000100'; //   [space]
  FCodeItem.Values['$'] := '010101000'; //   $
  FCodeItem.Values['/'] := '010100010'; //   /
  FCodeItem.Values['+'] := '010001010'; //   +
  FCodeItem.Values['%'] := '000101010'; //   %
  FCodeItem.Values['*'] := '010010100'; //   *
end;

end.

