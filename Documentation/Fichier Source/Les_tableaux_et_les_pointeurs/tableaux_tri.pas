program tri;
uses crt;
var
  tab : array[1..10] of integer;
  i,j,k : integer;
begin
  clrscr;
  for i:= 1 to 10 do
    readln(tab[i]);
  for j:= 1 to 9 do
    for i:=1 to 9 do
	  if tab[i] > tab[i+1] then
	  begin
	    k:= tab[i];
		tab[i]:= tab[i+1];
		tab[i+1] := k;
	  end;
  writeln;	  
  for i:= 1 to 10 do
    write(tab[i],' ');
  repeat
  until keypressed;
  clrscr;
end.
