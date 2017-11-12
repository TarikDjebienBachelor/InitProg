program rech_mini;
uses crt;
var
 i,indice_mini,mini : integer;
 tab : array [1..10] of integer;
begin
 clrscr;
   for i := 1 to 10 do
     begin
   	   write('entrez la valeur de l''entier pour la position ',i,' : ');
       readln(tab[i]);
	 end;
   mini := tab[1];
   indice_mini := 1;
      
   for i := 2 to 10 do
     begin
 		if tab[i] < mini then
		  begin
		    mini := tab[i];
			indice_mini := i;
	      end;
	 end;
	 writeln;
	 writeln;
	 writeln;
	 writeln('Mini : ',mini,' Indice : ',indice_mini);	  
 repeat
 until keypressed;
 clrscr;
end.
