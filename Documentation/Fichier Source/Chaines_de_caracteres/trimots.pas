program trimots;
uses crt;
var
  tab: array[1..10] of STRING[20];
  x: STRING[20];
  i,j: integer;
  
begin
clrscr;
	for i:= 1 to 10 do 
	  begin
	  write('entrer le ',i,' mots : ');
	  readln(tab[i]);
	  end;
	  
	for i:= 1 to 9 do
	begin
	   for j:=1 to 9 do
	   begin
	   
	    if ord(tab[j]) > ord(tab[j+1]) then
		  begin
		    x:= tab[j];
			tab[j]:= tab[j+1];
			tab[j+1]:= x;
		  end;//if
       end;//for
	end;//for
	  
    for i:=1 to 10 do
	
	  writeln(tab[i]);
	   	  
	  
repeat until keypressed;
end.
