program creation_mots;
uses crt;
var
  F: TEXT; // declaration du fichier
  I: INTEGER;
  MOT: STRING[20];
  
begin
  clrscr;
  //assignation du nom
  assign(F,'/home/tarik/Documents/Ressources_Pedagogiques/Informatique/Langage de Programmation/Pascal/Fichier Source /Types_de_données_evolués/mots.txt');
  //creation et ouverture en ecriture
  rewrite(F);
  
  for I:=1 to 20 do
  begin
    write('Mot ',I,' : ');
	readln(MOT);
	//ecriture d'un mot dans le fichier
	writeln(F,MOT);
  end;
  
  //fermeture du fichier
  close(F);
  
  repeat until keypressed;
end.
