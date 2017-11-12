program controle_pc21;
uses math;
// l'unité math est nécessaire pour accéder à la fonction "power"
// utilisée ds la fonction plact_cum

// problème autour de la rentabilité d'un placement :
// une banque propose 2 placements l'un avec intérêts cumulés, taux tc
// l'autre à taux linéaire, taux tl 
// mieux vaut considérer ces taux comme des constantes
// en opposition au capital et nb d'années variables
// si ces taux viennent à changer, on modifiera les 2 lignes suivantes :
const tl = 0.05;
const tc = 0.045;

// rentabilité du placement :
// pour un capital C et un nombre n d'années
// le 1er rapporte C * (1 + n * tl)
// le second rapporte C * (1 + tc)^n
// pour ce calcul on traduira (1 + tc)^n par "power(1+tc,n)"

// on veut écrire 2 fonctions qui, pour un capital donné et un nombre d'années donné
// renvoient chacune le montant obtenu avec chacun des placements

// complétez les déclarations suivantes
// et faites-en 2 appels pour chacune :
// avec un capital de 100Euros et une durée de 5 ans
// puis avec des valeurs lues au clavier
// vous rajouterez ci-dessous toute nouvelle déclaration de variables

//******************** vos déclarations : ***********************

var cap : real; // pour le capital
var na : integer;  // pour le nb d'années


//***************************************************************

//---------------------------------------------------------------
// fonction plact_lin paramétrée par le capital, le taux et le nb d'années
// ce dernier est entier, les 2 autres sont des réels, le résultat est réel
function plact_lin (c, tl : real; n : integer) : real;
// ici pas de locales
begin
// et directement l'identification du nom de ftn au résultat
plact_lin := c * (1 + n * tl)
end;

//---------------------------------------------------------------
// id pour paramètres et résultat
// id pour locales et identification
function plact_cum (c, tc : real; n : integer) : real;

begin
plact_cum := c * power((1 + tc),n)
end;


//===============================================================
// écrivez une procédure qui affiche sur 2 colonnes
// les montants obtenus par année pendant 15 ans
// pour un capital de 1Euro
// et faites-en l'appel

// N.B. vous utiliserez la fonction plact_lin
// mais pas l'autre et n'utiliserez pas la fonction puissance
// (pensez au calcul successif des termes d'une suite)

// procédure = action
// on paramètre par les 2 taux
// le capital est à 1
// inutile d'en prendre un autre en paramètre

procedure afficher_placts_15ans (tl, tc : real);
// 2 locales : i pour la boucle, mtt pour les calculs successifs
var i : integer;
var mtt : real;
begin
writeln('plact linéaire     plact cumulé');
mtt := 1;                                // initialisation à 1 pour 1 Euro
for i := 1 to 15 do
	begin
        // 1er nb avec write sans aller à la ligne
	write(plact_lin(1, tl, i):10:2); // avec format d'affichage : 2 décimales
	// calcul avec mise à jour de mtt année après année
        mtt := mtt * (1 + tc);
	// 2ème nb avec writeln pour aller à la ligne à chaque nouvelle année
        writeln(mtt:10:2);
	end;
writeln
end;


//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// le placement à intérêts cumulés devient plus intéressant après
// un certain nombre d'années

// donnez directement dans le corps du programme
// les instructions qui calculent ce nombre minimum d'années
// à partir des 2 taux donnés

// si vous en avez le temps faites-en une procédure ou une fonction

// réponse en fonction :
// paramétrée par tl et tc
// capital à 1, appelé directement en valeur explicite ds les ftns

function nb_mini_annees(tl, tc : real) : integer;
var naloc : integer;
begin
// on essaiera successivement 1 puis 2 puis 3 etc pour le nb d'années 
// en s'arrêtant dès que le placement à taux tc est meilleur
naloc :=1;
while plact_lin(1, tl, naloc) >= plact_cum(1, tc, naloc) do
naloc := naloc + 1;
nb_mini_annees := naloc
end;

// réponse en procédure et sans appel à puissance :
// on reprend la locale mtt pour les calculs successifs
procedure afficher_nb_mini_annees(tl, tc : real);
var naloc : integer;
var mttloc : real;
begin
naloc :=1;
mttloc := 1 + tc;
while plact_lin(1, tl, naloc) >= mttloc do
	begin
	naloc := naloc + 1;
	mttloc := mttloc * (1 + tc)
	end;
writeln('duree minimum : ',naloc:5)
end;

begin //************* du pgm **************************************************

// ATTENTION :
// APPEL DE FTN = VALEUR
// APPEL DE PROCEDURE = ACTION

// appels des ftns en contexte de valeur
// avec des paramètres valeurs explicites 100 et 5
writeln('plact de 100Euros sur 5 ans : ');
writeln(plact_lin(100, tl, 5):10:3, plact_cum(100, tc, 5):10:3);
writeln;

// appels des ftns en contexte de valeur
// avec des paramètres valeurs implicites : les valeurs lues
writeln('avec votre capital et nb d''années : ');
write('donnez votre capital : ');readln(cap);
write('donnez votre durée : ');readln(na);

writeln(plact_lin(cap, tl, na):10:2, plact_cum(cap, tc, na):10:2);
writeln;

// appel de procédure : c'est une instruction !
afficher_placts_15ans(tl,tc);

// comparaison et recherche du nb d'années
// en simples instructions :
na :=1;
while plact_lin(1, tl, na) >= plact_cum(1, tc, na) do
na := na + 1;
writeln('nb années minimum : ', na);


// avec appel de fonction :
writeln('duree minimum : ',nb_mini_annees(tl, tc):5);

// avec appel de procedure :
afficher_nb_mini_annees(tl, tc);

end. //************** du pgm **********************************************plact de 100Euros sur 5 ans :

exemple d''exécution :

   125.000   124.618

avec votre capital et nb d'années :
donnez votre capital : 10
donnez votre durée : 10
     15.00     15.53

plact linéaire     plact cumulé
      1.05      1.04
      1.10      1.09
      1.15      1.14
      1.20      1.19
      1.25      1.25
      1.30      1.30
      1.35      1.36
      1.40      1.42
      1.45      1.49
      1.50      1.55
      1.55      1.62
      1.60      1.70
      1.65      1.77
      1.70      1.85
      1.75      1.94

nb années minimum : 6
duree minimum :     6
duree minimum :     6


