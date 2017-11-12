program tri;
uses crt;
type liste = array[1..10] of integer;

procedure rechmin ( var tab : liste ; x : integer);
 var i,mini,indicemini,permut : integer;
 
 begin
   mini := tab[x];
   indicemini := x;
   for i := x to 10 do 
     if tab[i] < mini then
	   begin
	     mini := tab[i];
		 indicemini := i;
	   end;
   if indicemini <> x then
    begin
     permut := tab[x];
	 tab[x] := tab [indicemini];
	 tab[indicemini]:= permut;
	end;
 end;//rechmin
 
 var
   tableau : liste;
   j : integer;
 
 begin
 	clrscr;
	for j:= 1 to 10 do
	  readln(tableau[j]);
	for j := 1 to 9 do
	  rechmin(tableau,j);
	for j:= 1 to 10 do
	write(tableau[j],' ');
	
	repeat until keypressed;
 end.
