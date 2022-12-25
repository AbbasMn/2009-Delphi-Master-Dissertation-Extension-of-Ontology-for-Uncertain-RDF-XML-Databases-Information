program owl;

uses
  Forms,
  main in 'main.pas' {frm_main},
  madule in 'madule.pas' {DataModule1: TDataModule},
  unt_rdf_xml_code in 'unt_rdf_xml_code.pas' {frm_rdf_xml_code},
  unt_show_class in 'unt_show_class.pas' {frm_show_class},
  unt_inequivalent in 'unt_inequivalent.pas' {frm_inequivalent},
  unt_algorithm in 'unt_algorithm.pas' {frm_algorithm},
  unt_theshold in 'unt_theshold.pas' {frm_thershold},
  unt_rfd_matrixpas in 'unt_rfd_matrixpas.pas' {frm_rfd_matrix};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Simple Fuzzy OWL Editor';
  Application.CreateForm(Tfrm_main, frm_main);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(Tfrm_rdf_xml_code, frm_rdf_xml_code);
  Application.CreateForm(Tfrm_show_class, frm_show_class);
  Application.CreateForm(Tfrm_inequivalent, frm_inequivalent);
  Application.CreateForm(Tfrm_algorithm, frm_algorithm);
  Application.CreateForm(Tfrm_thershold, frm_thershold);
  Application.CreateForm(Tfrm_rfd_matrix, frm_rfd_matrix);
  Application.Run;
end.
