program maths2;


var n:cardinal;
var s:cardinal;
var i:cardinal;

begin
   s:=0;
   n:=15;
   i:=1;
while i <= n do
  begin
   s:=s+i;
   i:=i+1;
  end;
writeln('la somme des n premiers termes vaut: ',s);
end.

