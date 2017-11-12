program addmatrice;
uses crt;
var
  i,j : integer ;
  A,B,C : array[1..3,1..3] of real ;

begin
clrscr;
for i := 1 to 3 do 
  for j := 1 to 3 do
    begin
     write(' entrez le coefficient A',i,j,' de la matrice A : ');
	 readln(A[i,j]);
	end;
 
writeln;
for i := 1 to 3 do 
  for j := 1 to 3 do
    begin
     write(' entrez le coefficient B',i,j,' de la matrice B : ');
	 readln(B[i,j]);
    end;
	 
for i := 1 to 3 do 
  for j := 1 to 3 do
	  C[i,j] := A[i,j] + B[i,j];

writeln;

for i := 1 to 3 do 
 begin
  for j := 1 to 3 do
     write(A[i,j],'  ');
  writeln;
 end;
 
 writeln('                +               '); 

 for i := 1 to 3 do 
 begin
  for j := 1 to 3 do
     write(B[i,j],'  ');
  writeln;
 end;

 writeln('                =               ');

for i := 1 to 3 do 
 begin
  for j := 1 to 3 do
     write(C[i,j],'  ');
  writeln;
 end;
repeat
until keypressed;
clrscr;
end.
