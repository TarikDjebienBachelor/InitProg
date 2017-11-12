program mini_maxi;
uses crt;
var
  n, mini, maxi : real;
begin
  clrscr;
  writeln('entrez successivement des nombres positifs');
  writeln('entrez un nombre négatif pour finir.');
  readln(n);
  mini := n;
  maxi := n;
  repeat
    readln(n);
	if n >= 0 then 
	  begin
	    if n > maxi then maxi := n;
		if n < mini then mini := n;
	  end;
  until n < 0;
  writeln('le minimum est :', mini );
  writeln('le maximum est :', maxi );
  repeat
  until keypressed;  
end.
