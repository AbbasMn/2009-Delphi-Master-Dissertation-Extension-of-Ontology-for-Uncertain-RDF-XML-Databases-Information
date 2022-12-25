object frm_algorithm: Tfrm_algorithm
  Left = 245
  Top = 246
  Width = 477
  Height = 390
  BorderIcons = [biSystemMenu]
  Caption = 'The Algorithms for Fuzzy Web Ontology Language (FOWL)'
  Color = clBtnHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  DesignSize = (
    452
    339)
  PixelsPerInch = 96
  TextHeight = 13
  object Label8: TLabel
    Left = 4
    Top = 14
    Width = 328
    Height = 16
    Caption = 'Create Hidden realations for reachable classes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 4
    Top = 48
    Width = 349
    Height = 16
    Caption = 'Create Hidden realations for all reachable classes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 4
    Top = 83
    Width = 365
    Height = 16
    Caption = 'Create Hidden realations for all unreachable classes'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 4
    Top = 117
    Width = 321
    Height = 16
    Caption = 'Create Hidden realations for symetric fuzzy set'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 4
    Top = 152
    Width = 184
    Height = 16
    Caption = 'Filtering Hidden realations'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object l_go: TLabel
    Left = 40
    Top = 176
    Width = 20
    Height = 13
    Caption = 'l_go'
    Visible = False
  end
  object Memo1: TMemo
    Left = 49
    Top = 188
    Width = 385
    Height = 168
    Alignment = taCenter
    BorderStyle = bsNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 0
  end
  object suiButton1: TsuiButton
    Left = 371
    Top = 9
    Width = 95
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Caption = 'Run Alghorithm'
    AutoSize = False
    ParentFont = False
    UIStyle = WinXP
    TabOrder = 1
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
    Left = 371
    Top = 43
    Width = 95
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Caption = 'Run Alghorithm'
    AutoSize = False
    ParentFont = False
    UIStyle = WinXP
    TabOrder = 2
    Transparent = False
    ModalResult = 0
    FocusedRectMargin = 2
    Layout = blGlyphLeft
    Spacing = 4
    MouseContinuouslyDownInterval = 100
    OnClick = suiButton2Click
    ResHandle = 0
  end
  object suiButton33: TsuiButton
    Left = 371
    Top = 78
    Width = 95
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Caption = 'Run Alghorithm'
    AutoSize = False
    ParentFont = False
    UIStyle = WinXP
    TabOrder = 3
    Transparent = False
    ModalResult = 0
    FocusedRectMargin = 2
    Layout = blGlyphLeft
    Spacing = 4
    MouseContinuouslyDownInterval = 100
    OnClick = suiButton33Click
    ResHandle = 0
  end
  object suiButton334: TsuiButton
    Left = 371
    Top = 112
    Width = 95
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Caption = 'Run Alghorithm'
    AutoSize = False
    ParentFont = False
    UIStyle = WinXP
    TabOrder = 4
    Transparent = False
    ModalResult = 0
    FocusedRectMargin = 2
    Layout = blGlyphLeft
    Spacing = 4
    MouseContinuouslyDownInterval = 100
    OnClick = suiButton334Click
    ResHandle = 0
  end
  object suiButton3: TsuiButton
    Left = 371
    Top = 147
    Width = 95
    Height = 27
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Caption = 'Run Alghorithm'
    AutoSize = False
    ParentFont = False
    UIStyle = WinXP
    TabOrder = 5
    Transparent = False
    ModalResult = 0
    FocusedRectMargin = 2
    Layout = blGlyphLeft
    Spacing = 4
    MouseContinuouslyDownInterval = 100
    OnClick = suiButton3Click
    ResHandle = 0
  end
  object suiButton7: TsuiButton
    Left = 109
    Top = 176
    Width = 217
    Height = 27
    Anchors = [akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    Caption = 'Fuzzy connection marix in RDF'
    AutoSize = False
    Visible = False
    ParentFont = False
    UIStyle = WinXP
    TabOrder = 6
    Transparent = False
    ModalResult = 0
    FocusedRectMargin = 2
    Layout = blGlyphLeft
    Spacing = 4
    MouseContinuouslyDownInterval = 100
    OnClick = suiButton7Click
    ResHandle = 0
  end
end
