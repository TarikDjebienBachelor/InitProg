PROGRAM Calcul_Mod_Arg;
VAR
	A,B,Module,Argument : REAL ; // Z = A + iB
BEGIN
	READLN(A,B) ;
	Module := SQRT(SQR(A)+SQR(B));
	Argument := ARCTAN(B/A);
	WRITELN( 'Module:', Module);
	WRITELN( 'Argument:', Argument);
END.
