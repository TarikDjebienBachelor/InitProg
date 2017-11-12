PROGRAM Calcul_Delta_et_racine_Polynome;

VAR
	
	A,B,C,Delta : REAL;
	racine1,racine2 : real;
BEGIN
	READLN(A,B,C);
	if (A <> 0) and (B <> 0) and (C <> 0) then
	begin
	Delta := SQR(B) - 4*A*C;
	if (Delta > 0) then 
	  begin
		racine1 := (-B + SQRT(Delta))/ (2 * A);
		racine2 := (-B - SQRT(Delta))/ (2 * A);
		writeln('Votre polynome',A,' + ',B,'X + ',C,'X² possede 2 racines :',racine1,' et ',racine2);
	  end
	else
	if (Delta = 0 ) then 
	  begin
		racine1 := -B / (2 * A);
		writeln('Votre polynome',A,' + ',B,'X + ',C,'X² possede une racine unique :',racine1);
      end
	else
	  writeln('Votre polynome',A,' + ',B,'X + ',C,'X² ne possede aucune racine dans le corps (R,x,+)');
	
	end
	else
	writeln('Votre polynome',A,' + ',B,'X + ',C,'X² est le polynome nul tout comme toi ! ');
END.
