unit unt_inequivalent;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SUIButton, SUIEdit;

type
  Tfrm_inequivalent = class(TForm)
    l_type: TLabel;
    suiButton1: TsuiButton;
    suiButton2: TsuiButton;
    suiButton3: TsuiButton;
    suiButton4: TsuiButton;
    suiButton5: TsuiButton;
    e_fuzzy_value: TsuiEdit;
    Label1: TLabel;
    l_inequivalent: TLabel;
    suiButton6: TsuiButton;
    procedure e_fuzzy_valueKeyPress(Sender: TObject; var Key: Char);
    procedure suiButton3Click(Sender: TObject);
    procedure suiButton4Click(Sender: TObject);
    procedure suiButton5Click(Sender: TObject);
    procedure suiButton1Click(Sender: TObject);
    procedure suiButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure suiButton6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_inequivalent: Tfrm_inequivalent;

implementation
                                                                                                       

uses main;

{$R *.dfm}

procedure Tfrm_inequivalent.e_fuzzy_valueKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not( key in['0'..'9' , #13, #8, '.']) then
  begin
    key:=#0;
    exit;
  end;
  if key=#13 then
  begin
    if trim(e_fuzzy_value.Text)='' then
      e_fuzzy_value.Text:='0';
    frm_main.fuzzy_value:=StrToFloat(e_fuzzy_value.Text);

    if (l_inequivalent.Caption='') then
    begin
      frm_main.suiMessageDialog1.Text:='inEquivalent type must be select';
      frm_main.suiMessageDialog1.ShowModal;
      exit;
    end;

    if (frm_main.fuzzy_value=0)or(frm_main.fuzzy_value>1) then
    begin
    frm_main.suiMessageDialog1.Text:='Fuzzy vlue must between 0 and 1';
    frm_main.suiMessageDialog1.ShowModal;
    e_fuzzy_value.Clear;
    frm_main.fuzzy_value:=0;
    end
  else
    close;
  end;

end;

procedure Tfrm_inequivalent.suiButton3Click(Sender: TObject);
begin
  frm_main.inequinalent_type:='lessThan';
  l_inequivalent.Caption:='lessThan';
  e_fuzzy_value.SetFocus;
end;

procedure Tfrm_inequivalent.suiButton4Click(Sender: TObject);
begin
  frm_main.inequinalent_type:='lessOrEquivalent';
  l_inequivalent.Caption:='lessOrEquivalent';
  e_fuzzy_value.SetFocus;
end;

procedure Tfrm_inequivalent.suiButton5Click(Sender: TObject);
begin
  frm_main.inequinalent_type:='Equivalent';
  l_inequivalent.Caption:='Equivalent';
  e_fuzzy_value.SetFocus;

end;

procedure Tfrm_inequivalent.suiButton1Click(Sender: TObject);
begin
  frm_main.inequinalent_type:='moreThan';
  l_inequivalent.Caption:='moreThan';
  e_fuzzy_value.SetFocus;
end;

procedure Tfrm_inequivalent.suiButton2Click(Sender: TObject);
begin
  frm_main.inequinalent_type:='moreOrEquivalent';
  l_inequivalent.Caption:='moreOrEquivalent';
  e_fuzzy_value.SetFocus;  
end;

procedure Tfrm_inequivalent.FormShow(Sender: TObject);
begin
  frm_main.inequinalent_type:='';
  frm_main.fuzzy_value:=0;
  e_fuzzy_value.Clear;
  l_inequivalent.Caption:='';
end;

procedure Tfrm_inequivalent.suiButton6Click(Sender: TObject);
begin
  frm_main.inequinalent_type:='';
  frm_main.fuzzy_value:=-1;
  Close;
end;

end.
