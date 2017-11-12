PROGRAM table_multiplication_chiffre;
USES CRT;

var i,n : integer ;
    
begin
  CLRSCR;
  write('Vous souhaitez faire la table de multiplication du chiffre : ');
  read(n);
  for i:= 0 to 10 do
  writeln(n,' fois ',i,' font ',i*n);

repeat
until keypressed;
end.
