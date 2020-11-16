unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Vcl.StdCtrls, pngimage, Vcl.ComCtrls;

type
  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    Button1: TButton;
    Button2: TButton;
    TrackBar1: TTrackBar;
    TrackBar2: TTrackBar;
    Label1: TLabel;
    Label2: TLabel;
    Timer1: TTimer;
    TimerEye: TTimer;
    MemoL: TMemo;
    TimerMouse: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
    procedure TimerEyeTimer(Sender: TObject);
    procedure TimerMouseTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  main = 0;
  eye = 1;
  keybrd = 2;
  mouse = 3;
  aln = 4;
  arn = 5;
  alkb = 6;
  arkb = 7;
  a_mouse = 8;
  r_body = 9;




var
  Form1: TForm1;

  img : array [0..9] of TPicture;

  kbdX : Integer = 238;
  kbdY : Integer = 378;

  mouseX1 : Integer = 160;
  mouseX2 : Integer = 140;
  mouseY1 : Integer = 375;
  mouseY2 : Integer = 355;

  mousePos: TPoint;

  lastCatMousePos: TPoint;
  catMousePos: TPoint;

  eyeState : Boolean = True;
  mouseState : Boolean = True;



implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
Close;
end;

function kb() : Integer;
var i : Integer;
    //KS: TKeyboardState;
begin
  //FillChar(KS, SizeOf(KS), 0);
  //GetKeyboardState(KS);
  for I := 0 to 255 do
  begin
  if getasynckeystate(i) <> 0 Then
    begin
    result := i;
    exit;
    end;
  end;
  result := -1;
end;

function GetCatMousePos() : TPoint;
var deltaX, deltaY, t1, t2 : Double;
begin
  deltaX := mouseX1 - mouseX2;
  deltaY := mouseY1 - mouseY2;
  GetCursorPos(mousePos);
  result.X := Trunc((deltaX / Screen.Width) * (Screen.Width - mousePos.X)) + mouseX2;
  result.Y := Trunc((deltaY / Screen.Height) * (Screen.Height - mousePos.Y)) + mouseY2 + Trunc((result.X - mouseX2) / 4);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i: Integer;
begin
Form1.DoubleBuffered := True;
for i := 0 to 9 do
  img[i] := TPicture.Create;


img[main].LoadFromFile('images\cat_main.png');
img[eye].LoadFromFile('images\cat_eye.png');
img[keybrd].LoadFromFile('images\cat_keyboard.png');
img[mouse].LoadFromFile('images\cat_mouse.png');
img[aln].LoadFromFile('images\cat_L_N.png');
img[arn].LoadFromFile('images\cat_R_N.png');
img[alkb].LoadFromFile('images\cat_L_keyboard.png');
img[arkb].LoadFromFile('images\cat_R_keyboard.png');
img[a_mouse].LoadFromFile('images\cat_R_mouse.png');
img[r_body].LoadFromFile('images\cat_R_body.png');

end;

procedure TForm1.PaintBox1Paint(Sender: TObject);
var kbState : Integer;
begin
PaintBox1.Canvas.Draw(0, 0, img[main].Graphic);
if eyeState then
  PaintBox1.Canvas.Draw(0, 0, img[eye].Graphic);
PaintBox1.Canvas.Draw(kbdX, kbdY, img[keybrd].Graphic);

catMousePos := GetCatMousePos();
PaintBox1.Canvas.Draw(catMousePos.X, catMousePos.Y, img[mouse].Graphic);
//PaintBox1.Canvas.Draw(TrackBar1.Position, TrackBar2.Position, img[mouse].Graphic);

kbState := kb();


if MemoL.Lines.IndexOf(IntToStr(kbState)) <> -1 then
  PaintBox1.Canvas.Draw(0, 0, img[alkb].Graphic)
else
  PaintBox1.Canvas.Draw(0, 0, img[aln].Graphic);

if mouseState then
  begin
  PaintBox1.Canvas.Draw(catMousePos.X + 30, catMousePos.Y - 50, img[a_mouse].Graphic);
  PaintBox1.Canvas.Draw(0, 0, img[r_body].Graphic);
  end
else
if (MemoL.Lines.IndexOf(IntToStr(kbState)) = -1) and (kbState > 4) Then
  begin
  PaintBox1.Canvas.Draw(0, 0, img[arkb].Graphic);
  PaintBox1.Canvas.Draw(0, 0, img[r_body].Graphic);
  end
else
  PaintBox1.Canvas.Draw(0, 0, img[arn].Graphic);



Label1.Caption := IntToStr(TrackBar1.Position);
Label2.Caption := IntToStr(TrackBar2.Position);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var t : Integer;
begin

PaintBox1.Repaint;

end;

procedure TForm1.TimerEyeTimer(Sender: TObject);
begin

if eyeState then
  begin
  if Random(2) < 1 then
    begin
    eyeState := False;
    TimerEye.Interval := 100;
    end;
  end
else
  begin
  eyeState := True;
  TimerEye.Interval := 2000;
  end;


end;

procedure TForm1.TimerMouseTimer(Sender: TObject);
begin
if (lastCatMousePos.X <> catMousePos.X) or (lastCatMousePos.Y <> catMousePos.Y) then
begin
  mouseState := True;
end
else
  mouseState := False;

lastCatMousePos.X := catMousePos.X;
lastCatMousePos.Y := catMousePos.Y;
end;

end.
