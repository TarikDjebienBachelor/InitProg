program etatcivil;
uses crt;
type 
   info = record
     nom : string[20];
	 annee : integer;
	 ville : string[20];
   end;
 
var 
  etat_civil : array [1..4] of info;
  i : integer;

begin
for i := 1 to 4 do
   begin
     write('Nom : ');
	 readln(etat_civil[i].nom);
	 write('Année de naissance : ');
	 readln(etat_civil[i].annee);
	 write('Ville : ');
	 readln(etat_civil[i].ville);
   end;
   clrscr;
   
   for i:= 1 to 4 do
     writeln(etat_civil[i].nom,' ',etat_civil[i].annee,' ',etat_civil[i].ville);

repeat until keypressed;
end.
