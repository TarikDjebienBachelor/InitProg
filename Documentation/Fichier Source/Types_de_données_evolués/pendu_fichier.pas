program pendu_fichier;
uses crt;
var
  f:text;
  i,x: integer;
  mot,devine : string[20];
  lettre: char;
  
begin
clrscr;
  
  randomize;
  x:= round(random(19));
  assign(f,'/home/tarik/Documents/Ressources_Pedagogiques/Informatique/Langage de Programmation/Pascal/Fichier Source /Types_de_données_evolués/mots.txt');
  reset(f);
  devine:= '';
  for i:=0 to x do 
    readln(f,mot);
  close(f);
  for i:=1 to length(mot) do
    devine:= devine + '-';
  writeln(mot);
  writeln(devine);
  repeat
    writeln('Entrez une lettre');
	lettre:= readkey;
	for i:=1 to length(mot) do
	  if mot[i] = lettre then devine[i]:= lettre;
	writeln;
	writeln(devine);
  until mot = devine;
  
repeat until keypressed;
end.
