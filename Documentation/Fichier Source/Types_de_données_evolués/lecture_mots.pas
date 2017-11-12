program lecture_mots;
uses crt;
var
  F: TEXT;
  I: INTEGER;
  MOT: STRING[20];
  
begin
clrscr;

assign(F,'/home/tarik/Documents/Ressources_Pedagogiques/Informatique/Langage de Programmation/Pascal/Fichier Source /Types_de_données_evolués/mots.txt');
  reset(F);
  while not EOF(F) do // EOF = End Of File
     begin
	   readln(F,MOT);
	   writeln(MOT);
	 end;
  close(F);
  
repeat until keypressed;
end.
