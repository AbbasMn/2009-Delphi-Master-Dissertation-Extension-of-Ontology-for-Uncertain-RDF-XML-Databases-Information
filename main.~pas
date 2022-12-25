unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SUIPageControl, ExtCtrls, SUITabControl, ComCtrls, SUITreeView,
  SUISideChannel, SUIImagePanel, StdCtrls, ImgList, SUIButton, SUIEdit,
  SUIDlg, SUIGroupBox, SUIListView, DB, ADODB, SUIComboBox, SUIMemo;

type
  Tfrm_main = class(TForm)
    page_kol: TsuiPageControl;
    suiTabSheet1: TsuiTabSheet;
    suiTabSheet2: TsuiTabSheet;
    suiTabSheet3: TsuiTabSheet;
    ImageList1: TImageList;
    suiMessageDialog1: TsuiMessageDialog;
    class_panel: TsuiPanel;
    Label1: TLabel;
    tree_class: TsuiTreeView;
    suiImageButton11: TsuiImageButton;
    suiImageButton3: TsuiImageButton;
    suiGroupBox1: TsuiGroupBox;
    disjoint: TsuiTreeView;
    suiImageButton2: TsuiImageButton;
    suiImageButton1: TsuiImageButton;
    ImageList2: TImageList;
    ImageList3: TImageList;
    g_class: TsuiGroupBox;
    L_class_count: TLabel;
    Label2: TLabel;
    l_class_name: TLabel;
    suiButton1: TsuiButton;
    e_new_class_name: TsuiEdit;
    suiGroupBox2: TsuiGroupBox;
    obj_prop_domain: TsuiTreeView;
    suiImageButton8: TsuiImageButton;
    suiImageButton9: TsuiImageButton;
    obj_prop_range: TsuiTreeView;
    Label10: TLabel;
    Label11: TLabel;
    suiImageButton10: TsuiImageButton;
    suiImageButton12: TsuiImageButton;
    g_prop: TsuiGroupBox;
    L_prperty_count: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    suiButton2: TsuiButton;
    e_new_property: TsuiEdit;
    property_panel: TsuiPanel;
    Label3: TLabel;
    page_property: TsuiPageControl;
    suiTabSheet4: TsuiTabSheet;
    Label7: TLabel;
    tree_obj_proprty: TsuiTreeView;
    btn_obj_pro_add1: TsuiImageButton;
    btn_obj_pro_delete1: TsuiImageButton;
    suiImageButton13: TsuiImageButton;
    Label4: TLabel;
    e_inverse: TsuiEdit;
    btn_obj_pro_add: TsuiImageButton;
    btn_obj_pro_delete: TsuiImageButton;
    Label12: TLabel;
    Label13: TLabel;
    combo_inq_type: TsuiComboBox;
    l_inequivalent: TLabel;
    l_inq_type: TLabel;
    suiButton3: TsuiButton;
    l_fuzzy_value: TLabel;
    ch_Functional: TsuiCheckBox;
    ch_InverseFunctional: TsuiCheckBox;
    ch_Symmetric: TsuiCheckBox;
    ch_Transitive: TsuiCheckBox;
    suiPanel1: TsuiPanel;
    suiPanel2: TsuiPanel;
    Label14: TLabel;
    tree_class2: TsuiTreeView;
    tree_individual: TsuiTreeView;
    Label9: TLabel;
    suiImageButton4: TsuiImageButton;
    suiImageButton5: TsuiImageButton;
    suiGroupBox3: TsuiGroupBox;
    l_idividual_count: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    e_individual: TsuiEdit;
    suiButton4: TsuiButton;
    suiMemo1: TsuiMemo;
    suiMemo_indi: TsuiMemo;
    Label8: TLabel;
    Label18: TLabel;
    suiMemo_relation: TsuiMemo;
    suiButton5: TsuiButton;
    suiButton6: TsuiButton;
    suiButton7: TsuiButton;
    procedure FormShow(Sender: TObject);



    procedure Button1Click(Sender: TObject);
    procedure class_hierarchy_from_db;


    procedure show_disjoint_class;
    procedure suiImageButton2Click(Sender: TObject);
    procedure suiImageButton8Click(Sender: TObject);
    procedure suiImageButton12Click(Sender: TObject);
    procedure suiButton1Click(Sender: TObject);
    procedure suiButton2Click(Sender: TObject);

    procedure suiImageButton3Click(Sender: TObject);

    procedure suiImageButton13Click(Sender: TObject);
    procedure suiImageButton11Click(Sender: TObject);
    procedure btn_obj_pro_addClick(Sender: TObject);
    procedure show_object_propeties;
    procedure show_fuzzy_property;
    procedure suiButton3Click(Sender: TObject);
    procedure change_property_type(s:string);
    procedure ch_FunctionalClick(Sender: TObject);
    procedure ch_InverseFunctionalClick(Sender: TObject);
    procedure ch_SymmetricClick(Sender: TObject);
    procedure ch_TransitiveClick(Sender: TObject);
    procedure delete_property_type(s:string);
    procedure suiImageButton1Click(Sender: TObject);
    procedure suiImageButton9Click(Sender: TObject);
    procedure show_domain;
    procedure show_range;
    procedure find_inverse_of;
    procedure Button2Click(Sender: TObject);
    procedure tree_classChange(Sender: TObject; Node: TTreeNode);
    procedure tree_class2Change(Sender: TObject; Node: TTreeNode);
    procedure btn_obj_pro_add1Click(Sender: TObject);
    procedure suiImageButton4Click(Sender: TObject);
    procedure suiButton4Click(Sender: TObject);
    procedure tree_obj_proprtyChange(Sender: TObject; Node: TTreeNode);
    procedure tree_individualChange(Sender: TObject; Node: TTreeNode);
    procedure btn_obj_pro_delete1Click(Sender: TObject);
    procedure suiImageButton5Click(Sender: TObject);
    procedure suiImageButton10Click(Sender: TObject);
    procedure show_relation_of_class;
    procedure suiButton5Click(Sender: TObject);
    procedure suiButton6Click(Sender: TObject);
    procedure suiButton7Click(Sender: TObject);

  private
    { Private declarations }
  public
     fuzzy_value:Real;
     inequinalent_type:string;
    { Public declarations }
  end;

var
  frm_main: Tfrm_main;

implementation

uses StrUtils, unt_rdf_xml_code, madule, unt_show_class, unt_inequivalent,
  unt_algorithm, unt_rfd_matrixpas;

{$R *.dfm}
procedure Tfrm_main.show_relation_of_class;
begin
    DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml where class1='+
    QuotedStr(trim(tree_class2.Selected.Text))+
    ' and class2 in ('+
    QuotedStr('4-1')+','+QuotedStr('4-2')+','+QuotedStr('4-3')+')';
    DataModule1.adoq_RDF_XML.Open;

    DataModule1.adoq_RDF_XML.First;
    suiMemo_relation.Clear;
    while not DataModule1.adoq_RDF_XML.Eof do
    begin
      suiMemo_relation.Lines.Add(DataModule1.adoq_RDF_XMLrdf.AsString);
      DataModule1.adoq_RDF_XML.Next;
    end;
