unit unt_show_class;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, SUITreeView, SUIButton, StdCtrls;

type
  Tfrm_show_class = class(TForm)
    tree_class: TsuiTreeView;
    suiButton1: TsuiButton;
    l_type: TLabel;
    procedure FormShow(Sender: TObject);
    procedure insert_for_disjoint;
    procedure suiButton1Click(Sender: TObject);
    procedure insert_object_prop_range;
    procedure insert_object_prop_domain;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_show_class: Tfrm_show_class;

implementation

uses main, madule, DB;

{$R *.dfm}
procedure Tfrm_show_class.insert_object_prop_domain;
var id:integer;
begin
    DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml where rdf like '+
    QuotedStr('%    <fowl:ObjectProperty rdf:ID="'+frm_main.e_new_property.Text+'">%');
    DataModule1.adoq_RDF_XML.Open;

    DataModule1.adoq_RDF_XML.First;
    id:=10;
    if DataModule1.adoq_RDF_XML.RecordCount=0 then
    begin

      DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml where rdf like '+
      QuotedStr('%    <fowl:ObjectProperty rdf:ID="'+frm_main.e_new_property.Text+'"/>%');
      DataModule1.adoq_RDF_XML.Open;

      if DataModule1.adoq_RDF_XML.RecordCount>0 then
      begin
        DataModule1.adoq_RDF_XML2.SQL.Text:='update fuzzy_rdf_xml  set rdf='+
        QuotedStr('    <fowl:ObjectProperty rdf:ID="'+frm_main.e_new_property.Text+'">')+
        ' where rdf like'+
        QuotedStr('%    <fowl:ObjectProperty rdf:ID="'+frm_main.e_new_property.Text+'"/>%');
        DataModule1.adoq_RDF_XML2.ExecSQL;



        DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
        QuotedStr('        <rdfs:domain rdf:resource="#'+tree_class.Selected.Text+'"/>')+','+
        QuotedStr(tree_class.Selected.Text)+','+
        QuotedStr('domain')+','+
        IntToStr(3)+','+
        QuotedStr(tree_class.Selected.Text)+
        ')';
        DataModule1.adoq_RDF_XML.ExecSQL;

        DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
        QuotedStr('    </fowl:ObjectProperty>')+','+
        QuotedStr(frm_main.e_new_property.Text)+','+
        QuotedStr('domain')+','+
        IntToStr(3)+','+
        QuotedStr(frm_main.e_new_property.Text)+
        ')';
        DataModule1.adoq_RDF_XML.ExecSQL;
      end;

    end
    else
    begin
      id:=DataModule1.adoq_RDF_XMLid.AsInteger;
      
      DataModule1.ADOQ_temp.SQL.Text:='delete from temp';
      DataModule1.ADOQ_temp.ExecSQL;

      DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml  where id>'+IntToStr(id);
      DataModule1.adoq_RDF_XML.Open;

      
      while not DataModule1.adoq_RDF_XML.Eof do
      begin
        DataModule1.ADOQ_temp.SQL.Text:='insert into temp(rdf,class1,class2,level,class3) values('+
        QuotedStr(DataModule1.adoq_RDF_XMLrdf.AsString)+','+
        QuotedStr(DataModule1.adoq_RDF_XMLclass1.AsString)+','+
        QuotedStr(DataModule1.adoq_RDF_XMLclass2.AsString)+','+
        DataModule1.adoq_RDF_XMLlevel.AsString+','+
        QuotedStr(DataModule1.adoq_RDF_XMLclass3.AsString)+
        ')';
        DataModule1.ADOQ_temp.ExecSQL;
        DataModule1.adoq_RDF_XML.Next;
      end;

      DataModule1.adoq_RDF_XML.SQL.Text:='delete from fuzzy_rdf_xml  where id >'+IntToStr(id);
      DataModule1.adoq_RDF_XML.ExecSQL;


      ///////////////
      DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
      QuotedStr('        <rdfs:domain>')+','+
      QuotedStr(frm_main.e_new_property.Text)+','+
      QuotedStr('domain')+','+
      IntToStr(3)+','+
      QuotedStr(frm_main.e_new_property.Text)+
      ')';
      DataModule1.adoq_RDF_XML.ExecSQL;

      DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
      QuotedStr('            <fowl:Class>')+','+
      QuotedStr(frm_main.e_new_property.Text)+','+
      QuotedStr('domain')+','+
      IntToStr(3)+','+
      QuotedStr(frm_main.e_new_property.Text)+
      ')';
      DataModule1.adoq_RDF_XML.ExecSQL;

      DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
      QuotedStr('                <fowl:unionOf rdf:parseType="Collection">')+','+
      QuotedStr(frm_main.e_new_property.Text)+','+
      QuotedStr('domain')+','+
      IntToStr(3)+','+
      QuotedStr(frm_main.e_new_property.Text)+
      ')';
      DataModule1.adoq_RDF_XML.ExecSQL;
      /////////////////////

      DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
      QuotedStr('                    <fowl:Class rdf:about="#'+tree_class.Selected.Text+'"/>')+','+
      QuotedStr(frm_main.e_new_property.Text)+','+
      QuotedStr('domain')+','+
      IntToStr(3)+','+
      QuotedStr(tree_class.Selected.Text)+
      ')';
      DataModule1.adoq_RDF_XML.ExecSQL;


      {//////////////// delete from temp ////////////}

        DataModule1.ADOQ_temp.SQL.Text:='delete from temp  where class3='+QuotedStr(frm_main.e_new_property.Text)+
        ' and class2='+QuotedStr('domain')+

        ' and (rdf='+QuotedStr('                </fowl:unionOf>')+

        ' or rdf='+QuotedStr('            </fowl:Class>')+
        ' or rdf='+QuotedStr('        </rdfs:domain>')+
        ' or rdf='+QuotedStr('    </fowl:ObjectProperty>')+



        ' or rdf='+QuotedStr('        <rdfs:domain>')+
        ' or rdf='+QuotedStr('            <fowl:Class>')+
        ' or rdf='+QuotedStr('                <fowl:unionOf rdf:parseType="Collection">')+
        ')';
        DataModule1.ADOQ_temp.ExecSQL;


       DataModule1.ADOQ_temp2.SQL.Text:='select * from temp where class3='+QuotedStr(frm_main.e_new_property.Text)+
        ' and class2='+QuotedStr('domain')+' and rdf like '+QuotedStr('        <rdfs:domain rdf:resource=%');
       DataModule1.ADOQ_temp2.Open;

       while not DataModule1.ADOQ_temp2.Eof do
       begin
        DataModule1.ADOQ_temp.SQL.Text:='update temp set rdf='+
        QuotedStr('                    <fowl:Class rdf:about=#'+DataModule1.ADOQ_temp2class1.AsString+'"/>')+
        ' where id='+DataModule1.ADOQ_temp2id.AsString;
        DataModule1.ADOQ_temp.ExecSQL;
        DataModule1.ADOQ_temp2.Next;
       end;


        DataModule1.ADOQ_temp.SQL.Text:='select * from temp  where class3='+QuotedStr(frm_main.e_new_property.Text)+
        ' and class2='+QuotedStr('domain') ;
        DataModule1.ADOQ_temp.Open;

        while not DataModule1.ADOQ_temp.Eof do
        begin
          DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
          QuotedStr(DataModule1.ADOQ_temprdf.AsString)+','+
          QuotedStr(DataModule1.ADOQ_tempclass1.AsString)+','+
          QuotedStr(DataModule1.ADOQ_tempclass2.AsString)+','+
          DataModule1.ADOQ_templevel.AsString+','+
          QuotedStr(DataModule1.ADOQ_tempclass3.AsString)+
          ')';
          DataModule1.adoq_RDF_XML.ExecSQL;
          DataModule1.ADOQ_temp.Next;
        end;

        DataModule1.ADOQ_temp.SQL.Text:='delete from temp where class3='+QuotedStr(frm_main.e_new_property.Text)+
        ' and class2='+QuotedStr('domain');
        DataModule1.ADOQ_temp.ExecSQL;

         DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
        QuotedStr('                </fowl:unionOf>')+','+
        QuotedStr(frm_main.e_new_property.Text)+','+
        QuotedStr('domain')+','+
        IntToStr(3)+','+
        QuotedStr(frm_main.e_new_property.Text)+
        ')';
        DataModule1.adoq_RDF_XML.ExecSQL;

        DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
        QuotedStr('            </fowl:Class>')+','+
        QuotedStr(frm_main.e_new_property.Text)+','+
        QuotedStr('domain')+','+
        IntToStr(3)+','+
        QuotedStr(frm_main.e_new_property.Text)+
        ')';
        DataModule1.adoq_RDF_XML.ExecSQL;

        DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
        QuotedStr('        </rdfs:domain>')+','+
        QuotedStr(frm_main.e_new_property.Text)+','+
        QuotedStr('domain')+','+
        IntToStr(3)+','+
        QuotedStr(frm_main.e_new_property.Text)+
        ')';
        DataModule1.adoq_RDF_XML.ExecSQL;

        DataModule1.ADOQ_temp.SQL.Text:='delete from temp  where class1='+QuotedStr(frm_main.e_new_property.Text)+
        ' and rdf like '+QuotedStr('%    </fowl:ObjectProperty>%');
        DataModule1.ADOQ_temp.ExecSQL;

        DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml where  class1='+QuotedStr(frm_main.e_new_property.Text)+
        ' and rdf like '+ QuotedStr('%    </fowl:ObjectProperty>%');
        //' and class2='+QuotedStr('range')+

        DataModule1.adoq_RDF_XML.Open;

        if DataModule1.adoq_RDF_XML.RecordCount=0 then
        begin
          DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
          QuotedStr('    </fowl:ObjectProperty>')+','+
          QuotedStr(frm_main.e_new_property.Text)+','+
          QuotedStr('dimain')+','+
          IntToStr(3)+','+
          QuotedStr(frm_main.e_new_property.Text)+
          ')';
          DataModule1.adoq_RDF_XML.ExecSQL;
        end;

      {//////////////// delete from temp ////////////}

      ////////// other from temp to main  ////////////

        DataModule1.ADOQ_temp.SQL.Text:='select * from temp';
        DataModule1.ADOQ_temp.Open;

        while not DataModule1.ADOQ_temp.Eof do
        begin
          DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
          QuotedStr(DataModule1.ADOQ_temprdf.AsString)+','+
          QuotedStr(DataModule1.ADOQ_tempclass1.AsString)+','+
          QuotedStr(DataModule1.ADOQ_tempclass2.AsString)+','+
          DataModule1.ADOQ_templevel.AsString+','+
          QuotedStr(DataModule1.ADOQ_tempclass3.AsString)+
          ')';
          DataModule1.adoq_RDF_XML.ExecSQL;
          DataModule1.ADOQ_temp.Next;
        end;


    end;




end;
////////////////////////////////////////////////////////////////////////////////////////
procedure Tfrm_show_class.insert_object_prop_range;
var id:integer;
begin
    DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml where rdf like '+
    QuotedStr('%    <fowl:ObjectProperty rdf:ID="'+frm_main.e_new_property.Text+'">%');
    DataModule1.adoq_RDF_XML.Open;

    DataModule1.adoq_RDF_XML.First;
    id:=10;
    if DataModule1.adoq_RDF_XML.RecordCount=0 then
    begin

      DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml where rdf like '+
      QuotedStr('%    <fowl:ObjectProperty rdf:ID="'+frm_main.e_new_property.Text+'"/>%');
      DataModule1.adoq_RDF_XML.Open;

      if DataModule1.adoq_RDF_XML.RecordCount>0 then
      begin
        DataModule1.adoq_RDF_XML2.SQL.Text:='update fuzzy_rdf_xml  set rdf='+
        QuotedStr('    <fowl:ObjectProperty rdf:ID="'+frm_main.e_new_property.Text+'">')+
        ' where rdf like'+
        QuotedStr('%    <fowl:ObjectProperty rdf:ID="'+frm_main.e_new_property.Text+'"/>%');
        DataModule1.adoq_RDF_XML2.ExecSQL;



        DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
        QuotedStr('        <rdfs:range rdf:resource="#'+tree_class.Selected.Text+'"/>')+','+
        QuotedStr(tree_class.Selected.Text)+','+
        QuotedStr('range')+','+
        IntToStr(3)+','+
        QuotedStr(tree_class.Selected.Text)+
        ')';
        DataModule1.adoq_RDF_XML.ExecSQL;

        DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
        QuotedStr('    </fowl:ObjectProperty>')+','+
        QuotedStr(frm_main.e_new_property.Text)+','+
        QuotedStr('range')+','+
        IntToStr(3)+','+
        QuotedStr(frm_main.e_new_property.Text)+
        ')';
        DataModule1.adoq_RDF_XML.ExecSQL;
      end;

    end
    else
    begin
      id:=DataModule1.adoq_RDF_XMLid.AsInteger;
      
      DataModule1.ADOQ_temp.SQL.Text:='delete from temp';
      DataModule1.ADOQ_temp.ExecSQL;

      DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml  where id>'+IntToStr(id);
      DataModule1.adoq_RDF_XML.Open;

      
      while not DataModule1.adoq_RDF_XML.Eof do
      begin
        DataModule1.ADOQ_temp.SQL.Text:='insert into temp(rdf,class1,class2,level,class3) values('+
        QuotedStr(DataModule1.adoq_RDF_XMLrdf.AsString)+','+
        QuotedStr(DataModule1.adoq_RDF_XMLclass1.AsString)+','+
        QuotedStr(DataModule1.adoq_RDF_XMLclass2.AsString)+','+
        DataModule1.adoq_RDF_XMLlevel.AsString+','+
        QuotedStr(DataModule1.adoq_RDF_XMLclass3.AsString)+
        ')';
        DataModule1.ADOQ_temp.ExecSQL;
        DataModule1.adoq_RDF_XML.Next;
      end;

      DataModule1.adoq_RDF_XML.SQL.Text:='delete from fuzzy_rdf_xml  where id >'+IntToStr(id);
      DataModule1.adoq_RDF_XML.ExecSQL;


      ///////////////
      DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
      QuotedStr('        <rdfs:range>')+','+
      QuotedStr(frm_main.e_new_property.Text)+','+
      QuotedStr('range')+','+
      IntToStr(3)+','+
      QuotedStr(frm_main.e_new_property.Text)+
      ')';
      DataModule1.adoq_RDF_XML.ExecSQL;

      DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
      QuotedStr('            <fowl:Class>')+','+
      QuotedStr(frm_main.e_new_property.Text)+','+
      QuotedStr('range')+','+
      IntToStr(3)+','+
      QuotedStr(frm_main.e_new_property.Text)+
      ')';
      DataModule1.adoq_RDF_XML.ExecSQL;

      DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
      QuotedStr('                <fowl:unionOf rdf:parseType="Collection">')+','+
      QuotedStr(frm_main.e_new_property.Text)+','+
      QuotedStr('range')+','+
      IntToStr(3)+','+
      QuotedStr(frm_main.e_new_property.Text)+
      ')';
      DataModule1.adoq_RDF_XML.ExecSQL;
      /////////////////////

      DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
      QuotedStr('                    <fowl:Class rdf:about="#'+tree_class.Selected.Text+'"/>')+','+
      QuotedStr(frm_main.e_new_property.Text)+','+
      QuotedStr('range')+','+
      IntToStr(3)+','+
      QuotedStr(tree_class.Selected.Text)+
      ')';
      DataModule1.adoq_RDF_XML.ExecSQL;


      {//////////////// delete from temp ////////////}

        DataModule1.ADOQ_temp.SQL.Text:='delete from temp  where class3='+QuotedStr(frm_main.e_new_property.Text)+
        ' and class2='+QuotedStr('range')+

        ' and (rdf='+QuotedStr('                </fowl:unionOf>')+

        ' or rdf='+QuotedStr('            </fowl:Class>')+
        ' or rdf='+QuotedStr('        </rdfs:range>')+
        ' or rdf='+QuotedStr('    </fowl:ObjectProperty>')+



        ' or rdf='+QuotedStr('        <rdfs:range>')+
        ' or rdf='+QuotedStr('            <fowl:Class>')+
        ' or rdf='+QuotedStr('                <fowl:unionOf rdf:parseType="Collection">')+
        ')';
        DataModule1.ADOQ_temp.ExecSQL;


       DataModule1.ADOQ_temp2.SQL.Text:='select * from temp where class3='+QuotedStr(frm_main.e_new_property.Text)+
        ' and class2='+QuotedStr('range')+' and rdf like '+QuotedStr('        <rdfs:range rdf:resource=%');
       DataModule1.ADOQ_temp2.Open;

       while not DataModule1.ADOQ_temp2.Eof do
       begin
        DataModule1.ADOQ_temp.SQL.Text:='update temp set rdf='+
        QuotedStr('                    <fowl:Class rdf:about=#'+DataModule1.ADOQ_temp2class1.AsString+'"/>')+
        ' where id='+DataModule1.ADOQ_temp2id.AsString;
        DataModule1.ADOQ_temp.ExecSQL;
        DataModule1.ADOQ_temp2.Next;
       end;


        DataModule1.ADOQ_temp.SQL.Text:='select * from temp  where class3='+QuotedStr(frm_main.e_new_property.Text)+
        ' and class2='+QuotedStr('range') ;
        DataModule1.ADOQ_temp.Open;

        while not DataModule1.ADOQ_temp.Eof do
        begin
          DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
          QuotedStr(DataModule1.ADOQ_temprdf.AsString)+','+
          QuotedStr(DataModule1.ADOQ_tempclass1.AsString)+','+
          QuotedStr(DataModule1.ADOQ_tempclass2.AsString)+','+
          DataModule1.ADOQ_templevel.AsString+','+
          QuotedStr(DataModule1.ADOQ_tempclass3.AsString)+
          ')';
          DataModule1.adoq_RDF_XML.ExecSQL;
          DataModule1.ADOQ_temp.Next;
        end;

        DataModule1.ADOQ_temp.SQL.Text:='delete from temp where class3='+QuotedStr(frm_main.e_new_property.Text)+
        ' and class2='+QuotedStr('range');
        DataModule1.ADOQ_temp.ExecSQL;

         DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
        QuotedStr('                </fowl:unionOf>')+','+
        QuotedStr(frm_main.e_new_property.Text)+','+
        QuotedStr('range')+','+
        IntToStr(3)+','+
        QuotedStr(frm_main.e_new_property.Text)+
        ')';
        DataModule1.adoq_RDF_XML.ExecSQL;

        DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
        QuotedStr('            </fowl:Class>')+','+
        QuotedStr(frm_main.e_new_property.Text)+','+
        QuotedStr('range')+','+
        IntToStr(3)+','+
        QuotedStr(frm_main.e_new_property.Text)+
        ')';
        DataModule1.adoq_RDF_XML.ExecSQL;

        DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
        QuotedStr('        </rdfs:range>')+','+
        QuotedStr(frm_main.e_new_property.Text)+','+
        QuotedStr('range')+','+
        IntToStr(3)+','+
        QuotedStr(frm_main.e_new_property.Text)+
        ')';
        DataModule1.adoq_RDF_XML.ExecSQL;

        DataModule1.ADOQ_temp.SQL.Text:='delete from temp  where class1='+QuotedStr(frm_main.e_new_property.Text)+
        ' and rdf like '+QuotedStr('%    </fowl:ObjectProperty>%');
        DataModule1.ADOQ_temp.ExecSQL;

        DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml where  class1='+QuotedStr(frm_main.e_new_property.Text)+
        ' and rdf like '+ QuotedStr('%    </fowl:ObjectProperty>%');
        //' and class2='+QuotedStr('range')+

        DataModule1.adoq_RDF_XML.Open;

        if DataModule1.adoq_RDF_XML.RecordCount=0 then
        begin
          DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
          QuotedStr('    </fowl:ObjectProperty>')+','+
          QuotedStr(frm_main.e_new_property.Text)+','+
          QuotedStr('range')+','+
          IntToStr(3)+','+
          QuotedStr(frm_main.e_new_property.Text)+
          ')';
          DataModule1.adoq_RDF_XML.ExecSQL;
        end;

      {//////////////// delete from temp ////////////}

      ////////// other from temp to main  ////////////

        DataModule1.ADOQ_temp.SQL.Text:='select * from temp';
        DataModule1.ADOQ_temp.Open;

        while not DataModule1.ADOQ_temp.Eof do
        begin
          DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
          QuotedStr(DataModule1.ADOQ_temprdf.AsString)+','+
          QuotedStr(DataModule1.ADOQ_tempclass1.AsString)+','+
          QuotedStr(DataModule1.ADOQ_tempclass2.AsString)+','+
          DataModule1.ADOQ_templevel.AsString+','+
          QuotedStr(DataModule1.ADOQ_tempclass3.AsString)+
          ')';
          DataModule1.adoq_RDF_XML.ExecSQL;
          DataModule1.ADOQ_temp.Next;
        end;


    end;


end;

////////////////////////////////

procedure Tfrm_show_class.insert_for_disjoint;
var id,i:integer;
    s,s1:string;
begin
   DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml  where rdf like '+
    QuotedStr('%    <fowl:Class rdf:ID="'+trim(frm_main.tree_class.Selected.Text)+'"/>%');
   DataModule1.adoq_RDF_XML.Open;

   DataModule1.adoq_RDF_XML.First;
   id:=DataModule1.adoq_RDF_XMLid.AsInteger;

   DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml  where id>'+IntToStr(id);
   DataModule1.adoq_RDF_XML.Open;

   while not DataModule1.adoq_RDF_XML.Eof do
   begin
    DataModule1.ADOQ_temp.SQL.Text:='insert into temp(rdf,class1,class2,level,class3) values('+
    QuotedStr(DataModule1.adoq_RDF_XMLrdf.AsString)+','+
    QuotedStr(DataModule1.adoq_RDF_XMLclass1.AsString)+','+
    QuotedStr(DataModule1.adoq_RDF_XMLclass2.AsString)+','+
    DataModule1.adoq_RDF_XMLlevel.AsString+','+
    QuotedStr(DataModule1.adoq_RDF_XMLclass3.AsString)+
    ')';
    DataModule1.ADOQ_temp.ExecSQL;
    DataModule1.adoq_RDF_XML.Next;
   end;

   DataModule1.adoq_RDF_XML2.SQL.Text:='delete from fuzzy_rdf_xml  where id >'+IntToStr(id);
   DataModule1.adoq_RDF_XML2.ExecSQL;


   DataModule1.ADOQ_temp.SQL.Text:=' select * from temp order by id';
   DataModule1.ADOQ_temp.Open;

   DataModule1.ADOQ_temp.First;

   s:=DataModule1.ADOQ_temprdf.AsString;

   if (DataModule1.ADOQ_temprdf.AsString='    </fowl:Class>') then
   begin
    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level) values('+
     QuotedStr('        <fowl:disjointWith rdf:resource="#'+trim(tree_class.Selected.Text)+'"/>')+
     ','+QuotedStr(frm_main.tree_class.Selected.Text)+','+IntToStr(1)+')';

     DataModule1.adoq_RDF_XML.ExecSQL;
   end
   else
   begin
    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level) values('+
     QuotedStr('        <fowl:disjointWith rdf:resource="#'+trim(tree_class.Selected.Text)+'"/>')+
     ','+QuotedStr(frm_main.tree_class.Selected.Text)+','+IntToStr(1)+')';

     DataModule1.adoq_RDF_XML.ExecSQL;

     s1:='';
     for i:=1 to 16 do
     s1:=s1+s[i];
     if (s1<>'        <fowl:di') then
     begin
      DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level) values('+
       QuotedStr('    </fowl:Class>')+
      ','+QuotedStr(frm_main.tree_class.Selected.Text)+','+IntToStr(1)+')';
      DataModule1.adoq_RDF_XML.ExecSQL;
     end;
      DataModule1.adoq_RDF_XML.SQL.Text:='update fuzzy_rdf_xml set level='+IntToStr(1)+' where id='+IntToStr(id);
      DataModule1.adoq_RDF_XML.ExecSQL;

   end;

//////////////////////////////////
   DataModule1.ADOQ_temp.SQL.Text:='select * from temp  order by id';
   DataModule1.ADOQ_temp.Open;

   while not DataModule1.ADOQ_temp.Eof do
   begin
    DataModule1.adoq_RDF_XML.SQL.Text:='insert fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
    QuotedStr(DataModule1.ADOQ_temprdf.AsString)+','+
    QuotedStr(DataModule1.ADOQ_tempclass1.AsString)+','+
    QuotedStr(DataModule1.ADOQ_tempclass2.AsString)+','+
    DataModule1.ADOQ_templevel.AsString+','+
    QuotedStr(DataModule1.ADOQ_tempclass3.AsString)+
    ')';
    DataModule1.adoq_RDF_XML.ExecSQL;
    DataModule1.ADOQ_temp.Next;
   end;

   DataModule1.adoq_RDF_XML2.SQL.Text:='delete from temp';
   DataModule1.adoq_RDF_XML2.ExecSQL;


   ///////////////////////////////////// second class in disjoint ////////////////

   DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml  where rdf like '+
    QuotedStr('%    <fowl:Class rdf:ID="'+trim(tree_class.Selected.Text)+'"/>%');
   DataModule1.adoq_RDF_XML.Open;

   DataModule1.adoq_RDF_XML.First;
   id:=DataModule1.adoq_RDF_XMLid.AsInteger;

   DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml  where id>'+IntToStr(id);
   DataModule1.adoq_RDF_XML.Open;

   while not DataModule1.adoq_RDF_XML.Eof do
   begin
    DataModule1.ADOQ_temp.SQL.Text:='insert into temp(rdf,class1,class2,level,class3) values('+
    QuotedStr(DataModule1.adoq_RDF_XMLrdf.AsString)+','+
    QuotedStr(DataModule1.adoq_RDF_XMLclass1.AsString)+','+
    QuotedStr(DataModule1.adoq_RDF_XMLclass2.AsString)+','+
    DataModule1.adoq_RDF_XMLlevel.AsString+','+
    QuotedStr(DataModule1.adoq_RDF_XMLclass3.AsString)+
    ')';
    DataModule1.ADOQ_temp.ExecSQL;
    DataModule1.adoq_RDF_XML.Next;
   end;

   DataModule1.adoq_RDF_XML2.SQL.Text:='delete from fuzzy_rdf_xml  where id >'+IntToStr(id);
   DataModule1.adoq_RDF_XML2.ExecSQL;


   DataModule1.ADOQ_temp.SQL.Text:=' select * from temp  order by id';
   DataModule1.ADOQ_temp.Open;

   DataModule1.ADOQ_temp.First;

   s:=DataModule1.ADOQ_temprdf.AsString;

   if (DataModule1.ADOQ_temprdf.AsString='    </fowl:Class>') then
   begin
    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level) values('+
     QuotedStr('        <fowl:disjointWith rdf:resource="#'+trim(frm_main.tree_class.Selected.Text)+'"/>')+
     ','+QuotedStr(tree_class.Selected.Text)+','+IntToStr(1)+')';

     DataModule1.adoq_RDF_XML.ExecSQL;
   end
   else
   begin

    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level) values('+
     QuotedStr('        <fowl:disjointWith rdf:resource="#'+trim(frm_main.tree_class.Selected.Text)+'"/>')+
     ','+QuotedStr(tree_class.Selected.Text)+','+IntToStr(1)+')';

     DataModule1.adoq_RDF_XML.ExecSQL;

     s1:='';
     if s<>'' then
      for i:=1 to 16 do
        s1:=s1+s[i];
     if (s1<>'        <fowl:dis') then
     begin
      DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level) values('+
      QuotedStr('    </fowl:Class>')+
      ','+QuotedStr(tree_class.Selected.Text)+','+IntToStr(1)+')';
      DataModule1.adoq_RDF_XML.ExecSQL;
     end;
      DataModule1.adoq_RDF_XML.SQL.Text:='update fuzzy_rdf_xml set level='+IntToStr(1)+' where id='+IntToStr(id);
      DataModule1.adoq_RDF_XML.ExecSQL;

   end;

//////////////////////////////////
   DataModule1.ADOQ_temp.SQL.Text:='select * from temp  order by id';
   DataModule1.ADOQ_temp.Open;

   while not DataModule1.ADOQ_temp.Eof do
   begin
    DataModule1.adoq_RDF_XML.SQL.Text:='insert fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
    QuotedStr(DataModule1.ADOQ_temprdf.AsString)+','+
    QuotedStr(DataModule1.ADOQ_tempclass1.AsString)+','+
    QuotedStr(DataModule1.ADOQ_tempclass2.AsString)+','+
    DataModule1.ADOQ_templevel.AsString+','+
    QuotedStr(DataModule1.ADOQ_tempclass3.AsString)+
    ')';
    DataModule1.adoq_RDF_XML.ExecSQL;
    DataModule1.ADOQ_temp.Next;
   end;

   DataModule1.adoq_RDF_XML2.SQL.Text:='delete from temp';
   DataModule1.adoq_RDF_XML2.ExecSQL;
end;

procedure Tfrm_show_class.FormShow(Sender: TObject);
begin
  tree_class.Items:=frm_main.tree_class.Items;
  tree_class.FullExpand;
end;



procedure Tfrm_show_class.suiButton1Click(Sender: TObject);
begin
  if l_type.Caption='disjoint' then
  begin
    insert_for_disjoint;

    DataModule1.ADOQ_property_between.SQL.Text:='insert into propertis_between(property_name,from_class,to_class)'+
    ' values('+QuotedStr('disjoint')+','+QuotedStr(frm_main.tree_class.Selected.Text)+','+QuotedStr(tree_class.Selected.Text)+')';
    DataModule1.ADOQ_property_between.ExecSQL;
    
    frm_main.disjoint.Items.Add(nil,tree_class.Selected.Text);
  end;

  if l_type.Caption='obj_prop_domain' then
  begin
    insert_object_prop_domain;
    frm_main.obj_prop_domain.Items.Add(nil,tree_class.Selected.Text);
  end;

    if l_type.Caption='obj_prop_range' then
  begin
    insert_object_prop_range;
    frm_main.obj_prop_range.Items.Add(nil,tree_class.Selected.Text);
  end;
  Close;
end;

end.
