object frm_show_class: Tfrm_show_class
  Left = 401
  Top = 130
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Class Hierarchy'
  ClientHeight = 340
  ClientWidth = 291
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  Visible = True
  OnShow = FormShow
  DesignSize = (
    291
    340)
  PixelsPerInch = 96
  TextHeight = 13
  object l_type: TLabel
    Left = 32
    Top = 16
    Width = 28
    Height = 13
    Caption = 'l_type'
    Visible = False
  end
  object tree_class: TsuiTreeView
    Left = 1
    Top = 40
    Width = 289
    Height = 297
    UIStyle = WinXP
    BorderColor = 6842472
    Anchors = [akLeft, akTop, akBottom]
    AutoExpand = True
    BorderStyle = bsNone
    BorderWidth = 2
    DragMode = dmAutomatic
    HideSelection = False
    HotTrack = True
    Images = frm_main.ImageList1
    Indent = 19
    ReadOnly = True
    RowSelect = True
    SortType = stText
    TabOrder = 0
    Items.Data = {
      01000000230000000000000000000000FFFFFFFFFFFFFFFF0000000006000000
      0A6F776C3A205468696E67240000000000000000000000FFFFFFFFFFFFFFFF00
      000000000000000B446174615F6D696E696E67270000000000000000000000FF
      FFFFFFFFFFFFFF00000000000000000E446174615F72657472696576616C2A00
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000114465736372
      697074696F6E5F6C6F676963210000000000000000000000FFFFFFFFFFFFFFFF
      0000000000000000084F6E746F6C6F6779300000000000000000000000FFFFFF
      FFFFFFFFFF00000000000000001753656D616E7469635F646174615F72657472
      696576616C230000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      000A5765625F6D696E696E67}
  end
  object suiButton1: TsuiButton
    Left = 105
    Top = 8
    Width = 80
    Height = 27
    Caption = 'Insert'
    AutoSize = False
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
end