end;

procedure Tfrm_main.find_inverse_of;
begin
   DataModule1.ADOQ_property_between.SQL.Text:='select * from propertis_between where property_name='+
   QuotedStr(tree_obj_proprty.Selected.Text);
   DataModule1.ADOQ_property_between.Open;

   if DataModule1.ADOQ_property_between.RecordCount<>0 then
    e_inverse.Text:=DataModule1.ADOQ_property_betweeninverse.AsString
   else
    e_inverse.Text:='';
end;

procedure Tfrm_main.show_domain;
begin
      obj_prop_domain.Items.Clear;
       DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml where class1='+
       QuotedStr(tree_obj_proprty.Selected.Text)+' and class2='+QuotedStr('domain')+
       ' and class3<>'+QuotedStr(tree_obj_proprty.Selected.Text);
        DataModule1.adoq_RDF_XML.open;

       while not DataModule1.adoq_RDF_XML.Eof do
       begin
        obj_prop_domain.Items.Add(nil,DataModule1.adoq_RDF_XMLclass3.Text);
        DataModule1.adoq_RDF_XML.Next;
       end;
end;

procedure Tfrm_main.show_range;
begin
      obj_prop_range.Items.Clear;
       DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml where class1='+
       QuotedStr(tree_obj_proprty.Selected.Text)+' and class2='+QuotedStr('range')+
       ' and class3<>'+QuotedStr(tree_obj_proprty.Selected.Text);
       DataModule1.adoq_RDF_XML.Open;

       while not DataModule1.adoq_RDF_XML.Eof do
       begin
        obj_prop_range.Items.Add(nil,DataModule1.adoq_RDF_XMLclass3.Text);
        DataModule1.adoq_RDF_XML.Next;
       end;
end;

procedure Tfrm_main.delete_property_type(s:string);
begin
  if s='Transitive' then
  begin
       DataModule1.adoq_RDF_XML2.SQL.Text:='delete from fuzzy_rdf_xml where class1='+
       QuotedStr(e_new_property.Text)+' and class2='+QuotedStr('Transitive');
       DataModule1.adoq_RDF_XML2.ExecSQL;
  end;

  if s='Symmetric' then
  begin
       DataModule1.adoq_RDF_XML2.SQL.Text:='delete from fuzzy_rdf_xml where class1='+
       QuotedStr(e_new_property.Text)+' and class2='+QuotedStr('Symmetric');
       DataModule1.adoq_RDF_XML2.ExecSQL;
  end;

  if s='Functional' then
  begin
       DataModule1.adoq_RDF_XML2.SQL.Text:='delete from fuzzy_rdf_xml where class1='+
       QuotedStr(e_new_property.Text)+' and class2='+QuotedStr('Functional');
       DataModule1.adoq_RDF_XML2.ExecSQL;
  end;

  if s='InverseFunctional' then
  begin
       DataModule1.adoq_RDF_XML2.SQL.Text:='delete from fuzzy_rdf_xml where class1='+
       QuotedStr(e_new_property.Text)+' and class2='+QuotedStr('InverseFunctional');
       DataModule1.adoq_RDF_XML2.ExecSQL;
  end;
end;

procedure Tfrm_main.change_property_type(s:string);
var id:integer;
    has_end_tag:boolean;
begin
    DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml where rdf like '+
    QuotedStr('%    <fowl:ObjectProperty rdf:ID="'+e_new_property.Text+'">%');
    DataModule1.adoq_RDF_XML.Open;

    if DataModule1.adoq_RDF_XML.RecordCount>0 then
    begin
      DataModule1.adoq_RDF_XML.First;
      has_end_tag:=false ;
      id:=DataModule1.adoq_RDF_XMLid.AsInteger;
    end
    else
    begin
      has_end_tag:=true;
      DataModule1.adoq_RDF_XML2.SQL.Text:='select * from fuzzy_rdf_xml  where rdf like'+
      QuotedStr('%    <fowl:ObjectProperty rdf:ID="'+e_new_property.Text+'"/>%');
      DataModule1.adoq_RDF_XML2.Open;
      DataModule1.adoq_RDF_XML2.First;
      id:=DataModule1.adoq_RDF_XML2id.AsInteger;

       DataModule1.adoq_RDF_XML2.SQL.Text:='update fuzzy_rdf_xml  set rdf='+
       QuotedStr('    <fowl:ObjectProperty rdf:ID="'+e_new_property.Text+'">')+
       ' where rdf like'+
      QuotedStr('%    <fowl:ObjectProperty rdf:ID="'+e_new_property.Text+'"/>%');
      DataModule1.adoq_RDF_XML2.ExecSQL;
    end;


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

   if s='Transitive' then
   begin
    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
    QuotedStr('        <rdf:type rdf:resource="&fowl;TransitiveProperty"/>')+
    ','+QuotedStr(trim(tree_obj_proprty.Selected.Text))+
    ','+QuotedStr('Transitive')+
    ','+IntToStr(3)+
    ','+QuotedStr(trim(tree_obj_proprty.Selected.Text))+')';
    dataModule1.adoq_RDF_XML.ExecSQL;
   end;


   if s='Symmetric' then
   begin
    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
    QuotedStr('        <rdf:type rdf:resource="&fowl;SymmetricProperty"/>')+
    ','+QuotedStr(trim(tree_obj_proprty.Selected.Text))+
    ','+QuotedStr('Symmetric')+
    ','+IntToStr(3)+
    ','+QuotedStr(trim(tree_obj_proprty.Selected.Text))+')';
    dataModule1.adoq_RDF_XML.ExecSQL;
   end;

   if s='Functional' then
   begin
    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
    QuotedStr('        <rdf:type rdf:resource="&fowl;FunctionalProperty"/>')+
    ','+QuotedStr(trim(tree_obj_proprty.Selected.Text))+
    ','+QuotedStr('Functional')+
    ','+IntToStr(3)+
    ','+QuotedStr(trim(tree_obj_proprty.Selected.Text))+')';
    dataModule1.adoq_RDF_XML.ExecSQL;
   end;

   if s='InverseFunctional' then
   begin
    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
    QuotedStr('        <rdf:type rdf:resource="&fowl;InverseFunctionalProperty"/>')+
    ','+QuotedStr(trim(tree_obj_proprty.Selected.Text))+
    ','+QuotedStr('InverseFunctional')+
    ','+IntToStr(3)+
    ','+QuotedStr(trim(tree_obj_proprty.Selected.Text))+')';
    dataModule1.adoq_RDF_XML.ExecSQL;
   end;

   if  has_end_tag then
   begin
    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
    QuotedStr('    </owl:ObjectProperty>')+
    ','+QuotedStr(trim(tree_obj_proprty.Selected.Text))+
    ','+QuotedStr('objectproperty')+
    ','+IntToStr(3)+
    ','+QuotedStr(trim(tree_obj_proprty.Selected.Text))+')';
    dataModule1.adoq_RDF_XML.ExecSQL;
   end; 


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


