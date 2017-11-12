PROGRAM Detect_Deux_Racines;
VAR
	Resultat: BOOLEAN;
	A,B,C,Delta : REAL;
BEGIN
	READLN(A,B,C);
	Delta := SQR(B) - 4*A*C;
	Resultat := (Delta > 0);
	WRITELN(Resultat);
END. 
