program calcul_tableau;
uses crt;
var
 i,s: integer;
 tab : array [1..10] of integer;
begin
 clrscr;
 s := 0;
   for i := 1 to 10 do
     begin
       write('veuillez entrez un nombre entier : ');
	   readln(tab[i]);
     end;
   write('la somme de '); 
   for i := 1 to 9 do
     begin
	   s := s + tab[i];
       write(tab[i],' + ');
	 end;
	 write(tab[10]);
	 s := s + tab[10];
   write(' = ',s);
 repeat
 until keypressed;
 clrscr;
end.
