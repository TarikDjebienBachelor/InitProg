program comptemots;
uses crt;
var
 phrase : string[80];
 i, mots : integer;
 
 begin
   clrscr;
   readln(phrase);
   mots := 0;
   for i:=1 to length(phrase) do
     if (phrase[i] = ' ') then
	   mots := mots + 1 ;
	 
	 mots := mots + 1 ;

   writeln('le nombre de mots dans la phrase "',phrase,'" vaut : ',mots);
   repeat until keypressed;
 
 end.
