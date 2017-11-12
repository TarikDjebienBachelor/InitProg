PROGRAM Calcul_Log_Base_A;
VAR
	Resultat : REAL;
	X: REAL;
	A: REAL;
BEGIN
	//lecture des données
	READLN(A);
	READLN(X);
	Resultat := LN(X)/LN(A);
	WRITELN(Resultat);
END.
