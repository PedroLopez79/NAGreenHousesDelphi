object frmcropimage: Tfrmcropimage
  Left = 0
  Top = 0
  Caption = 'frmcropimage'
  ClientHeight = 551
  ClientWidth = 663
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poMainFormCenter
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 663
    Height = 551
    Align = alClient
    BorderStyle = bsNone
    TabOrder = 0
    object Image1: TImage
      Left = 3
      Top = 3
      Width = 105
      Height = 105
      AutoSize = True
      OnMouseDown = Image1MouseDown
      OnMouseMove = Image1MouseMove
      OnMouseUp = Image1MouseUp
    end
  end
  object MainMenu1: TMainMenu
    Left = 144
    Top = 48
    object Archivo1: TMenuItem
      Caption = 'Archivo'
      object CargarArchivo1: TMenuItem
        Caption = 'Cargar Archivo'
        OnClick = CargarArchivo1Click
      end
      object Guardar1: TMenuItem
        Caption = 'Guardar'
        OnClick = Guardar1Click
      end
      object ReducirImagen1: TMenuItem
        Caption = 'Reducir Imagen 250 x 250'
        Enabled = False
        OnClick = ReducirImagen1Click
      end
      object ReducirImagen500x5001: TMenuItem
        Caption = 'Reducir Imagen 500 x 500'
        Enabled = False
        OnClick = ReducirImagen500x5001Click
      end
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 144
  end
end
