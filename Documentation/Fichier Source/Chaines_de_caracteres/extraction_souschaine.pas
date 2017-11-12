program extraction_souschaine;
uses crt;

function extrait(s:string;x,y:integer):string;
var 
  sschaine : string;
  i : integer;
  
begin
  sschaine := '';
  for i:= x to x+y-1 do
    sschaine:= sschaine + s[i];

extrait:= sschaine;     
end;//extrait


var
  chaine,souschaine: string[40];
  i,j: integer;

begin
clrscr;

readln(chaine);
readln(i);
readln(j);
souschaine:= extrait(chaine,i,j);
writeln(souschaine);

repeat until keypressed;
end.
