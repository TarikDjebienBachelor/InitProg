PROGRAM Calcul_Aire ;
CONST 
	Pi = 3.14159;
VAR 
	Rayon, Surface : REAL ;
	
BEGIN 
	WRITE('Entrez la valeur du rayon : r = ');
	READLN(Rayon);
	Surface := Pi * SQR(Rayon);
	WRITELN('La surface du cercle de rayon r =',Rayon,' vaut : ',Surface);
END.
