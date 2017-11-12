{Le triangle de Pascal contient les valeurs des différents C(n,p).
il correspond également aux coefficients du fameux binome de Newton,
coefficients que l'on retrouve dans le développement de (a+b)^n.
On construit ce tableau à deux dimensions en calculant chaque nouvelle
ligne à partir de la précédente en utilisant l'expression :

Tij = T(i-1,j) + T(i-1,j-1).

}

program triangle_pascal;
uses crt;
var
  tab: array[1..10,1..11] of integer;
  i,j : integer;
begin
  for i:=1 to 10 do 
    for j:=1 to 11 do
	  tab[i,j] := 0;
  for i:=1 to 10 do
    tab[i,1]:=1;
  
  tab[1,2]:=1;
  for i:=2 to 10 do
    for j:=2 to i+1 do
	  tab[i,j] := tab[i-1,j] + tab[i-1,j-1];
  
  clrscr;
  for i:=1 to 10 do
  begin
    for j:=1 to i+1 do
	  write(tab[i,j],' ');
	writeln;
  end;
repeat
until keypressed;
clrscr;
end.
