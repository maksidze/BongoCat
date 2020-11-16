object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 650
  ClientWidth = 1051
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 0
    Top = 0
    Width = 738
    Height = 650
    OnPaint = PaintBox1Paint
  end
  object Label1: TLabel
    Left = 776
    Top = 376
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 888
    Top = 376
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Button1: TButton
    Left = 744
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 808
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 1
  end
  object TrackBar1: TTrackBar
    Left = 768
    Top = 224
    Width = 275
    Height = 45
    Max = 800
    TabOrder = 2
  end
  object TrackBar2: TTrackBar
    Left = 768
    Top = 275
    Width = 275
    Height = 45
    Max = 800
    TabOrder = 3
  end
  object MemoL: TMemo
    Left = 834
    Top = 8
    Width = 49
    Height = 89
    Lines.Strings = (
      '9'
      '16'
      '17'
      '18'
      '20'
      '27'
      '32'
      '48'
      '49'
      '51'
      '54'
      '56'
      '57'
      '65'
      '66'
      '67'
      '68'
      '69'
      '69'
      '70'
      '71'
      '72'
      '73'
      '74'
      '75'
      '76'
      '77'
      '78'
      '79'
      '81'
      '82'
      '83'
      '84'
      '85'
      '86'
      '87'
      '88'
      '89'
      '90'
      '91'
      '112'
      '113'
      '114'
      '115'
      '116'
      '117'
      '118'
      '119'
      '188'
      '190'
      '192'
      '492'
      '503'
      '514'
      '525'
      '536'
      '547'
      '558'
      '569'
      '570')
    TabOrder = 4
    Visible = False
  end
  object Timer1: TTimer
    Interval = 20
    OnTimer = Timer1Timer
    Left = 832
    Top = 496
  end
  object TimerEye: TTimer
    Interval = 100
    OnTimer = TimerEyeTimer
    Left = 976
    Top = 496
  end
  object TimerMouse: TTimer
    Interval = 500
    OnTimer = TimerMouseTimer
    Left = 912
    Top = 576
  end
end
