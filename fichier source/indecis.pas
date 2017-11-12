program indecis;

// programme qui calcule les termes d'une suite correspondant
// au pb suivant :
// un amoureux indécis hésite à choisir entre 2 demoiselles
// elles sont symbolisées par 2 points donnés D1 et D2 sur un axe des abscisses
// et lui par un autre point qui représente sa position initiale U0
// n'importe où sur l'axe des abscisses
// il se dirige alternativement vers les 2 demoiselles en s'arrêtant
// à mi-chemin de chaque trajet vers l'une pour retourner vers l'autre

// on obtient donc une suite de points u1 u2 u3 etc
// par le calcul de l'abscisse du milieu d'un segment soit
// u1 = (D1 + u0) / 2
// u2 = (D2 + u1) / 2
// u3 = (D1 + u2) / 2 etc

var i, nt, ncouples : cardinal;
var D1, D2, u0, u, v, u_preced, v_preced : real; // pas d'entiers ici !

const epsilon = 1E-03; // il suffit de changer ici la précision

procedure passer_lignes(nl : cardinal); // pour passer nl lignes
var i : cardinal;
begin
for i :=1 to nl do writeln
end;

begin
// saisie des données initiales
write('donnez l''abscisse de la 1ère demoiselle : '); // attention : doublement de l'apostrophe
readln(D1);
write('donnez l''abscisse de la 2ème demoiselle : ');
readln(D2);

write('donnez l''abscisse de départ de l''indécis : ');
readln(u0);

// dans un 1er temps on demande de calculer les n 1ers termes de la suite
write('donnez un nombre de termes à calculer : '); readln(nt);
u := u0;
writeln ('point initial : ', u:10:4);
for i := 1 to nt do
	begin
	// si i est impair l'indécis va vers D1 sinon vers D2
	// une solution simple sera de tester la parité de i :
	if i mod 2 = 1 
		then u := (u + D1) / 2
		else u := (u + D2) / 2;
	writeln ('point suivant : ', u:10:4); // format d'affichage
						// sur 10 caractères dont 4 décimales
	end;
passer_lignes(2);

// le constat étant fait que cette suite ne converge pas vers une limite
// mais présente 2 points d'accumulation représentant le segment
// que notre indécis parcourera à l'infini
// on propose de re-calculer cette suite avec 2 variables
// et de regrouper le calcul des termes 2 à 2
// on sait en effet que l'on passe de impair-D1 à pair-D2 à chaque fois

write('donnez un nombre de termes à calculer : '); readln(nt);

// on calcule alors nt/2 couples (u,v), le 1er étant v
v := u0;
writeln ('point initial : ', v:10:4);
for i := 1 to (nt div 2) do
	begin
	u := (v + D1) / 2;
	v := (u + D2) / 2;
	writeln ('points suivants : ', u:10:4, v:10:4);
	end;
passer_lignes(2);

// pour éviter à notre indécis un cheminement infini on décide
// de l'arrêter quand les points seront atteints avec une précision donnée
// pour effectuer ce calcul on a cette fois besoin de 4 variables
// il faut en effet pouvoir comparer 2 positions successives de l'indécis
// soit alors (u,v) et (u_preced, v_preced) les 2 derniers couples calculés

// l'initialisation doit porter sur 4 valeurs
u_preced := u0;
v_preced := (D1 + u0) / 2;
u:= (v_preced + D2) / 2;
v:= (u + D1) / 2;

// le compteur ncouples compte alors le nombre d'allers-retours accordés à l'indécis
ncouples :=2;
writeln('couple de rang  1:',u_preced:10:4,v_preced:10:4);
writeln('couple de rang  2 :',u:10:4,v:10:4);
// l'itération se poursuit tant que la précision cherchée n'est pas atteinte
// c'est donc un "and" qui relie les 2 booléens
// à noter l'utilisation de "abs" pour prendre les valeurs absolues des écarts

while (abs(u-u_preced) > epsilon) and (abs(v-v_preced) > epsilon) do
	begin
	u_preced := u;
	u:= (v + D1) / 2;
	v_preced := v; // ne pas changer v avant calcul de u !!!
	v:= (u + D2) / 2;
	ncouples := ncouples + 1;
	writeln('couple de rang ',ncouples:2,':',u:10:4,v:10:4);
	end;
passer_lignes(2);

writeln('les demoiselles sont en ',D1:10:4,' et en ',D2:10:4);
writeln('l''indécis part de ',u0:10:4);
writeln('après ',ncouples,' allers-retours');
writeln('les points d''accumulation', u:10:4, ' et ', v:10:4,' sont atteints à ',epsilon:10:4,' près !');

// N.B. on peut aisément transposer ce pb sur le plan :
// avec n demoiselles repérées en abscisses et ordonnées 
// on obtiendrait un polygone défini par n points d'accumulation...

end.

exemple d'exécution :

donnez l'abscisse de la 1ère demoiselle : 5.33
donnez l'abscisse de la 2ème demoiselle : 56.8
donnez l'abscisse de départ de l'indécis : 1.9
donnez un nombre de termes à calculer : 10
point initial :     1.9000
point suivant :     3.6150
point suivant :    30.2075
point suivant :    17.7688
point suivant :    37.2844
point suivant :    21.3072
point suivant :    39.0536
point suivant :    22.1918
point suivant :    39.4959
point suivant :    22.4129
point suivant :    39.6065


donnez un nombre de termes à calculer : 20
point initial :     1.9000
points suivants :     3.6150   30.2075
points suivants :    17.7688   37.2844
points suivants :    21.3072   39.0536
points suivants :    22.1918   39.4959
points suivants :    22.4129   39.6065
points suivants :    22.4682   39.6341
points suivants :    22.4821   39.6410
points suivants :    22.4855   39.6428
points suivants :    22.4864   39.6432
points suivants :    22.4866   39.6433


couple de rang  1:    1.9000    3.6150
couple de rang  2 :   30.2075   17.7688
couple de rang  3:   11.5494   34.1747
couple de rang  4:   19.7523   38.2762
couple de rang  5:   21.8031   39.3015
couple de rang  6:   22.3158   39.5579
couple de rang  7:   22.4439   39.6220
couple de rang  8:   22.4760   39.6380
couple de rang  9:   22.4840   39.6420
couple de rang 10:   22.4860   39.6430
couple de rang 11:   22.4865   39.6432


les demoiselles sont en     5.3300 et en    56.8000
l'indécis part de     1.9000
après 11 allers-retours
les points d'accumulation   22.4865 et    39.6432 sont atteints à     0.0010 près !
