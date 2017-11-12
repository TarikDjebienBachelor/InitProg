program pendu;
uses crt;
var
    liste : array[1..20] of string[20];
	i,x : integer;
	devine,mot : string[20];
	lettre : char;

begin
  liste[1]:='fenetre';liste[2]:='appartement';liste[3]:='logiciel';
  liste[4]:='imprimante';liste[5]:='luminosite';liste[6]:='reflexion';
  liste[7]:='algorithme';liste[8]:='serenite';liste[9]:='actualite';
  liste[10]:='disquette';liste[11]:='rudimentaire';liste[12]:='librairie';
  liste[13]:='automobile';liste[14]:='aspirateur';liste[15]:='asphyxie';
  liste[16]:='zoologie';liste[17]:='abeille';liste[18]:='telephone';
  liste[19]:='scrupuleusement';liste[20]:='precision';
  clrscr;
  
  randomize;
  x:=round ( random(20) );
  mot:= liste[x];
  devine:='';
  
  for i:=1 to length(mot) do
    devine:=devine+'-';
  writeln(devine);
  
  repeat
    writeln('entrez une lettre');
	lettre:=readkey;
	for i := 1 to length(mot) do
	  if mot[i] = lettre then devine[i]:= lettre;
	writeln;
	writeln(devine);
  until mot = devine;
  
repeat until keypressed;
end.
