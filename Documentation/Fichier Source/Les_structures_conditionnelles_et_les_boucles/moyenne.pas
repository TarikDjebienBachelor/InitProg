program moy_i_nombres;
uses crt;
var 
	i : integer;
	s,n,moyenne : real;
begin
  clrscr;
  writeln('entrez successivement des nombres positifs');
  writeln('entrez un nombre négatif pour finir');
  s:=0;
  i:=0;
  repeat
    readln(n);
      if n >= 0 then
        begin
	      s := s + n;
	      i := i + 1;
	    end;
  until n < 0;
  moyenne := s / i ;
  writeln(' la moyenne est : ', moyenne);
  repeat
  until keypressed;
end.
