program rech_souschaine;
uses crt;
var
  chaine: string[20];
  souschaine: string[10];
  i,j,longueur,lettres : integer;

begin
clrscr;
   readln(chaine);
   readln(souschaine);
   longueur:= length(souschaine);
   for i:= 1 to length(chaine) - longueur +1 do
   begin
     lettres:=0;//lettres communes entre souschaine et le morceau de chaine
	 for j:=0 to longueur -1 do //pour chaque caractere de souschaine
	  if chaine[i+j]=souschaine[j+1] then
	     lettres:= lettres + 1;//comptage des lettres communes
	  
	  if lettres=longueur then //correspondance exacte
	    writeln('sous-chaine trouvée en position ',i)
	end;

repeat until keypressed;
end.
