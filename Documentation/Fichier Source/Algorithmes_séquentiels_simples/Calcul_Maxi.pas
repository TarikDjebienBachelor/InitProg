PROGRAM Calcul_Maxi;
VAR
	A,B,Maxi : REAL;
BEGIN
	READLN(A,B);
	Maxi := (A+B+ABS(A-B))/2;
	WRITELN('Le maximum est :',Maxi);
END.
