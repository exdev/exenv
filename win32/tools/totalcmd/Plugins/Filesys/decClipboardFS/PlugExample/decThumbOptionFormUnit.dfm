object ThumbOptionForm: TThumbOptionForm
  Left = 308
  Top = 373
  Width = 264
  Height = 226
  BorderIcons = [biSystemMenu, biMaximize]
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDefaultPosOnly
  OnResize = FormResize
  DesignSize = (
    256
    195)
  PixelsPerInch = 96
  TextHeight = 13
  object OkButton: TButton
    Left = 160
    Top = 120
    Width = 83
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Ok'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object CancelButton: TButton
    Left = 160
    Top = 152
    Width = 83
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
end
