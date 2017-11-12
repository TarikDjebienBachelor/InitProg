program multipmatrices;
uses crt;
var
  i,j,k : integer;
  A,B,C : array[1..3,1..3] of integer;
begin
  clrscr;
  writeln('entrez un à un et ligne par ligne');
  writeln('les neuf coefficients de la matrice A.');
  for i:= 1 to 3 do
    for j:= 1 to 3 do 
	  readln(A[i,j]);
  writeln('entrez un à un et ligne par ligne');
  writeln('les neuf coefficients de la matrice B.');
  for i:= 1 to 3 do
    for j:= 1 to 3 do 
	  readln(B[i,j]);
  
  for i:= 1 to 3 do
    for j:= 1 to 3 do
	  begin
	    C[i,j] :=0;
		for k:= 1 to 3 do
		  C[i,j] := C[i,j] + A[i,k] * B[k,j];
	  end;
  writeln;
  writeln('C = A * B = ');
  for i:=1 to 3 do
    begin
	  for j:=1 to 3 do
	    write(C[i,j],'  ');
		writeln;
	end;
repeat
until keypressed;
end.