procedure Tfrm_main.show_fuzzy_property;
begin
    DataModule1.ADOQ_class.SQL.Text:='select * from classes where class_name='+
    QuotedStr(tree_class.Selected.Text);
    DataModule1.ADOQ_class.Open;

    l_fuzzy_value.Caption:=DataModule1.ADOQ_classfuzzy_value.AsString;
    l_inq_type.Caption:=DataModule1.ADOQ_classinequivalent_type.AsString;
end;

/////////////////////////
procedure Tfrm_main.show_object_propeties;
var nod_:TTreeNode;
begin
   DataModule1.ADOQ_property_between.SQL.Text:='select * from propertis_between where property_type='+
   QuotedStr('objectproperty')+' and parent='+QuotedStr('no')+
   ' order by id';
   DataModule1.ADOQ_property_between.Open;

   DataModule1.ADOQ_property_between.First;

   while not DataModule1.ADOQ_property_between.Eof do
   begin
    tree_obj_proprty.Items.Add(nil,DataModule1.ADOQ_property_betweenproperty_name.AsString);
    DataModule1.ADOQ_property_between.Next;
   end;

   DataModule1.ADOQ_property_between.SQL.Text:='select * from propertis_between where property_type='+
   QuotedStr('objectproperty')+' and parent<>'+QuotedStr('no')+
   ' order by id';
   DataModule1.ADOQ_property_between.Open;

   DataModule1.ADOQ_property_between.First;

   while not DataModule1.ADOQ_property_between.Eof do
   begin
    nod_.Text:=DataModule1.ADOQ_property_betweenparent.AsString;
    
    tree_obj_proprty.Items.AddChild(nod_,DataModule1.ADOQ_property_betweenproperty_name.AsString);
    DataModule1.ADOQ_property_between.Next;
   end;
end;

procedure Tfrm_main.show_disjoint_class;
begin
   DataModule1.ADOQ_property_between.SQL.Text:='select * from propertis_between where from_class='+
   QuotedStr(tree_class.Selected.Text)+
   ' and property_name='+QuotedStr('disjoint');
   DataModule1.ADOQ_property_between.Open;

   DataModule1.ADOQ_property_between.First;
   disjoint.Items.Clear;

   while not DataModule1.ADOQ_property_between.Eof do
   begin
     disjoint.Items.Add(nil,DataModule1.ADOQ_property_betweento_class.AsString);
     DataModule1.ADOQ_property_between.Next;
   end;
   ///////////////////////////////////////////////////
   DataModule1.ADOQ_property_between.SQL.Text:='select * from propertis_between where to_class='+
   QuotedStr(tree_class.Selected.Text)+
   ' and property_name='+QuotedStr('disjoint');
   DataModule1.ADOQ_property_between.Open;

   DataModule1.ADOQ_property_between.First;


   while not DataModule1.ADOQ_property_between.Eof do
   begin
     disjoint.Items.Add(nil,DataModule1.ADOQ_property_betweenfrom_class.AsString);
     DataModule1.ADOQ_property_between.Next;
   end;
end;

procedure Tfrm_main.class_hierarchy_from_db;
begin
  DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml where rdf like '+
  QuotedStr('%    <fowl:Class rdf:ID="%"/>')+
  ' order by id' ;
  DataModule1.adoq_RDF_XML.Open;

  DataModule1.adoq_RDF_XML.First;

  while not DataModule1.adoq_RDF_XML.Eof do
  begin
   //////////////
  end;
end;


