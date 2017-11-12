program calcul_e;
uses crt;
function fact(n : integer): longint;
begin
  if n = 0 then fact := 1 else fact := fact (n-1) * n;
end;//fact

var 
  i: integer;
  n: longint;
  e : real ;
begin
  e := 0 ;
  write('combien d''iterations a effectuer ? '); 
  readln(n);
  for i := 1 to n do
    e := e + 1 / fact(i);
  writeln('e = ',e);
  repeat
  until keypressed; 
end.
