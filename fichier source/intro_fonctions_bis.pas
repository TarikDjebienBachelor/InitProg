program intro_fonctions_bis;


var n1, n2, n3 : integer;



// les fonctions sont DECLAREES ds la t�te du pgm
// et sont APPELEES ds le corps du pgm

// d�claration de fonction :
// choisissez un nom de fonction : un nom ou un adjectif
// reservez les verbes pour les proc�dures
// puis entre parenth�ses la liste des param�tres formels valeurs
// en nombre et ordre donn�s, avec les types de chacun
// et derri�re les ":" le type du r�sultat
// un appel de fonction renvoie une valeur
// qui sera utilis�e ds le contexte de valeur correspondant
// on aura recours � des variables locales si n�cessaire
// principe de la caisse � outils locaux
// le corps de fonction s'ach�ve par l'identification du nom de la fonction au r�sultat

// exemple de fonction sur cartes
// function sommet_rouge (numtas : taspossibles) : boolean;
// begin
// sommet_rouge := sommetcoeur(numtas) or sommetcarreau(numtas)
// end;

// exemple de fonction maximum de 2 nombres
function max2 (a, b : integer) : integer;
var loc : integer;
begin
  if a>b then loc := a else loc := b;
  max2 := loc
end;

// construisez la fonction max3 qui appelle max2
function max3 (a, b, c : integer ) : integer;
begin
  max3 := max2(a, max2(b,c))
end;


// il existe une fonction standard nomm�e random
// dont l'appel g�n�re un nombre al�atoire
// par exemple random(1000) renvoie un nombre entier
// compris entre 0 et 1000
// construisez une fonction qui simule un lancer de d�
// en appelant random pour renvoyer un nombre entre 1 et 6

function de_lance () : cardinal;
begin
  de_lance := 1+ random(6)     // soit 1 + un nb entre 0 et 5
end;

// construisez une fonction qui simule 1 lancer de 3 d�s
// on propose ici de renvoyer un nombre 
// correspondant aux 3 d�s en ordre d�croissant
// notez l'absence de param�tres et l'utilisation de la fonction max2
function trois_des () : cardinal;
var d1, d2, d3, dm : cardinal;
begin
  d1 := de_lance();
  d2 := de_lance();
  dm := max2(d1,d2);
  if dm = d2
	then 
		begin 
	       	d2 := d1;
		d1 := dm
		end;

  d3 := de_lance();
  dm := max2 (d1,d3);
  if dm = d3
	then 
		begin 
		d3 := d2;
		d2 := d1;
		d1 := dm
		end
	else
		begin
		dm := max2(d2,d3);
		if dm = d3
			then 
			begin
			d3 := d2;
			d2 := dm
			end
		end;

  trois_des := 100*d1 + 10*d2 + d3 
end;

// construisez une fonction qui v�rifie si 3 lancers de d�s
// ont donn� "421"
function egal_421 (trio : cardinal) : boolean;
begin
  egal_421 := trio = 421
end;



begin
  randomize;

  write ('voici un lancer :');writeln(de_lance());
  write ('voici trois lancers :');writeln(trois_des());

  // v�rification 421 : attention au pi�ge !
  // voir affichage exemple � justifier
  if egal_421(trois_des()) 
	then writeln('bravo')
	else writeln('perdu');


  // recherche nombre de lancers avant 421
  n1 := 0;
  while not egal_421(trois_des()) do
	n1 := n1 + 1;

  writeln ('on a obtenu 421 apr�s ', n1 , ' lancers de 3 d�s');
  writeln;

  // nb moyen de lancers de 3 d�s 
  n2 := 0;
  for n3 := 1 to 1000 do
  begin
	n1 := 0;
	while not egal_421(trois_des()) do
	n1 := n1 + 1;
	n2 := n2 + n1
  end;
  writeln('moyenne de ',n2/1000:8:2,' lancers pour obtenir 421');


end.

voici un lancer :4
voici trois lancers :421
perdu

//pi�ge : � chaque appel de la fonction trois_des on g�n�re une nouvelle valeur
//il faut la stocker si l'on veut lui appliquer diff�rents calculs !!!
