program controle_pc21;
uses math;
// l'unit� math est n�cessaire pour acc�der � la fonction "power"
// utilis�e ds la fonction plact_cum

// probl�me autour de la rentabilit� d'un placement :
// une banque propose 2 placements l'un avec int�r�ts cumul�s, taux tc
// l'autre � taux lin�aire, taux tl 
// mieux vaut consid�rer ces taux comme des constantes
// en opposition au capital et nb d'ann�es variables
// si ces taux viennent � changer, on modifiera les 2 lignes suivantes :
const tl = 0.05;
const tc = 0.045;

// rentabilit� du placement :
// pour un capital C et un nombre n d'ann�es
// le 1er rapporte C * (1 + n * tl)
// le second rapporte C * (1 + tc)^n
// pour ce calcul on traduira (1 + tc)^n par "power(1+tc,n)"

// on veut �crire 2 fonctions qui, pour un capital donn� et un nombre d'ann�es donn�
// renvoient chacune le montant obtenu avec chacun des placements

// compl�tez les d�clarations suivantes
// et faites-en 2 appels pour chacune :
// avec un capital de 100Euros et une dur�e de 5 ans
// puis avec des valeurs lues au clavier
// vous rajouterez ci-dessous toute nouvelle d�claration de variables

//******************** vos d�clarations : ***********************

var cap : real; // pour le capital
var na : integer;  // pour le nb d'ann�es


//***************************************************************

//---------------------------------------------------------------
// fonction plact_lin param�tr�e par le capital, le taux et le nb d'ann�es
// ce dernier est entier, les 2 autres sont des r�els, le r�sultat est r�el
function plact_lin (c, tl : real; n : integer) : real;
// ici pas de locales
begin
// et directement l'identification du nom de ftn au r�sultat
plact_lin := c * (1 + n * tl)
end;

//---------------------------------------------------------------
// id pour param�tres et r�sultat
// id pour locales et identification
function plact_cum (c, tc : real; n : integer) : real;

begin
plact_cum := c * power((1 + tc),n)
end;


//===============================================================
// �crivez une proc�dure qui affiche sur 2 colonnes
// les montants obtenus par ann�e pendant 15 ans
// pour un capital de 1Euro
// et faites-en l'appel

// N.B. vous utiliserez la fonction plact_lin
// mais pas l'autre et n'utiliserez pas la fonction puissance
// (pensez au calcul successif des termes d'une suite)

// proc�dure = action
// on param�tre par les 2 taux
// le capital est � 1
// inutile d'en prendre un autre en param�tre

procedure afficher_placts_15ans (tl, tc : real);
// 2 locales : i pour la boucle, mtt pour les calculs successifs
var i : integer;
var mtt : real;
begin
writeln('plact lin�aire     plact cumul�');
mtt := 1;                                // initialisation � 1 pour 1 Euro
for i := 1 to 15 do
	begin
        // 1er nb avec write sans aller � la ligne
	write(plact_lin(1, tl, i):10:2); // avec format d'affichage : 2 d�cimales
	// calcul avec mise � jour de mtt ann�e apr�s ann�e
        mtt := mtt * (1 + tc);
	// 2�me nb avec writeln pour aller � la ligne � chaque nouvelle ann�e
        writeln(mtt:10:2);
	end;
writeln
end;


//:::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
// le placement � int�r�ts cumul�s devient plus int�ressant apr�s
// un certain nombre d'ann�es

// donnez directement dans le corps du programme
// les instructions qui calculent ce nombre minimum d'ann�es
// � partir des 2 taux donn�s

// si vous en avez le temps faites-en une proc�dure ou une fonction

// r�ponse en fonction :
// param�tr�e par tl et tc
// capital � 1, appel� directement en valeur explicite ds les ftns

function nb_mini_annees(tl, tc : real) : integer;
var naloc : integer;
begin
// on essaiera successivement 1 puis 2 puis 3 etc pour le nb d'ann�es 
// en s'arr�tant d�s que le placement � taux tc est meilleur
naloc :=1;
while plact_lin(1, tl, naloc) >= plact_cum(1, tc, naloc) do
naloc := naloc + 1;
nb_mini_annees := naloc
end;

// r�ponse en proc�dure et sans appel � puissance :
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
// avec des param�tres valeurs explicites 100 et 5
writeln('plact de 100Euros sur 5 ans : ');
writeln(plact_lin(100, tl, 5):10:3, plact_cum(100, tc, 5):10:3);
writeln;

// appels des ftns en contexte de valeur
// avec des param�tres valeurs implicites : les valeurs lues
writeln('avec votre capital et nb d''ann�es : ');
write('donnez votre capital : ');readln(cap);
write('donnez votre dur�e : ');readln(na);

writeln(plact_lin(cap, tl, na):10:2, plact_cum(cap, tc, na):10:2);
writeln;

// appel de proc�dure : c'est une instruction !
afficher_placts_15ans(tl,tc);

// comparaison et recherche du nb d'ann�es
// en simples instructions :
na :=1;
while plact_lin(1, tl, na) >= plact_cum(1, tc, na) do
na := na + 1;
writeln('nb ann�es minimum : ', na);


// avec appel de fonction :
writeln('duree minimum : ',nb_mini_annees(tl, tc):5);

// avec appel de procedure :
afficher_nb_mini_annees(tl, tc);

end. //************** du pgm **********************************************plact de 100Euros sur 5 ans :

exemple d''ex�cution :

   125.000   124.618

avec votre capital et nb d'ann�es :
donnez votre capital : 10
donnez votre dur�e : 10
     15.00     15.53

plact lin�aire     plact cumul�
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

nb ann�es minimum : 6
duree minimum :     6
duree minimum :     6


