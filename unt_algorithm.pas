unit unt_algorithm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, SUIButton;

type
  m_type=array[1..6,1..6]of real;
  pt=^m_type;
  Tfrm_algorithm = class(TForm)
    Memo1: TMemo;
    Label8: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    suiButton1: TsuiButton;
    suiButton2: TsuiButton;
    suiButton33: TsuiButton;
    Label3: TLabel;
    suiButton334: TsuiButton;
    Label4: TLabel;
    suiButton3: TsuiButton;
    suiButton7: TsuiButton;
    l_go: TLabel;

    procedure algotithm_4_1(var m:m_type;var vm:m_type);
    function compar(x,y:real;max_min:string):real;
    procedure initial(var m:m_type;var vm:m_type);
    procedure Button1Click(Sender: TObject);

    procedure algotithm_4_2(var m:m_type;var vm:m_type);

    function create_new_edge(var m_old:m_type;var m_new:m_type):boolean;
    procedure show_matrix(m :m_type);
    procedure algotithm_4_3(var vm:m_type;var wvm:m_type);
    function symetric(a,b:real):real;
    function get_class_with_id(id:integer):string;
    procedure insert_virtual_relation(from_class,to_class,algorithm:string;fuzzy_value:real);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure delete_virtual_intered;
    procedure virtual_real_to_rdf(algorithm:string);
    procedure delete_virtual_rdf;
    procedure suiButton1Click(Sender: TObject);
    procedure suiButton2Click(Sender: TObject);
    procedure suiButton33Click(Sender: TObject);
    procedure algotithm_4_4(var wvm:m_type;var fvm:m_type);
    procedure suiButton334Click(Sender: TObject);
    procedure algotithm_4_5(var fvm:m_type;var tvm:m_type);
    function max:real;
    function min:real;
    function if_edge_virtual(i,j:integer):boolean;
    function thershold(x,t:real):real;
    procedure suiButton3Click(Sender: TObject);
    procedure save_rdf_matrix(matrix:m_type);
    procedure suiButton7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
        m,vm,wvm,fvm,tvm:m_type;
        thershold_val:real;

    { Public declarations }
  end;

var
  frm_algorithm: Tfrm_algorithm;

implementation

uses Math, madule, unt_theshold, unt_rfd_matrixpas;

{$R *.dfm}
procedure Tfrm_algorithm.save_rdf_matrix(matrix:m_type);
var i,j:integer;
    from_class,to_class:string;
begin
  DataModule1.ADOQ_rfd_matrix.SQL.Text:='delete from rdf_matrix';
  DataModule1.ADOQ_rfd_matrix.ExecSQL;


          DataModule1.ADOQ_rfd_matrix.SQL.Text:='insert into rdf_matrix(rdf)'+
          ' values('+QuotedStr('<RDF:RDF>')+
          ')';
          DataModule1.ADOQ_rfd_matrix.ExecSQL;

  for i:=1 to 6 do
  begin
    from_class:=get_class_with_id(i);
          DataModule1.ADOQ_rfd_matrix.SQL.Text:='insert into rdf_matrix(rdf)'+
          ' values('+QuotedStr('<RDF:Description RDF:HREF="#'+QuotedStr(from_class)+'">')+
          ')';
          DataModule1.ADOQ_rfd_matrix.ExecSQL;


    for j:=1 to 6  do
    begin
      to_class:=get_class_with_id(j);
      if matrix[i,j]>0 then
      begin
          DataModule1.ADOQ_rfd_matrix.SQL.Text:='insert into rdf_matrix(rdf)'+
          ' values('+QuotedStr('      <fuzzyrelation>')+
          ')';
          DataModule1.ADOQ_rfd_matrix.ExecSQL;

          DataModule1.ADOQ_rfd_matrix.SQL.Text:='insert into rdf_matrix(rdf)'+
          ' values('+QuotedStr('         <toclass> RDF:HREF="#'+QuotedStr(to_class)+'" </toclass>')+
          ')';
          DataModule1.ADOQ_rfd_matrix.ExecSQL;

          DataModule1.ADOQ_rfd_matrix.SQL.Text:='insert into rdf_matrix(rdf)'+
          ' values('+QuotedStr('         <RDF:Value>'+FloatToStr(matrix[i,j])+'</RDF:Value>')+
          ')';
          DataModule1.ADOQ_rfd_matrix.ExecSQL;

          DataModule1.ADOQ_rfd_matrix.SQL.Text:='insert into rdf_matrix(rdf)'+
          ' values('+QuotedStr('      </fuzzyrelation>')+
          ')';
          DataModule1.ADOQ_rfd_matrix.ExecSQL;
      end;
    end;

              DataModule1.ADOQ_rfd_matrix.SQL.Text:='insert into rdf_matrix(rdf)'+
          ' values('+QuotedStr('</RDF:Description>')+
          ')';
          DataModule1.ADOQ_rfd_matrix.ExecSQL;
  end;
