object frm_inequivalent: Tfrm_inequivalent
  Left = 389
  Top = 375
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Select inEquivalent type'
  ClientHeight = 131
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object l_type: TLabel
    Left = 16
    Top = 8
    Width = 28
    Height = 13
    Caption = 'l_type'
    Visible = False
  end
  object Label1: TLabel
    Left = 162
    Top = 83
    Width = 59
    Height = 13
    Caption = 'Fuzzy value:'
  end
  object l_inequivalent: TLabel
    Left = 96
    Top = 8
    Width = 177
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'l_type'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object suiButton1: TsuiButton
    Left = 272
    Top = 24
    Width = 96
    Height = 27
    Caption = 'moreThan'
    AutoSize = False
    UIStyle = WinXP
    TabOrder = 0
    Transparent = False
    ModalResult = 0
    FocusedRectMargin = 2
    Layout = blGlyphLeft
    Spacing = 4
    MouseContinuouslyDownInterval = 100
    OnClick = suiButton1Click
    ResHandle = 0
  end
  object suiButton2: TsuiButton
    Left = 272
    Top = 64
    Width = 96
    Height = 27
    Caption = 'moreOrEquivalent'
    AutoSize = False
    UIStyle = WinXP
    TabOrder = 1
    Transparent = False
    ModalResult = 0
    FocusedRectMargin = 2
    Layout = blGlyphLeft
    Spacing = 4
    MouseContinuouslyDownInterval = 100
    OnClick = suiButton2Click
    ResHandle = 0
  end
  object suiButton3: TsuiButton
    Left = 16
    Top = 24
    Width = 96
    Height = 27
    Caption = 'lessThan'
    AutoSize = False
    UIStyle = WinXP
    TabOrder = 2
    Transparent = False
    ModalResult = 0
    FocusedRectMargin = 2
    Layout = blGlyphLeft
    Spacing = 4
    MouseContinuouslyDownInterval = 100
    OnClick = suiButton3Click
    ResHandle = 0
  end
  object suiButton4: TsuiButton
    Left = 16
    Top = 64
    Width = 96
    Height = 27
    Caption = 'lessOrEquivalent'
    AutoSize = False
    UIStyle = WinXP
    TabOrder = 3
    Transparent = False
    ModalResult = 0
    FocusedRectMargin = 2
    Layout = blGlyphLeft
    Spacing = 4
    MouseContinuouslyDownInterval = 100
    OnClick = suiButton4Click
    ResHandle = 0
  end
  object suiButton5: TsuiButton
    Left = 144
    Top = 44
    Width = 96
    Height = 27
    Caption = 'Equivalent'
    AutoSize = False
    UIStyle = WinXP
    TabOrder = 4
    Transparent = False
    ModalResult = 0
    FocusedRectMargin = 2
    Layout = blGlyphLeft
    Spacing = 4
    MouseContinuouslyDownInterval = 100
    OnClick = suiButton5Click
    ResHandle = 0
  end
  object e_fuzzy_value: TsuiEdit
    Left = 132
    Top = 104
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
    TabOrder = 5
    OnKeyPress = e_fuzzy_valueKeyPress
  end
  object suiButton6: TsuiButton
    Left = 4
    Top = 104
    Width = 35
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Caption = 'Exite'
    AutoSize = False
    ParentFont = False
    UIStyle = WinXP
    TabOrder = 6
    Transparent = False
    ModalResult = 0
    FocusedRectMargin = 2
    Layout = blGlyphLeft
    Spacing = 4
    MouseContinuouslyDownInterval = 100
    OnClick = suiButton6Click
    ResHandle = 0
  end
end
