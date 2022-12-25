unit unt_theshold;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SUIEdit;

type
  Tfrm_thershold = class(TForm)
    Label1: TLabel;
    e_fuzzy_value: TsuiEdit;
    procedure e_fuzzy_valueKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_thershold: Tfrm_thershold;

implementation

uses unt_algorithm, main;

{$R *.dfm}

procedure Tfrm_thershold.e_fuzzy_valueKeyPress(Sender: TObject;
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
    frm_algorithm.thershold_val:=StrToFloat(e_fuzzy_value.Text);

    if (frm_algorithm.thershold_val>1) then
    begin
    frm_main.suiMessageDialog1.Text:='Thershold vlue must lower than 1';
    frm_main.suiMessageDialog1.ShowModal;
    e_fuzzy_value.Clear;
    frm_algorithm.thershold_val:=0;
    end
  else
    close;
  end;
end;

end.
