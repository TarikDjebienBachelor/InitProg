program pgcd;
uses crt;
var
  x,y,a,b,reste : integer;
begin
  clrscr;
  writeln('Calcul du pgcd de deux nombres');
  writeln;
  writeln('Entrez le plus grand des deux nombres : ');
  read(x);
  writeln('Entrez le plus petit des deux nombres : ');
  read(y);
  a := x;
  b := y;
  repeat
    reste := (a) MOD (b);
	if reste <> 0 then
	  begin
	    a := b;
		b := reste;
	  end;
  until reste = 0;
  writeln;
  writeln('Le PGCD de ',x,' et ',y,' est : ',b);
  repeat
  until keypressed;
  clrscr;
end.
