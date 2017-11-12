program calcus_au_choix;
uses crt;
var
  i, choix : integer ;
  s,n,moyenne : real ;
  min, max : real ;
begin
  clrscr;
  writeln('entrez successivement des nombres positifs');
  writeln('entrez un nombre negatif pour finir.');
  writeln;
  writeln;
  readln(n);
  s := n;
  min := n;
  max := n;
  i := 1;
  repeat
    readln(n);
	if n >= 0 then 
	  begin
	    if n < min then min := n ;
		if n > max then max := n ;
		s := s + n ;
		i := i + 1 ;
	  end;
  until n < 0;
  moyenne := s / i ;
  repeat
    writeln;
	writeln;
	writeln;
	writeln('Choisissez : ');
	writeln('1 : minimum');
	writeln('2 : maximum');
	writeln('3 : somme');
	writeln('4 : moyenne');
	writeln('0 : stop');
	writeln;
	writeln('Entrez votre choix : ');
	readln(choix);
	case choix of
	  1 : writeln('Le minimum est : ',min);
	  2 : writeln('Le maximum est : ',max);
	  3 : writeln('La somme est : ',s);
	  4 : writeln('La moyenne est : ',moyenne);
	end;
	until choix = 0;
	clrscr;
end.
