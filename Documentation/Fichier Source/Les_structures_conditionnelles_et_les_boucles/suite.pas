program suite;
uses crt;
var
  n : integer;
  u,v : real;
begin
 clrscr;
 v := 0;
 n := 1;
 repeat
   u := 1 / SQR(n);
   v := v + u ;
   writeln('n = ',n, ' u = ',u,' v = ',v);
   n := n+1;
 until u < 0.001;

 repeat
 until keypressed;
 clrscr;
end.
