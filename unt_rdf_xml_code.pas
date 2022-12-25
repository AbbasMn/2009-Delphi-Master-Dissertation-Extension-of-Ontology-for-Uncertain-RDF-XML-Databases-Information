unit unt_rdf_xml_code;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBCtrls, SUIDBCtrls, StdCtrls, SUIMemo;

type
  Tfrm_rdf_xml_code = class(TForm)
    suiMemo1: TsuiMemo;
    procedure FormShow(Sender: TObject);
    procedure show_rdf_cod;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_rdf_xml_code: Tfrm_rdf_xml_code;

implementation

uses madule, main;

{$R *.dfm}
procedure Tfrm_rdf_xml_code.show_rdf_cod;
begin
  suiMemo1.Lines.Clear;

  DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml order by level,id';
  DataModule1.adoq_RDF_XML.Open;

  DataModule1.adoq_RDF_XML.First;

  while not DataModule1.adoq_RDF_XML.Eof do
  begin
    suiMemo1.Lines.Add(DataModule1.adoq_RDF_XMLrdf.AsString);
    DataModule1.adoq_RDF_XML.Next;
  end;
  suiMemo1.Lines.Add('</rdf:RDF>');

end;

procedure Tfrm_rdf_xml_code.FormShow(Sender: TObject);
begin
   show_rdf_cod;
end;

end.
