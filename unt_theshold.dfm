object frm_thershold: Tfrm_thershold
  Left = 254
  Top = 249
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Thershold'
  ClientHeight = 92
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 34
    Top = 36
    Width = 76
    Height = 13
    Caption = 'Theshold value:'
  end
  object e_fuzzy_value: TsuiEdit
    Left = 164
    Top = 33
    Width = 121
    Height = 19
    UIStyle = WinXP
    BorderColor = 6842472
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyPress = e_fuzzy_valueKeyPress
  end
end
