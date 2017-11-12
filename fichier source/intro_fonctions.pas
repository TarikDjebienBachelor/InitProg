program intro_fonctions;

uses cartes;
// pgm qui donne qq exemples de fonctions
// donc utilise l'unité cartes

var n1, n2, n3 : integer;



// les fonctions sont DECLAREES ds la tête du pgm
// et sont APPELEES ds le corps du pgm

// déclaration de fonction :
// choisissez un nom de fonction : un nom ou un adjectif
// reservez les verbes pour les procédures
// puis entre parenthèses la liste des paramètres formels valeurs
// en nombre et ordre donnés, avec les types de chacun
// et derrière les ":" le type du résultat
// un appel de fonction renvoie une valeur
// qui sera utilisée ds le contexte de valeur correspondant
// on aura recours à des variables locales si nécessaire
// principe de la caisse à outils locaux
// le corps de fonction s'achève par l'identification du nom de la fonction au résultat

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



// il existe une fonction standard nommée random
// dont l'appel génère un nombre aléatoire
// par exemple random(1000) renvoie un nombre entier
// compris entre 0 et 1000
// il faut initialiser cette fonction
// voir appel de "randomize" une fois pour toutes en début de programme
// et création de 3 nombres aléatoires dont on cherchera le maximum


// construisez une fonction qui simule un lancer de dé
// en appelant random pour renvoyer un nombre entre 1 et 6


// construisez une fonction qui vérifie si 3 lancers de dés
// ont donné "421"


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
  write ('donnez un 2ème nb'); readln(n2);
  write ('donnez un 3ème nb'); readln(n3);

  write ('voici le maximum des 2 1ers : '); writeln(max2(n1,n2));

  // création de nombres aléatoires
  n1 := random(100);
  n2 := random(100);
  writeln(n1, ' et ', n2, ' ont pour maximum ', max2(n1,n2));

  // réfléchissez à ce que donnerait l'instruction suivante :
  // writeln(max3 (random(100), random(100), random(100));
  // quelle vérification faire ?

end.



