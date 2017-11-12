PROGRAM Calcul_Delta_et_racine_Polynome_correction;
USES CRT;
VAR
	
	A,B,C,delta,X1,X2 : REAL;
BEGIN
	CLRSCR;
	Write('coefficient A :');
	READLN(A);
	Write('coefficient B :');
	READLN(B);
	Write('coefficient C :');
	READLN(C);
	delta := SQR(B) - 4*A*C;
	writeln;
	writeln('Delta =',delta);
	// note : le corrigé ne prend pas en comte le polynome nul!
	if delta < 0 then
	  begin
	    writeln('le polynome ne possede pas de racine réelle.');
	  end
	else
	  if delta > 0 then 
	    begin
		  writeln('le polynome possede deux racines réelles :');
		  X1 := ( -B + SQRT(delta))/(2*A);
		  X2 := ( -B - SQRT(delta))/(2*A);
		  writeln('X1 = ',X1);
		  writeln('X2 = ',X2);
		end
	  else
	    begin
		  writeln('le polynome possede une racine :');
		  X1 := (-B) / (2*A);
		  writeln('X = ',X1);
	  end;
repeat
until keypressed;
END. 
