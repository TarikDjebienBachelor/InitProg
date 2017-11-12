program integrale;
uses crt;
function f(t:real):real;
begin
 f := 1 / t ;
end;//f

var 
  a,b, x ,pas,integ : real;
  i , n : integer	;
begin
  a := 1;
  b := 3;
  n := 1000;
  pas := (b-a)/n ;
  integ := 0 ;
  for i := 1 to n do 
   begin
     x := pas * i ;
	 integ := integ + pas * f(x);
   end;
   writeln(integ);
   repeat
   until keypressed;
end.
