program struct_notes;
uses crt;
type
  resultat = record
    nom : string[20];
	maths: real;
	histoire: real;
	moyenne: real;
  end;
  
var 
  eleves: array[1..10] of resultat;
  i: integer;

begin
  clrscr;
  for i:=1 to 10 do
  begin
     write('Nom : ');
	 readln(eleves[i].nom);
	 write('Note de Maths : ');
	 readln(eleves[i].maths);
	 write('Note d''Histoire : ');
	 readln(eleves[i].histoire);
	 eleves[i].moyenne := (eleves[i].maths + eleves[i].histoire)/2;
	 writeln(eleves[i].nom,' : ',eleves[i].moyenne);
  end;
  repeat until keypressed;
end.