{////////////////////////////////////////////////////}

procedure Tfrm_main.FormShow(Sender: TObject);
begin
  //frm_main.WindowState:=wsMaximized;
  L_class_count.Caption:='1';
  L_prperty_count.Caption:='1';
  l_idividual_count.Caption:='1';
  l_class_name.Caption:='http://www.owl-ontologies.com/fowl.owl#';
  e_new_class_name.Text:='Thing';
  page_kol.ActivePageIndex:=0;

  show_object_propeties;

  tree_class.FullExpand;
  tree_class2.FullExpand;
  frm_rdf_xml_code.show_rdf_cod;

end;







procedure Tfrm_main.Button1Click(Sender: TObject);
begin
   frm_rdf_xml_code.ShowModal;
end;















procedure Tfrm_main.suiImageButton2Click(Sender: TObject);
begin
  frm_show_class.l_type.Caption:='disjoint';
  frm_show_class.Show;
  frm_rdf_xml_code.show_rdf_cod;
end;

procedure Tfrm_main.suiImageButton8Click(Sender: TObject);
begin
  frm_show_class.l_type.Caption:='obj_prop_domain';
  frm_show_class.Show;
  frm_rdf_xml_code.show_rdf_cod;  
end;

procedure Tfrm_main.suiImageButton12Click(Sender: TObject);
begin
  frm_show_class.l_type.Caption:='obj_prop_range';
  frm_show_class.Show;
  frm_rdf_xml_code.show_rdf_cod;  
end;

procedure Tfrm_main.suiButton1Click(Sender: TObject);
  var old:string;
  begin
  if (tree_class.Selected.Text='fowl: Thing') then
  begin
    suiMessageDialog1.Text:='this  name can not be changed';
    suiMessageDialog1.ShowModal;
    e_new_class_name.Text:='Thing';
  end
  else
  begin
   if trim(e_new_class_name.Text)='' then
   begin
    suiMessageDialog1.Text:='Enter  name for class';
    suiMessageDialog1.ShowModal;
    Exit;
   end;

   DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml  where rdf like '+
    QuotedStr('%    <fowl:Class rdf:ID="'+trim(e_new_class_name.Text)+'"/>%');
   DataModule1.adoq_RDF_XML.Open;

   if DataModule1.adoq_RDF_XML.RecordCount>0 then
   begin
    suiMessageDialog1.Text:='This class name exists';
    suiMessageDialog1.ShowModal;
    Exit;
   end;

    old:=trim(tree_class.Selected.Text);

    DataModule1.adoq_RDF_XML.SQL.Text:='update fuzzy_rdf_xml set rdf='+
    QuotedStr('         <fowl:membershipOf rdf:resource="#'+trim(e_new_class_name.Text)+'"/>')+
    ', class3='+QuotedStr(trim(e_new_class_name.Text))+
    ' where rdf like '+
    QuotedStr('%         <fowl:membershipOf rdf:resource="#'+trim(old)+'"/>%');

    DataModule1.adoq_RDF_XML.ExecSQL;


    DataModule1.adoq_RDF_XML.SQL.Text:='update fuzzy_rdf_xml set rdf='+
    QuotedStr('    <fowl:Class rdf:ID="'+trim(e_new_class_name.Text)+'"/>')+
    ', class1='+QuotedStr(trim(e_new_class_name.Text))+
    ' where rdf like '+
    QuotedStr('%    <fowl:Class rdf:ID="'+trim(old)+'"/>%');

    DataModule1.adoq_RDF_XML.ExecSQL;


    DataModule1.adoq_RDF_XML.SQL.Text:='update fuzzy_rdf_xml set rdf='+
    QuotedStr('        <rdfs:subClassOf rdf:resource="#'+trim(e_new_class_name.Text)+'"/>')+
    ', class1='+QuotedStr(trim(e_new_class_name.Text))+
     ' where rdf like '+
    QuotedStr('        <rdfs:subClassOf rdf:resource="#'+trim(old)+'"/>');

    DataModule1.adoq_RDF_XML.ExecSQL;

    DataModule1.ADOQ_class.SQL.Text:='update classes set class_name='+QuotedStr(trim(e_new_class_name.Text))+
    ' where class_name='+QuotedStr(old);
    DataModule1.ADOQ_class.ExecSQL;

    DataModule1.ADOQ_class.SQL.Text:='update classes set parent='+QuotedStr(trim(e_new_class_name.Text))+
    ' where parent='+QuotedStr(old);
    DataModule1.ADOQ_class.ExecSQL;

    tree_class.Selected.Text:=trim(e_new_class_name.Text);
    tree_class.Update;
  end;

    tree_class2.Items:=tree_class.Items;
    frm_show_class.tree_class.Items:=tree_class.Items;

    tree_class2.Refresh;
    frm_show_class.tree_class.Refresh;
    frm_rdf_xml_code.show_rdf_cod;
end;

procedure Tfrm_main.suiButton2Click(Sender: TObject);
  var old:string;
  begin

   if trim(e_new_property.Text)='' then
   begin
    suiMessageDialog1.Text:='Enter  name for property';
    suiMessageDialog1.ShowModal;
    Exit;
   end;

   DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml  where rdf='+
    QuotedStr('    <fowl:ObjectProperty rdf:ID="'+trim(e_new_property.Text)+'"/>%');
   DataModule1.adoq_RDF_XML.Open;

   if DataModule1.adoq_RDF_XML.RecordCount>0 then
   begin
    suiMessageDialog1.Text:='This property name exists';
    suiMessageDialog1.ShowModal;
    Exit;
   end;

    old:=trim(tree_obj_proprty.Selected.Text);


    DataModule1.adoq_RDF_XML.SQL.Text:='update fuzzy_rdf_xml set class1='+QuotedStr(trim(e_new_property.Text))+
    ' where class1='+QuotedStr(old);
    DataModule1.adoq_RDF_XML.ExecSQL;

    DataModule1.adoq_RDF_XML.SQL.Text:='update fuzzy_rdf_xml set class3='+QuotedStr(trim(e_new_property.Text))+
    ' where class3='+QuotedStr(old);
    DataModule1.adoq_RDF_XML.ExecSQL;

    DataModule1.adoq_RDF_XML.SQL.Text:='update fuzzy_rdf_xml set rdf='+
    QuotedStr('    <fowl:ObjectProperty rdf:ID="'+trim(e_new_property.Text)+'"/>')+
    ', class1='+QuotedStr(trim(e_new_property.Text))+
    ' where rdf like '+
    QuotedStr('    <fowl:ObjectProperty rdf:ID="'+trim(old)+'"/>%');

    DataModule1.adoq_RDF_XML.ExecSQL;

    DataModule1.adoq_RDF_XML.SQL.Text:='update fuzzy_rdf_xml set rdf='+
    QuotedStr('    <fowl:ObjectProperty rdf:ID="'+trim(e_new_property.Text)+'">')+
    ', class1='+QuotedStr(trim(e_new_property.Text))+
    ' where rdf like '+
    QuotedStr('    <fowl:ObjectProperty rdf:ID="'+trim(old)+'">%');

    DataModule1.adoq_RDF_XML.ExecSQL;

    DataModule1.adoq_RDF_XML.SQL.Text:='update fuzzy_rdf_xml set rdf='+
    QuotedStr('        <rdfs:subPropertyOf rdf:resource="#'+trim(e_new_property.Text)+'"/>')+
    ', class1='+QuotedStr(trim(e_new_property.Text))+
     ' where rdf like '+
    QuotedStr('        <rdfs:subPropertyOf rdf:resource="#'+trim(old)+'"/>');

    DataModule1.adoq_RDF_XML.ExecSQL;

    DataModule1.ADOQ_property_between.SQL.Text:='update propertis_between set property_name='+
    QuotedStr(trim(e_new_property.Text))+
    ' where property_name='+QuotedStr(old);
    DataModule1.ADOQ_property_between.ExecSQL;

    DataModule1.ADOQ_property_between.SQL.Text:='update propertis_between set parent='+
    QuotedStr(trim(e_new_property.Text))+
    ' where parent='+QuotedStr(old);
    DataModule1.ADOQ_property_between.ExecSQL;

    tree_obj_proprty.Selected.Text:=trim(e_new_property.Text);
    tree_obj_proprty.Update;
    frm_rdf_xml_code.show_rdf_cod;
end;



procedure Tfrm_main.suiImageButton3Click(Sender: TObject);
var index_:integer;
    s:string;
begin
  e_new_class_name.Text:='newclass'+L_class_count.Caption;

  frm_inequivalent.l_type.Caption:='class';
  fuzzy_value:=0;





  if tree_class.Selected.Text='fowl:Thing' then
  begin
    s:=tree_class.Selected.Text;
    frm_inequivalent.l_type.Caption:='class';
    fuzzy_value:=1;
    inequinalent_type:='Equivalent';

    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level,class2,class3) values('+
    QuotedStr('    <fowl:Class rdf:ID="'+trim(e_new_class_name.Text)+'"/>')+
    ','+QuotedStr(trim(e_new_class_name.Text))+','+IntToStr(2)+
    ','+QuotedStr(trim(e_new_class_name.Text))+
    ','+QuotedStr(trim(e_new_class_name.Text))+
    ')';
    DataModule1.adoq_RDF_XML.ExecSQL;


    DataModule1.adoq_RDF_XML.SQL.Text:=' insert into fuzzy_rdf_xml(rdf,class1,level,class2,class3) values('+
    QuotedStr('        <rdfs:subClassOf rdf:resource="#fowl::Thing"/>')+
    ','+QuotedStr(trim(e_new_class_name.Text))+','+IntToStr(2)+
    ','+QuotedStr(trim(e_new_class_name.Text))+
    ','+QuotedStr(trim(e_new_class_name.Text))+
    ')';
    DataModule1.adoq_RDF_XML.ExecSQL;


    DataModule1.adoq_RDF_XML.SQL.Text:=' insert into fuzzy_rdf_xml(rdf,class1,level,class2,class3) values('+
    QuotedStr('        <fowl:'+inequinalent_type+' fowl:value='+FloatToStr(1)+'/>')+
    ','+QuotedStr(trim(e_new_class_name.Text))+','+IntToStr(2)+
    ','+QuotedStr(trim(e_new_class_name.Text))+
    ','+QuotedStr(trim(e_new_class_name.Text))+
    ')';
   DataModule1.adoq_RDF_XML.ExecSQL;


    DataModule1.adoq_RDF_XML.SQL.Text:=' insert into fuzzy_rdf_xml(rdf,class1,level,class2,class3) values('+
    QuotedStr('    </fowl:class>')+
    ','+QuotedStr(trim(e_new_class_name.Text))+','+IntToStr(2)+
    ','+QuotedStr(trim(e_new_class_name.Text))+
    ','+QuotedStr(trim(e_new_class_name.Text))+
    ')';
    DataModule1.adoq_RDF_XML.ExecSQL;

    DataModule1.ADOQ_class.SQL.Text:='insert into classes(class_name,parent,fuzzy_value,type,inequivalent_type) values('+
    QuotedStr(trim(e_new_class_name.Text))+','+
    QuotedStr('fowl:Thing')+','+
    IntToStr(1)+','+QuotedStr('class')+
    ','+QuotedStr('Equivalent')+
    ')';
    DataModule1.ADOQ_class.ExecSQL;
  end
  else
  begin
       while fuzzy_value=0 do
      begin
        frm_inequivalent.ShowModal;
        if fuzzy_value=-1 then
          Exit;
      end;

     DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level) values('+
     QuotedStr('    <fowl:Class rdf:ID="'+trim(e_new_class_name.Text)+'"/>')+
     ','+QuotedStr(trim(e_new_class_name.Text))+','+IntToStr(2)+
     ')';
     DataModule1.adoq_RDF_XML.ExecSQL;

     DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level) values('+
     QuotedStr('        <rdfs:subClassOf rdf:resource="#'+trim(tree_class.Selected.Text)+'"/>')+
     ','+QuotedStr('subclass')+','+IntToStr(2)+')';

     DataModule1.adoq_RDF_XML.ExecSQL;

      DataModule1.adoq_RDF_XML.SQL.Text:=' insert into fuzzy_rdf_xml(rdf,class1,level,class2,class3) values('+
      QuotedStr('        <fowl:'+inequinalent_type+' fowl:value='+FloatToStr(fuzzy_value)+'/>')+
      ','+QuotedStr(trim(e_new_class_name.Text))+','+IntToStr(2)+
      ','+QuotedStr(trim(e_new_class_name.Text))+
      ','+QuotedStr(trim(e_new_class_name.Text))+
      ')';
      DataModule1.adoq_RDF_XML.ExecSQL;


     DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level) values('+
     QuotedStr('    </fowl:Class>')+
     ','+QuotedStr('subclass')+','+IntToStr(2)+')';
     DataModule1.adoq_RDF_XML.ExecSQL;


     DataModule1.ADOQ_class.SQL.Text:='insert into classes(class_name,parent,fuzzy_value,type,inequivalent_type) values('+
    QuotedStr(trim(e_new_class_name.Text))+','+
    QuotedStr(trim(tree_class.Selected.Text))+','+
    FloatToStr(fuzzy_value)+','+QuotedStr('subclass')+
    ','+QuotedStr(inequinalent_type)+
    ')';
    DataModule1.ADOQ_class.ExecSQL;
  end;

  tree_class.Items.AddChild(tree_class.Selected,'newclass'+L_class_count.Caption);

  L_class_count.Caption:=IntToStr(StrToInt(L_class_count.Caption)+1);

  tree_class.FullExpand;

  frm_rdf_xml_code.show_rdf_cod;
end;







procedure Tfrm_main.suiImageButton13Click(Sender: TObject);
begin
  if (tree_obj_proprty.Items.Count>0) then
  begin
    if (tree_obj_proprty.Selected.Text='')then
    begin
      suiMessageDialog1.Text:='Select parent property ';
      suiMessageDialog1.ShowModal;
      exit;
    end;

      e_new_property.Text:='newobjectproperty'+L_prperty_count.Caption;

      DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
      QuotedStr('    <fowl:ObjectProperty rdf:ID="'+e_new_property.Text+'">')+','+
      QuotedStr(e_new_property.Text)+','+
      QuotedStr(e_new_property.Text)+','+
      IntToStr(3)+','+
      QuotedStr(e_new_property.Text)+
      ')';
      DataModule1.adoq_RDF_XML.ExecSQL;

      DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
      QuotedStr('        <rdfs:subPropertyOf rdf:resource="#'+tree_obj_proprty.Selected.Text+'"/>')+','+
      QuotedStr(e_new_property.Text)+','+
      QuotedStr('subPropertyOf')+','+
      IntToStr(3)+','+
      QuotedStr(tree_obj_proprty.Selected.Text)+
      ')';
      DataModule1.adoq_RDF_XML.ExecSQL;

      DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
      QuotedStr('    </fowl:ObjectProperty>')+','+
      QuotedStr(e_new_property.Text)+','+
      QuotedStr('ObjectProperty')+','+
      IntToStr(3)+','+
      QuotedStr(e_new_property.Text)+
      ')';
      DataModule1.adoq_RDF_XML.ExecSQL;

      DataModule1.ADOQ_property_between.SQL.Text:='insert into propertis_between(property_name,property_type,parent) values('+
      QuotedStr(e_new_property.Text)+
      ','+QuotedStr('subproperty')+
      ','+QuotedStr(tree_obj_proprty.Selected.Text)+
      ')';
      DataModule1.ADOQ_property_between.ExecSQL;

      tree_obj_proprty.Items.AddChild(tree_obj_proprty.Selected,e_new_property.Text);
      L_prperty_count.Caption:=IntToStr(StrToInt(L_prperty_count.Caption)+1);
      tree_obj_proprty.FullExpand;
  end;
  frm_rdf_xml_code.show_rdf_cod;  
end;

procedure Tfrm_main.suiImageButton11Click(Sender: TObject);
var id:integer;
begin
  if (tree_class.Selected.Text='fowl: Thing') then
  begin
    suiMessageDialog1.Text:='This class can not be delete ';
    suiMessageDialog1.ShowModal;
  end
  else
  begin

    DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml where rdf like '+
    QuotedStr('        <rdfs:subClassOf rdf:resource="#'+trim(tree_class.Selected.Text)+'"/>') ;
    DataModule1.adoq_RDF_XML.open;

    DataModule1.adoq_RDF_XML.First;

    while not DataModule1.adoq_RDF_XML.Eof do
    begin
      id:=DataModule1.adoq_RDF_XMLid.AsInteger;

      DataModule1.adoq_RDF_XML2.SQL.Text:='delete from fuzzy_rdf_xml where id='+IntToStr(id-1)+
      ' or id='+IntToStr(id+1)+' or id='+IntToStr(id)+' or id='+IntToStr(id+2);
      DataModule1.adoq_RDF_XML2.ExecSQL;

      DataModule1.adoq_RDF_XML.next;
    end;

    DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml where rdf like '+
    QuotedStr('%    <fowl:Class rdf:ID="'+trim(tree_class.Selected.Text)+'"/>%') ;
    DataModule1.adoq_RDF_XML.open;

    while not DataModule1.adoq_RDF_XML.Eof do
    begin
      id:=DataModule1.adoq_RDF_XMLid.AsInteger;

      DataModule1.adoq_RDF_XML2.SQL.Text:='delete from fuzzy_rdf_xml where id='+IntToStr(id)+
      ' or id='+IntToStr(id+1)+' or id='+IntToStr(id+2)+' or id='+IntToStr(id+3);
      DataModule1.adoq_RDF_XML2.ExecSQL;

      DataModule1.adoq_RDF_XML.next;
    end;





    {DataModule1.adoq_RDF_XML.SQL.Text:='delete from fuzzy_rdf_xml where rdf like '+
    QuotedStr('%    <fowl:Class rdf:ID="'+trim(tree_class.Selected.Text)+'"/>%') ;
    DataModule1.adoq_RDF_XML.ExecSQL;}

    tree_class.Items.Delete(tree_class.Selected);
  end;
  frm_rdf_xml_code.show_rdf_cod;
end;

procedure Tfrm_main.btn_obj_pro_addClick(Sender: TObject);
begin
  tree_obj_proprty.Items.Add(nil,'inverseof_'+tree_obj_proprty.Selected.Text);
  e_inverse.Text:='inverseof_'+tree_obj_proprty.Selected.Text;

   DataModule1.ADOQ_property_between.SQL.Text:='update propertis_between set inverse='+
   QuotedStr('inverseof_'+tree_obj_proprty.Selected.Text)+
   ' where property_name='+QuotedStr(tree_obj_proprty.Selected.Text);
   DataModule1.ADOQ_property_between.ExecSQL;

   DataModule1.ADOQ_property_between.SQL.Text:='insert into propertis_between(property_name,property_type,parent,inverse) values('+
   QuotedStr('inverseof_'+tree_obj_proprty.Selected.Text)+
   ','+QuotedStr('objectproperty')+
   ','+QuotedStr('no')+
   ','+QuotedStr(tree_obj_proprty.Selected.Text)+
   ')';
   DataModule1.ADOQ_property_between.ExecSQL;
  frm_rdf_xml_code.show_rdf_cod;
end;



procedure Tfrm_main.suiButton3Click(Sender: TObject);
begin
 if tree_class.Selected.Text='fowl:Thing' then
 begin
    suiMessageDialog1.Text:='This class can not be edited ';
    suiMessageDialog1.ShowModal;
    exit;
 end;

    DataModule1.ADOQ_class.SQL.Text:='select * from classes where class_name='+
    QuotedStr(tree_class.Selected.Text)+' and parent='+QuotedStr('fowl:Thing');
    DataModule1.ADOQ_class.Open;

    if DataModule1.ADOQ_class.RecordCount>0 then
    begin
      suiMessageDialog1.Text:='This class can not be edited ';
      suiMessageDialog1.ShowModal;
      exit
    end;

  fuzzy_value:=StrToFloat(l_fuzzy_value.Caption);
  inequinalent_type:=l_inq_type.Caption;
  frm_inequivalent.l_type.Caption:='class_edit';
  frm_inequivalent.ShowModal;

  while fuzzy_value=0 do
  begin
    frm_inequivalent.ShowModal;
    if fuzzy_value=-1 then
      Exit;
  end;

  if fuzzy_value=-1 then
    exit
  else
  begin
    DataModule1.adoq_RDF_XML.SQL.Text:=' update fuzzy_rdf_xml set rdf='+
    QuotedStr('        <fowl:'+inequinalent_type+' fowl:value='+FloatToStr(fuzzy_value)+'/>')+
    ' where rdf='+QuotedStr('        <fowl:'+l_inq_type.Caption+' fowl:value='+l_fuzzy_value.Caption+'/>');
   DataModule1.adoq_RDF_XML.ExecSQL;

    DataModule1.ADOQ_class.SQL.Text:='update classes set fuzzy_value='+FloatToStr(fuzzy_value)+
    ', inequivalent_type='+QuotedStr(inequinalent_type)+
    ' where class_name='+QuotedStr(tree_class.Selected.Text);

    DataModule1.ADOQ_class.ExecSQL;

    show_fuzzy_property;
  end;
  frm_rdf_xml_code.show_rdf_cod;
end;

procedure Tfrm_main.ch_FunctionalClick(Sender: TObject);
begin
  if ch_Functional.Checked then
    change_property_type('Functional')
  else
    delete_property_type('Functional');
  frm_rdf_xml_code.show_rdf_cod;

end;

procedure Tfrm_main.ch_InverseFunctionalClick(Sender: TObject);
begin
  if ch_InverseFunctional.Checked then
    change_property_type('InverseFunctional')
  else
    delete_property_type('InverseFunctional');

  frm_rdf_xml_code.show_rdf_cod;    
end;

procedure Tfrm_main.ch_SymmetricClick(Sender: TObject);
begin
  if ch_Symmetric.Checked then
    change_property_type('Symmetric')
  else
    delete_property_type('Symmetric');

  frm_rdf_xml_code.show_rdf_cod;    
end;

procedure Tfrm_main.ch_TransitiveClick(Sender: TObject);
begin
  if ch_Transitive.Checked then
    change_property_type('Transitive')
  else
    delete_property_type('Transitive');

  frm_rdf_xml_code.show_rdf_cod;    
end;

procedure Tfrm_main.suiImageButton1Click(Sender: TObject);
begin
   DataModule1.ADOQ_property_between.SQL.Text:='delete from propertis_between where from_class='+
   QuotedStr(tree_class.Selected.Text)+' and to_class='+QuotedStr(disjoint.Selected.Text)+
   ' and property_name='+QuotedStr('disjoint');
   DataModule1.ADOQ_property_between.ExecSQL;
////////////////////////////////////////////////
   DataModule1.adoq_RDF_XML_delete.SQL.Text:='delete from fuzzy_rdf_xml where rdf like '+
   QuotedStr('        <fowl:disjointWith rdf:resource="#'+trim(disjoint.Selected.Text)+'"/>') +
   ' and class1='+QuotedStr(tree_class.Selected.Text);
   DataModule1.adoq_RDF_XML_delete.execSQL;

   DataModule1.adoq_RDF_XML_delete.SQL.Text:='delete from fuzzy_rdf_xml where rdf like '+
   QuotedStr('        <fowl:disjointWith rdf:resource="#'+trim(disjoint.Selected.Text)+'"/>') +
   ' and class1='+QuotedStr(tree_class.Selected.Text);
   DataModule1.adoq_RDF_XML_delete.execSQL;
////////////////////////////////////////////////
   DataModule1.adoq_RDF_XML_delete.SQL.Text:='delete from fuzzy_rdf_xml where rdf like '+
   QuotedStr('        <fowl:disjointWith rdf:resource="#'+trim(tree_class.Selected.Text)+'"/>') +
   ' and class1='+QuotedStr(disjoint.Selected.Text);
   DataModule1.adoq_RDF_XML_delete.execSQL;

   DataModule1.adoq_RDF_XML_delete.SQL.Text:='delete from fuzzy_rdf_xml where rdf like '+
   QuotedStr('        <fowl:disjointWith rdf:resource="#'+trim(tree_class.Selected.Text)+'"/>') +
   ' and class1='+QuotedStr(disjoint.Selected.Text);
   DataModule1.adoq_RDF_XML_delete.execSQL;
/////////////////////////////////////////////////      

   show_disjoint_class;
   frm_rdf_xml_code.show_rdf_cod;
end;

procedure Tfrm_main.suiImageButton9Click(Sender: TObject);
begin
   DataModule1.adoq_RDF_XML_delete.SQL.Text:='delete from fuzzy_rdf_xml where rdf like '+
   QuotedStr('        <rdfs:domain rdf:resource="#'+obj_prop_domain.Selected.Text+'"/>') +
   ' and class3='+QuotedStr(e_new_property.Text);
   DataModule1.adoq_RDF_XML_delete.execSQL;

   DataModule1.adoq_RDF_XML_delete.SQL.Text:='delete from fuzzy_rdf_xml where rdf like '+
   QuotedStr('                    <fowl:Class rdf:about="#'+obj_prop_domain.Selected.Text+'"/>')  +
   ' and class3='+QuotedStr(e_new_property.Text);
   DataModule1.adoq_RDF_XML_delete.execSQL;

   obj_prop_domain.Items.Delete(obj_prop_domain.Selected);
  frm_rdf_xml_code.show_rdf_cod;   
end;

procedure Tfrm_main.Button2Click(Sender: TObject);
begin
  frm_algorithm.ShowModal;
end;

procedure Tfrm_main.tree_classChange(Sender: TObject; Node: TTreeNode);
begin
  if page_kol.ActivePageIndex=0 then
     e_new_class_name.Text:=tree_class.Selected.Text;
   ///////////////////////////////////////////////////
   show_disjoint_class;
   show_fuzzy_property;

    suiMemo1.Clear;
    DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml where class1='+
    QuotedStr(trim(tree_class.Selected.Text));
    DataModule1.adoq_RDF_XML.Open;

    DataModule1.adoq_RDF_XML.First;
    while not DataModule1.adoq_RDF_XML.Eof do
    begin
      suiMemo1.Lines.Add(DataModule1.adoq_RDF_XMLrdf.AsString);
      DataModule1.adoq_RDF_XML.Next;
    end;
end;

procedure Tfrm_main.tree_class2Change(Sender: TObject; Node: TTreeNode);
begin
  DataModule1.ADOQ_individual.SQL.Text:='select * from individuals where from_class=' +
  QuotedStr(trim(tree_class2.Selected.Text));
  DataModule1.ADOQ_individual.Open;

  DataModule1.ADOQ_individual.First;
  tree_individual.Items.Clear;

    suiMemo_indi.Clear;

    show_relation_of_class;
    
    DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml where class3='+
    QuotedStr(trim(tree_class2.Selected.Text))+
    ' and class2='+QuotedStr('individual')+' order by id';
    DataModule1.adoq_RDF_XML.Open;

    DataModule1.adoq_RDF_XML.First;
    while not DataModule1.adoq_RDF_XML.Eof do
    begin
      suiMemo_indi.Lines.Add(DataModule1.adoq_RDF_XMLrdf.AsString);
      DataModule1.adoq_RDF_XML.Next;
    end;


  while not DataModule1.ADOQ_individual.Eof do
  begin
    tree_individual.Items.Add(nil,DataModule1.ADOQ_individualindi_name.AsString);
    DataModule1.ADOQ_individual.Next;
  end;
end;

procedure Tfrm_main.btn_obj_pro_add1Click(Sender: TObject);
var index_:integer;
begin
  e_new_property.Text:='newobjectproperty'+L_prperty_count.Caption;

    DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml where rdf='+
    QuotedStr('    <fowl:ObjectProperty rdf:ID="'+e_new_property.Text+'">');
    DataModule1.adoq_RDF_XML.Open;

    if DataModule1.adoq_RDF_XML.RecordCount=0 then
    begin
      DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,class2,level,class3) values('+
      QuotedStr('    <fowl:ObjectProperty rdf:ID="'+e_new_property.Text+'"/>')+','+
      QuotedStr(e_new_property.Text)+','+
      QuotedStr('ObjectProperty')+','+
      IntToStr(3)+','+
      QuotedStr(e_new_property.Text)+
      ')';
      DataModule1.adoq_RDF_XML.ExecSQL;
    end;

   DataModule1.ADOQ_property_between.SQL.Text:='insert into propertis_between(property_name,property_type,parent) values('+
   QuotedStr(e_new_property.Text)+
   ','+QuotedStr('objectproperty')+
   ','+QuotedStr('no')+
   ')';
   DataModule1.ADOQ_property_between.ExecSQL;


  tree_obj_proprty.Items.Add(nil,e_new_property.Text);

  L_prperty_count.Caption:=IntToStr(StrToInt(L_prperty_count.Caption)+1);

  tree_obj_proprty.FullExpand;
   frm_rdf_xml_code.show_rdf_cod;
end;

procedure Tfrm_main.suiImageButton4Click(Sender: TObject);
begin

{<fowl:individual fowl:name="a">
   <fowl:membershipOf rdf:resource="#A"/>
   <fowl:moreOrEquivalent fowl:value= />
</fowl:individual> }
     fuzzy_value:=0;
     while fuzzy_value=0 do
      begin
        frm_inequivalent.ShowModal;
        if fuzzy_value=-1 then
          Exit;
      end;
 e_individual.Text:=tree_class2.Selected.Text+l_idividual_count.Caption;
 
    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level,class2,class3) values('+
    QuotedStr('    <fowl:individual fowl:name="#'+trim(e_individual.Text)+'">')+
    ','+QuotedStr(trim(e_individual.Text))+','+IntToStr(4)+
    ','+QuotedStr('individual')+
    ','+QuotedStr(trim(tree_class2.Selected.Text))+
    ')';
    DataModule1.adoq_RDF_XML.ExecSQL;

    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level,class2,class3) values('+
    QuotedStr('         <fowl:membershipOf rdf:resource="#'+trim(tree_class2.Selected.Text)+'"/>')+
    ','+QuotedStr(trim(e_individual.Text))+','+IntToStr(4)+
    ','+QuotedStr('individual')+
    ','+QuotedStr(trim(tree_class2.Selected.Text))+
    ')';
    DataModule1.adoq_RDF_XML.ExecSQL;

    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level,class2,class3) values('+
    QuotedStr('         <fowl:'+trim(inequinalent_type)+' fowl:value='+FloatToStr(fuzzy_value)+'/>')+
    ','+QuotedStr(trim(e_individual.Text))+','+IntToStr(4)+
    ','+QuotedStr('individual')+
    ','+QuotedStr(trim(tree_class2.Selected.Text))+
    ')';
    DataModule1.adoq_RDF_XML.ExecSQL;


    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level,class2,class3) values('+
    QuotedStr('    </fowl:individual>')+
    ','+QuotedStr(trim(e_individual.Text))+','+IntToStr(4)+
    ','+QuotedStr('individual')+
    ','+QuotedStr(trim(tree_class2.Selected.Text))+
    ')';
    DataModule1.adoq_RDF_XML.ExecSQL;
///////////////////////////////////////////////////////////////////////////////////////////////////////


  DataModule1.ADOQ_individual.SQL.Text:='insert into individuals(indi_name,from_class) '+
  ' values ('+QuotedStr(trim(e_individual.Text))+','+QuotedStr(trim(tree_class2.Selected.Text))+')';
  DataModule1.ADOQ_individual.ExecSQL;

  tree_individual.Items.Add(nil,trim(e_individual.Text));
  l_idividual_count.Caption:=IntToStr(StrToInt(L_idividual_count.Caption)+1);

    suiMemo_indi.Clear;
    DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml where class3='+
    QuotedStr(trim(tree_class2.Selected.Text))+
    ' and class2='+QuotedStr('individual')+' order by id';
    DataModule1.adoq_RDF_XML.Open;

    DataModule1.adoq_RDF_XML.First;
    while not DataModule1.adoq_RDF_XML.Eof do
    begin
      suiMemo_indi.Lines.Add(DataModule1.adoq_RDF_XMLrdf.AsString);
      DataModule1.adoq_RDF_XML.Next;
    end;
      
  frm_rdf_xml_code.show_rdf_cod;  
end;

procedure Tfrm_main.suiButton4Click(Sender: TObject);
begin
    DataModule1.adoq_RDF_XML.SQL.Text:='update fuzzy_rdf_xml set class1='+QuotedStr(trim(e_individual.Text))+
    ', rdf='+QuotedStr('    <fowl:individual fowl:name="#'+trim(e_individual.Text)+'"')+
    ' where class1='+
    QuotedStr(trim(tree_individual.Selected.Text))+' and rdf like '+
    QuotedStr('%    <fowl:individual fowl:name="#'+trim(tree_individual.Selected.Text)+'"%');
    DataModule1.adoq_RDF_XML.ExecSQL;

  DataModule1.ADOQ_individual.SQL.Text:='update individuals set indi_name='+
  QuotedStr(trim(e_individual.Text))+' where from_class=' +QuotedStr(trim(tree_class2.Selected.Text))+
  ' and indi_name='+QuotedStr(trim(tree_individual.Selected.Text));
  DataModule1.ADOQ_individual.ExecSQL;
  tree_individual.Selected.Text:=trim(e_individual.Text);

  frm_rdf_xml_code.show_rdf_cod;  
end;

procedure Tfrm_main.tree_obj_proprtyChange(Sender: TObject;
  Node: TTreeNode);
begin
  //if page_kol.ActivePageIndex=2 then
    //if page_property.ActivePageIndex=1 then
     e_new_property.Text:=tree_obj_proprty.Selected.Text;

     show_domain;
     show_range;

     find_inverse_of;
end;

procedure Tfrm_main.tree_individualChange(Sender: TObject;
  Node: TTreeNode);
begin
  e_individual.Text:=tree_individual.Selected.Text;
end;

procedure Tfrm_main.btn_obj_pro_delete1Click(Sender: TObject);
var id:integer;
begin
    DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml where rdf like'+
    QuotedStr('%<fowl:ObjectProperty rdf:ID="'+trim(tree_obj_proprty.Selected.Text)+'">%') ;
    DataModule1.adoq_RDF_XML.open;


      if DataModule1.adoq_RDF_XML.RecordCount>0 then
      begin
        id:=DataModule1.adoq_RDF_XMLid.AsInteger;

        DataModule1.adoq_RDF_XML2.SQL.Text:='delete from fuzzy_rdf_xml where id='+IntToStr(id+2)+
        ' or id='+IntToStr(id+1)+' or id='+IntToStr(id);
        DataModule1.adoq_RDF_XML2.ExecSQL;
      end

      else
      begin
        DataModule1.adoq_RDF_XML.SQL.Text:='delete from fuzzy_rdf_xml where rdf like '+
        QuotedStr('%    <fowl:ObjectProperty rdf:ID="'+trim(tree_obj_proprty.Selected.Text)+'"/>%') ;
        DataModule1.adoq_RDF_XML.ExecSQL;
      end;

    tree_obj_proprty.Items.Delete(tree_obj_proprty.Selected);
  frm_rdf_xml_code.show_rdf_cod;    
end;

procedure Tfrm_main.suiImageButton5Click(Sender: TObject);
var id:integer;
begin
  DataModule1.ADOQ_individual.SQL.Text:='delete from individuals where indi_name='+
  QuotedStr(trim(e_individual.Text));
  DataModule1.ADOQ_individual.ExecSQL;

  tree_individual.Selected.Delete;

    DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml where class1='+
    QuotedStr(trim(e_individual.Text))+' and rdf like '+QuotedStr('%    <fowl:individual fowl:name="#'+trim(e_individual.Text)+'"%');
    DataModule1.adoq_RDF_XML.Open;

    id:=DataModule1.adoq_RDF_XMLid.AsInteger;

    DataModule1.adoq_RDF_XML.SQL.Text:='delete from fuzzy_rdf_xml where id in ('+
    IntToStr(id)+','+IntToStr(id+1)+','+IntToStr(id+2)+','+IntToStr(id+3)+')';
    DataModule1.adoq_RDF_XML.ExecSQL;

    suiMemo_indi.Clear;
    DataModule1.adoq_RDF_XML.SQL.Text:='select * from fuzzy_rdf_xml where class3='+
    QuotedStr(trim(tree_class2.Selected.Text))+
    ' and class2='+QuotedStr('individual')+' order by id';
    DataModule1.adoq_RDF_XML.Open;

    DataModule1.adoq_RDF_XML.First;
    while not DataModule1.adoq_RDF_XML.Eof do
    begin
      suiMemo_indi.Lines.Add(DataModule1.adoq_RDF_XMLrdf.AsString);
      DataModule1.adoq_RDF_XML.Next;
    end;

  frm_rdf_xml_code.show_rdf_cod;
end;

procedure Tfrm_main.suiImageButton10Click(Sender: TObject);
begin
   DataModule1.adoq_RDF_XML_delete.SQL.Text:='delete from fuzzy_rdf_xml where rdf like '+
   QuotedStr('        <rdfs:range rdf:resource="#'+obj_prop_range.Selected.Text+'"/>') +
   ' and class3='+QuotedStr(e_new_property.Text);
   DataModule1.adoq_RDF_XML_delete.execSQL;

   DataModule1.adoq_RDF_XML_delete.SQL.Text:='delete from fuzzy_rdf_xml where rdf like '+
   QuotedStr('                    <fowl:Class rdf:about="#'+obj_prop_range.Selected.Text+'"/>')  +
   ' and class3='+QuotedStr(e_new_property.Text);
   DataModule1.adoq_RDF_XML_delete.execSQL;

   obj_prop_domain.Items.Delete(obj_prop_range.Selected);
  frm_rdf_xml_code.show_rdf_cod;
end;

procedure Tfrm_main.suiButton5Click(Sender: TObject);
begin
   frm_rdf_xml_code.ShowModal;
end;

procedure Tfrm_main.suiButton6Click(Sender: TObject);
begin
  frm_algorithm.ShowModal;
end;

procedure Tfrm_main.suiButton7Click(Sender: TObject);
begin
  frm_rfd_matrix.ShowModal;
end;

end.
