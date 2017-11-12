program sumtab;
uses crt;
type liste = array[1..10] of integer;
function somme(tab : liste) : integer;
var 
   i,s : integer;
begin
  s:=0;
  for i :=1 to 10 do
    s := s + tab[i] ;
  somme := s;
end;//somme

var 
  tableau : liste;
  j : integer;
begin
  for j := 1 to 10 do
    readln(tableau[j]);
  writeln('somme des éléments : ',somme(tableau));
  repeat
  until keypressed; 
end.
