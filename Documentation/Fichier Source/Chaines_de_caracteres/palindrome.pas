program palindrome;
uses crt;
var
  i: integer;
  mot,palyndrome: string[40];

begin
clrscr;
  write('entrez un mot : ');
  readln(mot);
  palyndrome:='';
  for i:= length(mot) downto 1 do
    begin
	  palyndrome := palyndrome + mot[i];
	end;
  writeln(mot+palyndrome);
  
repeat until keypressed;
end.
