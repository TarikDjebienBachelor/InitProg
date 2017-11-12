program premiers;
uses crt;
var
  tab: array[1..100] of integer;
  premier: boolean;
  i,n,max: integer;
begin
  tab[1]:=1;// initialisation des premiers elements du tableaux
  tab[2]:=2;
  tab[3]:=3;
  max:=3;// position du dernier nombre entré dans le tableau
  n:=3;// dernier nombre entré dans le tableau
  while max < 100 do// tant qu'il reste de la place dans le tableau
    begin
	  n:=n+2;// nombre à tester
	  i:=3;// indice du premier diviseur testé
	  premier:=true;// on le suppose premier a priori
	  while tab[i] <= SQRT(n) do
	    begin
		  if (n)MOD(tab[i])=0 then// test la divisibilité de n
		    premier:= false;
		  i:=i+1;// diviseur suivant
		end;
	  if( premier = true ) then// aucun diviseur pour n
	    begin
		  max:= max + 1;
		  tab[max] := n;// rangement de n a la suite du tableau
		end;
	end;
clrscr;
  writeln;
  for i:=1 to 100 do// affichage resultat
    write(tab[i],' ');
repeat
until keypressed;
clrscr;	
end.
