program conjugaison;
uses crt;
var
   racine, verbe : STRING[40];
   i : integer;
   sujet : array[1..6] of STRING[4];
   terminaison : array[1..6] of STRING[3];

begin
   sujet[1]:='je';sujet[2]:='tu';sujet[3]:='il';
   sujet[4]:='nous';sujet[5]:='vous';sujet[6]:='ils';

   terminaison[1]:='e';terminaison[2]:='es';terminaison[3]:='e';
   terminaison[4]:='ons';terminaison[5]:='ez';terminaison[6]:='ent';
   
clrscr;
   write('Entrer un verbe du 1er groupe : ');
   readln(verbe);
   racine:='';
   for i:=1 to length(verbe)-2 do
      racine := racine + verbe[i];
  
   for i:=1 to 6 do
     writeln(sujet[i],' ',racine,terminaison[i]);

repeat until keypressed;

end.