end;

function Tfrm_algorithm.thershold(x,t:real):real;
begin
  if x>=t then
    thershold:=x
  else
    thershold:=0;
end;

function Tfrm_algorithm.if_edge_virtual(i,j:integer):boolean;
begin
 if_edge_virtual:=true;

 if (i=2) and (j=1) then
  if_edge_virtual:=false;

 if (i=3) and (j=1) then
  if_edge_virtual:=false;

 if (i=4) and (j=2) then
  if_edge_virtual:=false;

 if (i=4) and (j=3) then
  if_edge_virtual:=false;

 if (i=5) and (j=4) then
  if_edge_virtual:=false;

 if (i=6) and (j=1) then
  if_edge_virtual:=false;
end;

function Tfrm_algorithm.min:real;
var i,j:integer;
begin
  min:=1;
   for i:= 1 to 6 do
    for j:=1 to 6 do
      if fvm[i,j]<min then
        min:=fvm[i,j];
end;

function Tfrm_algorithm.max:real;
var i,j:integer;
begin
  max:=0;
   for i:= 1 to 6 do
    for j:=1 to 6 do
      if fvm[i,j]>max then
        max:=fvm[i,j]
end;

procedure Tfrm_algorithm.algotithm_4_5(var fvm:m_type;var tvm:m_type);
var i,j:integer;
begin
   for i:= 1 to 6 do
    for j:=1 to 6 do
      tvm[i,j]:=0;

   for i:= 1 to 6 do
    for j:=1 to 6 do
    begin
      if i<>j then
      begin
        if (fvm[i,j]>0) and (if_edge_virtual(i,j)) then
          tvm[i,j]:=thershold(fvm[i,j],thershold_val);

        if not (if_edge_virtual(i,j)) then
          tvm[i,j]:=fvm[i,j];
      end;
    end;
end;

procedure Tfrm_algorithm.algotithm_4_4(var wvm:m_type;var fvm:m_type);
var i,j,k:integer;
begin
   fvm:=wvm;
   for i:= 1 to 6 do
    for j:=1 to 6 do
        if(i<>j)then
          if (fvm[i,j]>0 ) and (fvm[j,i]=0) then
            fvm[j,i]:=fvm[i,j];
end;

procedure Tfrm_algorithm.delete_virtual_rdf;
begin
    DataModule1.adoq_RDF_XML.SQL.Text:='delete from fuzzy_rdf_xml where class2 in ('+
  QuotedStr('4-1')+','+QuotedStr('4-2')+','+QuotedStr('4-3')+','+QuotedStr('4-4')+','+QuotedStr('4-5')+')';
    DataModule1.adoq_RDF_XML.ExecSQL;
end;

