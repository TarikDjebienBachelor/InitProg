program ASCII;
uses crt;
var
	i:integer;
	A,B: integer;

begin
  clrscr;
  write('borne inferieur : ');
  readln(A);
  write('borne superieur : ');
  readln(B);
  
  for i := A to B do
    writeln(i,' = ASCII => ',CHR(i));
  repeat until keypressed;
end.
