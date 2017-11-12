PROGRAM Vecteurs_orthogonaux_dans_R²;
VAR
	Ortho: BOOLEAN;
	A,B,C,D,Angle : REAL;
BEGIN
	READLN(A,B);//coordonée vecteur x
	READLN(C,D);//coordonée vecteur y
	Ortho := ((A*C+B*D)=0);
	Angle := (ARCTAN (D/C)- ARCTAN(B/A)) * 180/Pi;
	WRITELN(Ortho);
	WRITELN(Angle);
END. 