procedure Tfrm_algorithm.virtual_real_to_rdf(algorithm:string);
begin

    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level,class2,class3) values('+
    QuotedStr('<! -------------------------------------------- >')+

    ','+QuotedStr('comment')+','+IntToStr(4)+
    ','+QuotedStr('4-1')+
    ','+QuotedStr('comment')+
    ')';
    DataModule1.adoq_RDF_XML.ExecSQL;

    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level,class2,class3) values('+
    QuotedStr('<! --- Virtual and real edges between individuals of classes --- >')+

    ','+QuotedStr('comment')+','+IntToStr(4)+
    ','+QuotedStr('4-1')+
    ','+QuotedStr('comment')+
    ')';
    DataModule1.adoq_RDF_XML.ExecSQL;

    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level,class2,class3) values('+
    QuotedStr('<! -------------------------------------------- >')+

    ','+QuotedStr('comment')+','+IntToStr(4)+
    ','+QuotedStr('4-1')+
    ','+QuotedStr('comment')+
    ')';
    DataModule1.adoq_RDF_XML.ExecSQL;


{
<fowl:individual fowl:name="a" fowl:name="b">
   <fowl:membershipOf rdf:resource="#R"/>
   <fowl:moreOrEquivalent fowl:value= />
</fowl:individual>

}
  DataModule1.ADOQ_class_relation.SQL.Text:='select * from class_relations where '+
  ' algorithm_name='+QuotedStr(algorithm);
  // algorithm_name is null or
  DataModule1.ADOQ_class_relation.Open;

  DataModule1.ADOQ_class_relation.First;



  while not   DataModule1.ADOQ_class_relation.eof do
  begin

    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level,class2,class3) values('+
    QuotedStr('    <fowl:individual fowl:name="#'+dataModule1.ADOQ_class_relationfrom_class.AsString+'_1'+
    '" fowl:name="#'+dataModule1.ADOQ_class_relationto_class.AsString+'_1'+'">')+

    ','+QuotedStr(dataModule1.ADOQ_class_relationfrom_class.AsString)+','+IntToStr(4)+
    ','+QuotedStr(algorithm)+
    ','+QuotedStr(dataModule1.ADOQ_class_relationto_class.AsString)+
    ')';
    DataModule1.adoq_RDF_XML.ExecSQL;

    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level,class2,class3) values('+
    QuotedStr('         <fowl:membershipOf rdf:resource="#'+dataModule1.ADOQ_class_relationproperty_name.AsString+'"/>')+
    ','+QuotedStr(dataModule1.ADOQ_class_relationfrom_class.AsString)+','+IntToStr(4)+
    ','+QuotedStr(algorithm)+
    ','+QuotedStr(dataModule1.ADOQ_class_relationto_class.AsString)+
    ')';
    DataModule1.adoq_RDF_XML.ExecSQL;

    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level,class2,class3) values('+
    QuotedStr('         <fowl:'+dataModule1.ADOQ_class_relationinequivalent_type.AsString+' fowl:value='+dataModule1.ADOQ_class_relationfuzzy_value.AsString+'/>')+
    ','+QuotedStr(dataModule1.ADOQ_class_relationfrom_class.AsString)+','+IntToStr(4)+
    ','+QuotedStr(algorithm)+
    ','+QuotedStr(dataModule1.ADOQ_class_relationto_class.AsString)+
    ')';
    DataModule1.adoq_RDF_XML.ExecSQL;


    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level,class2,class3) values('+
    QuotedStr('    </fowl:individual>')+
    ','+QuotedStr(dataModule1.ADOQ_class_relationfrom_class.AsString)+','+IntToStr(4)+
    ','+QuotedStr(algorithm)+
    ','+QuotedStr(dataModule1.ADOQ_class_relationto_class.AsString)+
    ')';
    DataModule1.adoq_RDF_XML.ExecSQL;

  DataModule1.ADOQ_class_relation.Next;    
end;

    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level,class2,class3) values('+
    QuotedStr('<! -------------------------------------------- >')+

    ','+QuotedStr('comment')+','+IntToStr(4)+
    ','+QuotedStr('4-1')+
    ','+QuotedStr('comment')+
    ')';
    DataModule1.adoq_RDF_XML.ExecSQL;

    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level,class2,class3) values('+
    QuotedStr('<! --- Virtual and real edges between individuals of classes --- >')+

    ','+QuotedStr('comment')+','+IntToStr(4)+
    ','+QuotedStr('4-1')+
    ','+QuotedStr('comment')+
    ')';
    DataModule1.adoq_RDF_XML.ExecSQL;

    DataModule1.adoq_RDF_XML.SQL.Text:='insert into fuzzy_rdf_xml(rdf,class1,level,class2,class3) values('+
    QuotedStr('<! -------------------------------------------- >')+

    ','+QuotedStr('comment')+','+IntToStr(4)+
    ','+QuotedStr('4-1')+
    ','+QuotedStr('comment')+
    ')';
    DataModule1.adoq_RDF_XML.ExecSQL;
end;

procedure Tfrm_algorithm.delete_virtual_intered;
begin
  DataModule1.ADOQ_class_relation.SQL.Text:='delete from class_relations where algorithm_name in ('+
  QuotedStr('4-1')+','+QuotedStr('4-2')+','+QuotedStr('4-3')+','+QuotedStr('4-4')+','+QuotedStr('4-5')+')';
  DataModule1.ADOQ_class_relation.ExecSQL;
end;

procedure Tfrm_algorithm.insert_virtual_relation(from_class,to_class,algorithm:string;fuzzy_value:real);
begin
  DataModule1.ADOQ_class_relation.SQL.Text:='insert into class_relations(from_class,to_class,fuzzy_value,type,property_name,algorithm_name) '+
  ' values('+QuotedStr(from_class)+','+QuotedStr(to_class)+','+FloatToStr(fuzzy_value)+','+QuotedStr('virtual')+','+
  QuotedStr('is_similar_to')+','+QuotedStr(algorithm)+')';
  DataModule1.ADOQ_class_relation.ExecSQL;
end;

function Tfrm_algorithm.get_class_with_id(id:integer):string;
begin
 case id of
  1:get_class_with_id:='Data_mining';
  2:get_class_with_id:='Web_mining';
  3:get_class_with_id:='Semantic_data_retrieval';
  4:get_class_with_id:='Ontology';
  5:get_class_with_id:='Description_logic';
  6:get_class_with_id:='Data_retrieval';
 end;
end;

function Tfrm_algorithm.symetric(a,b:real):real;
begin
 symetric:=compar(a,b,'min')/compar(a,b,'max');
end;

procedure Tfrm_algorithm.algotithm_4_3(var vm:m_type;var wvm:m_type);
var i,j,k:integer;
begin

   wvm:=vm;

   for i:= 1 to 6 do
    for j:=1 to 6 do
      for k:= 1 to 6 do
        if(i<>j) and (j<>k) then
          if (vm[j,i]>0 ) and (vm[k,i]>0) then
          begin
            if (wvm[j,k]>0)and(wvm[k,j]>0) then
            begin
              wvm[j,k]:=compar(wvm[j,k],symetric(vm[j,i],vm[k,i]),'min');
              wvm[k,j]:=wvm[j,k];
            end
            else
            begin
              if (wvm[j,k]=wvm[k,j]) then
              begin
                wvm[j,k]:=symetric(vm[j,i],vm[k,i]);
                wvm[k,j]:=wvm[j,k];
              end
              else
                wvm[j,k]:=vm[j,k];
            end;
          end;

//     show_matrix(wvm);
end;
////////////////////////
procedure Tfrm_algorithm.show_matrix(m :m_type);
var i,j,k:integer;
    row:array[1..6]of string;
    row_:string;
    x:real;
begin

    //x:=m[6,2];
    
   for i:= 1 to 6 do
   row[i]:='';

   for i:= 1 to 6 do
   begin
    for j:=1 to 6 do
    begin
        row_:=FloatToStr(m[i,j]);

        if strlen(pchar(row_))=1 then
          row_:=row_+'.00' ;

        if strlen(pchar(row_))=3 then
          row_:=row_+'0' ;

        if strlen(pchar(row_))>4 then
          row_:=row_[1]+row_[2]+row_[3]+row_[4] ;

      row[i]:=row[i]+row_+'    ';
    end;
   end;

   Memo1.Lines.Clear;
   for i:= 1 to 6 do
    Memo1.Lines.Add(row[i]);
end;

function Tfrm_algorithm.create_new_edge(var m_old:m_type;var m_new:m_type):boolean;
var i,j:integer;
    flag:boolean;
begin
    create_new_edge:=false;
    for i:=1 to 6 do
      for j:=1 to 6 do
        if m_old[i,j]<>m_new[i,j] then
        begin
          create_new_edge:=true;
          exit;
        end;
end;

procedure Tfrm_algorithm.algotithm_4_2(var m:m_type;var vm:m_type);
var i,j:integer;
    m_old,m_new:m_type;
begin
    //algotithm_4_1(m,vm);
    repeat
      m:=vm;
      m_old:=m;
      algotithm_4_1(m,vm);
      m_new:=m;
    until  not create_new_edge(m_new,m_old);

end;


procedure Tfrm_algorithm.initial(var m:m_type;var vm:m_type);
var i,j:integer;
begin

     
    m[1,1]:=0;
    m[1,2]:=0;
    m[1,3]:=0;
    m[1,4]:=0;
    m[1,5]:=0;
    m[1,6]:=0;
    //
    m[2,1]:=8/10;
    m[2,2]:=0;
    m[2,3]:=0;
    m[2,4]:=0;
    m[2,5]:=0;
    m[2,6]:=0;
    //
    m[3,1]:=6/10;
    m[3,2]:=0;
    m[3,3]:=0;
    m[3,4]:=0;
    m[3,5]:=0;
    m[3,6]:=0;
    //
    m[4,1]:=0;
    m[4,2]:=9/10;
    m[4,3]:=7/10;
    m[4,4]:=0;
    m[4,5]:=0;
    m[4,6]:=0;
    //
    m[5,1]:=0;
    m[5,2]:=0;
    m[5,3]:=0;
    m[5,4]:=5/10;
    m[5,5]:=0;
    m[5,6]:=0;
    //
    m[6,1]:=5/10;
    m[6,2]:=0;
    m[6,3]:=0;
    m[6,4]:=0;
    m[6,5]:=0;
    m[6,6]:=0;
    //
end;

procedure Tfrm_algorithm.algotithm_4_1(var m:m_type;var vm:m_type);
var i,j,k:integer;
begin

   vm:=m;

   for i:= 1 to 6 do
    for j:=1 to 6 do
      for k:= 1 to 6 do
        if(k<>j) and (j<>i) then
          if (m[k,j]>0 ) and (m[j,i]>0) then
            if (vm[k,i]>0) then
            begin
              vm[k,i]:=compar(vm[k,i],(m[k,j]*m[j,i]),'min');
            end
            else
            begin
              vm[k,i]:=m[k,j]*m[j,i];
            end;

   for i:= 1 to 6 do
    for j:=1 to 6 do
    begin
      if (vm[i,j]>0) then
        insert_virtual_relation(get_class_with_id(i),get_class_with_id(j),'4-1',vm[i,j]);
    end;

end;

function Tfrm_algorithm.compar(x,y:real;max_min:string):real;
begin
   if max_min='max' then
   begin
    if x>=y then
      compar:=x
    else
      compar:=y;
   end
   else
   begin
    if x>=y then
      compar:=y
    else
      compar:=x;
   end;
end;


procedure Tfrm_algorithm.Button1Click(Sender: TObject);
var i,j:integer;
begin
  initial(m,vm);
  algotithm_4_1(m,vm);
  algotithm_4_2(m,vm);
  algotithm_4_3(vm,wvm);
  delete_virtual_intered;
  delete_virtual_rdf;
   for i:= 1 to 6 do
    for j:=1 to 6 do
    begin
      if (wvm[i,j]>0) then
        insert_virtual_relation(get_class_with_id(i),get_class_with_id(j),'4-3',wvm[i,j]);
    end;
  virtual_real_to_rdf('4-3');
  show_matrix(wvm);
end;

procedure Tfrm_algorithm.Button2Click(Sender: TObject);
var i,j:integer;
begin
  initial(m,vm);
  algotithm_4_1(m,vm);
  delete_virtual_intered;
  delete_virtual_rdf;
   for i:= 1 to 6 do
    for j:=1 to 6 do
    begin
      if (vm[i,j]>0) then
        insert_virtual_relation(get_class_with_id(i),get_class_with_id(j),'4-1',vm[i,j]);
    end;
  virtual_real_to_rdf('4-1');
  show_matrix(vm);
end;

procedure Tfrm_algorithm.Button3Click(Sender: TObject);
var i,j:integer;
begin
  initial(m,vm);
  algotithm_4_1(m,vm);
  algotithm_4_2(m,vm);
  delete_virtual_intered;
  delete_virtual_rdf;
   for i:= 1 to 6 do
    for j:=1 to 6 do
    begin
      if (vm[i,j]>0) then
        insert_virtual_relation(get_class_with_id(i),get_class_with_id(j),'4-2',vm[i,j]);
    end;
  virtual_real_to_rdf('4-2');
  show_matrix(vm);
end;

procedure Tfrm_algorithm.suiButton1Click(Sender: TObject);
var i,j:integer;
begin
  initial(m,vm);
  algotithm_4_1(m,vm);
  delete_virtual_intered;
  delete_virtual_rdf;
   for i:= 1 to 6 do
    for j:=1 to 6 do
    begin
      if (vm[i,j]>0) then
        insert_virtual_relation(get_class_with_id(i),get_class_with_id(j),'4-1',vm[i,j]);
    end;
  virtual_real_to_rdf('4-1');
  show_matrix(vm);
  save_rdf_matrix(vm);
  l_go.Caption:='yes';
end;

procedure Tfrm_algorithm.suiButton2Click(Sender: TObject);
var i,j:integer;
begin
  initial(m,vm);
  algotithm_4_1(m,vm);
  algotithm_4_2(m,vm);
  delete_virtual_intered;
  delete_virtual_rdf;
   for i:= 1 to 6 do
    for j:=1 to 6 do
    begin
      if (vm[i,j]>0) then
        insert_virtual_relation(get_class_with_id(i),get_class_with_id(j),'4-2',vm[i,j]);
    end;
  virtual_real_to_rdf('4-2');
  show_matrix(vm);
  save_rdf_matrix(vm);  
  l_go.Caption:='yes';
end;

procedure Tfrm_algorithm.suiButton33Click(Sender: TObject);
var i,j:integer;
begin
  initial(m,vm);
  algotithm_4_1(m,vm);
  algotithm_4_2(m,vm);
  algotithm_4_3(vm,wvm);
  delete_virtual_intered;
  delete_virtual_rdf;
   for i:= 1 to 6 do
    for j:=1 to 6 do
    begin
      if (wvm[i,j]>0) then
        insert_virtual_relation(get_class_with_id(i),get_class_with_id(j),'4-3',wvm[i,j]);
    end;
  virtual_real_to_rdf('4-3');
  show_matrix(wvm);
  save_rdf_matrix(wvm);
  l_go.Caption:='yes';  
end;

procedure Tfrm_algorithm.suiButton334Click(Sender: TObject);
var i,j:integer;
begin
  initial(m,vm);
  algotithm_4_1(m,vm);
  algotithm_4_2(m,vm);
  algotithm_4_3(vm,wvm);
  algotithm_4_4(wvm,fvm);
  delete_virtual_intered;
  delete_virtual_rdf;

   for i:= 1 to 6 do
    for j:=1 to 6 do
    begin
      if (fvm[i,j]>0) then
        insert_virtual_relation(get_class_with_id(i),get_class_with_id(j),'4-4',fvm[i,j]);
    end;
  virtual_real_to_rdf('4-4');
  show_matrix(fvm);
  save_rdf_matrix(fvm);
  l_go.Caption:='yes';   
end;

procedure Tfrm_algorithm.suiButton3Click(Sender: TObject);
var i,j:integer;
begin
  delete_virtual_intered;
  delete_virtual_rdf;
  
  frm_thershold.ShowModal;
  initial(m,vm);
  algotithm_4_1(m,vm);
  algotithm_4_2(m,vm);
  algotithm_4_3(vm,wvm);
  algotithm_4_4(wvm,fvm);
  algotithm_4_5(fvm,tvm);


   for i:= 1 to 6 do
    for j:=1 to 6 do
    begin
      if (tvm[i,j]>0) then
        insert_virtual_relation(get_class_with_id(i),get_class_with_id(j),'4-5',tvm[i,j]);
    end;
  virtual_real_to_rdf('4-5');
  show_matrix(tvm);
  save_rdf_matrix(tvm);
  l_go.Caption:='yes';    
end;

procedure Tfrm_algorithm.suiButton7Click(Sender: TObject);
begin
  if   l_go.Caption='yes' then
    frm_rfd_matrix.ShowModal
end;

procedure Tfrm_algorithm.FormShow(Sender: TObject);
begin
  l_go.Caption:='no';
end;

end.prprocprocedure Tfrm_algorithm.suiButton3Click(Sender: TObject);
begin

end;

edure Tfrm_algorithm.suiButton2Click(Sender: TObject);
begin

end;

ocedure Tfrm_algorithm.suiButton1Click(Sender: TObject);
begin

end;


