program conversion_recursive_base_b;//ici b = 2 pour une autre base changer juste le 2
uses crt;
function conv(x: integer): longint;
begin
  if x < 2 then
    conv := x
  else
    conv := ((x) mod (2)) + 10 * conv ( (x - (x) mod (2)) / 2 );
end;//conv

var
  n : integer;

begin
  clrscr;
  write('entrez un nombre en base 10 : ');readln(n);
  writeln(n,' = ', conv(n));
  repeat until keypressed;
end.
