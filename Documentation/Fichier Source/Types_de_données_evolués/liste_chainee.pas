program liste_chainee;
uses crt;

type 
  pointeur = ^liste;
  
  liste = record
    nom : string[20];
    suivant : pointeur;
  end;

var 
  premier, nouveau, precedent : pointeur;
  i: integer;
  reponse: char;
  n: string[20];
  
  
begin
 clrscr;
 
 new(premier);
 write('Entrez le nom de l''éleve ou stop pour terminer ');
 readln(n);
 nouveau:= premier;
 precedent:= NIL ;
 i:= 1 ;
 
   while n <> 'stop' do
     begin
       if i > 1 then precedent^.suivant := nouveau;
       nouveau^.suivant:= nouveau;
       nouveau^.nom := n;
       nouveau^.suivant:= NIL;
       write('Entrez le nom de l''éleve ou stop pour terminer');
       readln(n);
       if i=1 then precedent:= premier;
       if i>1 then precedent:= nouveau;
       i:= i+1;
       new(nouveau);
     end;
 nouveau:= premier;
 
 while nouveau <> NIL do
   begin
     writeln(nouveau^.nom);
     nouveau:= nouveau^.suivant;
     //writeln(nouveau.suivant^);
   end;

repeat until keypressed;
end.
