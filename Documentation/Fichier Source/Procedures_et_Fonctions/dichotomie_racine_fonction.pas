program dichotomie;
uses crt;
function f(x:real):real;
begin
  f := ( sin(x) - x/2);
end;//f(x)

function racine(debut,fin:real):real;
var
  milieu : real;
begin
  milieu := (debut + fin) / 2 ;
  if ( (fin - debut) < 0.0001 ) then
    racine := milieu
  else 
    if ( f(debut) * f(milieu) <= 0 ) then
	  racine := (racine(debut,milieu))
	else
	  racine := (racine(milieu,fin));
end;//racine

begin
	writeln('la racine recherchée est : ',racine(1,2));
	repeat until keypressed;
end.
