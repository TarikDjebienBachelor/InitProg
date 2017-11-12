program pgcd_recursif;
uses crt;
function pgcd(x,y : integer): integer;
begin
  if (x mod y) = 0 then 
   pgcd := y
  else
   pgcd := pgcd(y,x mod y);
end;//pgcd

var 
  a,b : integer;
begin
  clrscr;
  writeln('calcul du pgcd de deux nombres');
  writeln;
  write('Entrez le plus grand des deux nombres : ');readln(a);
  write('Entrez le plus petit des deux nombres : ');readln(b);
  writeln('le pgcd est : ',pgcd(a,b));
  repeat
  until keypressed;
end.
