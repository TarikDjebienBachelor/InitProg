program intro_fonctions;

uses cartes;
// pgm qui donne qq exemples de fonctions
// donc utilise l'unit� cartes

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
function sommet_rouge (numtas : taspossibles) : boolean;
begin
  sommet_rouge := sommetcoeur(numtas) or sommetcarreau(numtas)
end;

// exemple de fonction maximum de 2 nombres
function max2 (a, b : integer) : integer;
var loc : integer;
begin
  if a>b then loc := a else loc := b;
  max2 := loc
end;

// construisez la fonction max3 qui appelle max2
// function max3 (a, b, c : integer ) ...



// il existe une fonction standard nomm�e random
// dont l'appel g�n�re un nombre al�atoire
// par exemple random(1000) renvoie un nombre entier
// compris entre 0 et 1000
// il faut initialiser cette fonction
// voir appel de "randomize" une fois pour toutes en d�but de programme
// et cr�ation de 3 nombres al�atoires dont on cherchera le maximum


// construisez une fonction qui simule un lancer de d�
// en appelant random pour renvoyer un nombre entre 1 et 6


// construisez une fonction qui v�rifie si 3 lancers de d�s
// ont donn� "421"


begin
  randomize;

  // appel de fonction sur cartes
  inittas(1,'[K+C+T+P]');
  if sommet_rouge(1) 
        then writeln ('sommet rouge')
	else writeln ('sommet noir');

  while tasnonvide(1) and sommet_rouge(1) do
	deplacersommet(1,2);
  if tasvide(1) 
	then writeln ('toutes les cartes sont rouges')
	else writeln ('il y a au moins une noire');


  // appel de fonction sur maximum
  write ('donnez un 1er nb'); readln(n1);
  write ('donnez un 2�me nb'); readln(n2);
  write ('donnez un 3�me nb'); readln(n3);

  write ('voici le maximum des 2 1ers : '); writeln(max2(n1,n2));

  // cr�ation de nombres al�atoires
  n1 := random(100);
  n2 := random(100);
  writeln(n1, ' et ', n2, ' ont pour maximum ', max2(n1,n2));

  // r�fl�chissez � ce que donnerait l'instruction suivante :
  // writeln(max3 (random(100), random(100), random(100));
  // quelle v�rification faire ?

end.



