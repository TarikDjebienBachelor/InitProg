program factorielle;
function fact(n : integer) : longint;
begin
  if n = 0 then
    fact := 1
  else 
    fact := fact(n-1) * n ;
end;//factorielle
 
var 
  a : integer;
begin
  write('a = ');readln(a);
  writeln('le factorielle de ',a,' = ',fact(a));
end.
