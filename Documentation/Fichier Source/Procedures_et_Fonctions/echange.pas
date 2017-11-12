program echange;
uses crt;
procedure permute(var x,y : integer);
var z : integer;
begin
	z:= x;
	x:= y;
	y:= z;
end;//permute

var 
	a,b : integer;
begin
	clrscr;
	write('a = ');
	readln(a);
	write('b = ');
	readln(b);
	permute(a,b);
	writeln('a = ',a);
	writeln('b = ',b);
	repeat
	until keypressed;
end.
