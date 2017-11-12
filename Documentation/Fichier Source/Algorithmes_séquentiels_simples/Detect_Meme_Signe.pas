PROGRAM Detect_Meme_Signe;
VAR
	Resultat : BOOLEAN;
	A: REAL;
	B: REAL;
BEGIN
	//lecture des données
	READLN(A);
	READLN(B);
	Resultat := ((A<0) AND (B<0)) OR ((A>0) AND (B>0));
	WRITELN(Resultat);
END.
