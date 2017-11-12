// program qui affiche le plus grand de 2 puis 3 puis 4 nombres
// le pb est différent selon que l'on se contente d'afficher,  ou de stocker le maximum
// ou encore d'ordonner les nombres càd de ranger les valeurs en ordre croissant dans les variables


program maximums;

// on traitera de 2,3 ou 4 nombres et on déclare en tête du pgm 5 variables
// A B C D pour les nombres et MAX2 MAX3 MAX4 pour les maximums
// on choisit le type INTEGER pour traiter d'éventuels nombres négatifs

var A,B,C,D,TR,MAX3,MAX4 : integer;
// à cet instant A B C et D sont des zones-mémoires au contenu indéterminé

begin // du pgm

// saisie des données
// on rappelle que la machine Pascal exécute les ordres donnés par le pgm
// c'est la machine Pascal qui lit depuis le clavier et recopie ds les variables
// c'est la machine Pascal qui écrit soit les consignes soit les valeurs résultats souhaitées

// lecture de A B C D

write('donnez un 1er entier : '); // la machine Pascal affiche la consigne
				
readln(A); 	// il ne se passe rien ... tant que l'utilisateur n'intervient pas !
		// quand l'utilisateur intervient : valeur tapée au clavier validée par touche "entrée"
		// la machine Pascal la lit et la recopie ds la variable A

write('donnez un 2ème entier : ');
readln(B);

write('donnez un 3ème entier : ');
readln(C); 

write('donnez un 4ème entier : ');
readln(D); 

// calcul et affichage du maximum de 2 nombres A et B

if A > B then
	begin
	// on est sûr ici que A est > à B
	writeln('le maximum de ', A, ' et ', B,' est ',A)
	end
	else
	begin
	// on est sûr ici que A est < ou = à B, le cas d'égalité est traité en branche sinon
	writeln('le maximum de ', A, ' et ', B,' est ',B)
	end;

writeln; // pour aller à la ligne sur l'écran

// "valeur affichée = valeur perdue" càd qu'après exécution de l'instruction alternative précédente
// on ne sait plus si A > B ou non
// si l'on veut conserver le maximum il faut le stocker dans une variable

// reprenons le pb avec 3 nbs A B et C pour calculer MAX3
// l'instruction alternative ou encore conditionnelle suivante
// envisage tous les cas possibles
// à l'exécution du pgm une seule branche sera empruntée et une seule affectation exécutée

if A > B then
	// on est sûr ici que A > B
	begin
	if A > C then
			// on est sûr ici que A > B et A > c
			begin
			MAX3 := A // on conserve la valeur de A dans la variable MAX3 (contenant)
					// inutile d'initialiser MAX3 avant
			end
		else
			// on est sûr ici que A > B et C > ou = à A donc C >=A>B
			begin
			MAX3 := C
			end
	end

	else
	// on est sûr ici que A < ou = B
	begin
	if  B > C then
			// on est sûr ici que B > C et B >= A
			begin
			MAX3 := B
			end
		  else
			// on est sûr ici que B >= A et B <= C
			begin
			MAX3 := C
			end
	end;

// puisque MAX3 a été calculé on peut l'afficher

write ('voici vos 3 premiers nombres : ');
writeln (a,' ',B,' ',C);
write ('voici le maximum des 3 nombres : '); writeln(MAX3);
writeln;

// si l'on veut calculer le maximum de 4 nombres on pourrait reprendre
// la démarche précédente "si A > B alors si A > C alors si A > D alors etc
// mieux vaut réfléchir à une généralisation en considérant des comparaisons de 2 nombres à la fois
// calculons m = max(A,B)
// en comparant m à C on redéfinirait m = max(A,B,C)
// en comparant m à D on définirait le maximum de A B C D etc
// c'est donc une comparaison 2 à 2 avec mise à jour du maximum qui répond à la généralisation

writeln('comparaison avec mise à jour');
if A > B then
	begin
	MAX4 := A //inutile ici d'initialiser MAX4
	end
	else
	begin
	MAX4 := B
	end;

writeln('max de ', A, ' et ', B, ' = ',MAX4);
writeln;

// la comparaison suivante de MAX4 et C entraîne une mise à jour éventuelle de MAX4
// notez le si alors sans sinon
if C > MAX4 then
	begin
	MAX4 := C 
	end;

writeln('max de ', A, ' et ', B, ' et ', C,' = ', MAX4);
writeln;

// et on généralise :

if D > MAX4 then
	begin
	MAX4 := D 
	end;


writeln('max de ', A, ' et ', B, ' et ', C, ' et ', D, ' = ', MAX4);
writeln;

// on traiterait ainsi 5 nombres, si 6 nombres etc
// le pb sera repris avec la structure de données tableau
// en écrivant UNE seule action de comparaison-mise à jour qui sera répétée AUTANT DE FOIS QUE NECESSAIRE

// mise en ordre des variables
// traitement de 3 variables
// il s'agit ds le même ordre d'idée de permuter les varaibles 2 à 2

writeln('état initial : ',A,' ',B,' ',C);
if A > B then
	// on permute A et B pour obtenir A et B en ordre croissant
	begin
	TR := A;
	A := B;
	B := TR
	// notez l'obligation d'utiliser une variable annexe de transfert TR
	end;
 // on est sûr ici que A <= B
writeln('état après ordre sur les 2 premiers : ',A,' ',B,' ',C);

if B > C then
	// on permute B et C
	// il faudra vérifier l'incidence de cette action sur A et la nouvelle valeur de B
	begin
	TR := B;
	B := C;
	C := TR;
	if A > B then
		// on repermute A et B pour obtenir A et B en ordre croissant
		// on réutilise TR sans problème
		begin
		TR := A;
		A := B;
		B := TR
		end;
	end;

writeln('état après ordre sur les 3 premiers : ',A,' ',B,' ',C);	

// à vous de traiter la mise en ordre sur les 4 nombres
// le pb sera repris avec les tableaux

end.

// ci-dessous trace d'une exécution :

donnez un 1er entier : 10
donnez un 2ème entier : 21
donnez un 3ème entier : -5
donnez un 4ème entier : 46
le maximum de 10 et 21 est 21

voici vos 3 premiers nombres : 10 21 -5
voici le maximum des 3 nombres : 21

comparaison avec mise à jour
max de 10 et 21 = 21

max de 10 et 21 et -5 = 21

max de 10 et 21 et -5 et 46 = 46

max de 10 et 21 et -54 et 32 = 32

état initial : 10 21 -5
état après ordre sur les 2 premiers : 10 21 -5
état après ordre sur les 3 premiers : -5 10 21
