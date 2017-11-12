program eratosthene;
uses crt;
var
  tab : array[1..500] of integer;
  i,j : integer;
begin
  clrscr;
  for i:= 1 to 500 do
    tab[i] := i;
  for i:=2 to 500 do
    for j:= i+1 to 500 do
	  if (j)MOD(i) = 0 then
	    tab[j] := 0;
  
  for i:= 1 to 500 do
    if tab[i] <> 0 then
	  write(tab[i],' ');

repeat
until keypressed;
clrscr;
end.
