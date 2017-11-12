// program qui calcule le barycentre d'1 liste de points au fur et à mesure de leur saisie

program barycentre_liste;

// on choisit de représenter un point par un triplet de réels positifs
// soit dans l'ordre abscisse, ordonnée et poids
// la liste sera constituée de triplets, dont le dernier égal à (0,0,0)
// servira de valeur d'arrêt

// on utilisera TROIS variables pour la saisie : X, Y et P et
// trois variables pour le barycentre : BX, BY et BP
// à tout instant on aura
// dans X Y et P les dernières valeurs saisies correspondant au dernier point pris en compte
// dans BX, BY et BP les valeurs calculées correspondant
// au barycentre des points pris en compte AVANT le dernier

var X, Y, P, BX, BY, BP, NP : real;


begin // du pgm


// il faut initialiser le barycentre : par exemple à (0,0,0)
// si on convient que tous les points sont d'abscisses, ordonnées et poids positifs

BX := 0;
BY := 0;
BP := 0;

// il faut faire une 1ère saisie pour amorcer la situation à un instant donné 
write('donnez l''abscisse du 1er point : '); 				
readln(X);
write('donnez l''ordonnée du 1er point : '); 				
readln(Y);
write('donnez le poids du 1er point : '); 				
readln(P);

// à cet instant X Y et P correspondent au dernier point pris en compte
// et (0,0,0) est le barycentre des points précédents

writeln ('le dernier point est défini par ',X:10:2, Y:10:2, P:10:2);
writeln ('et le barycentre des points précédents est défini par ', BX:10:2, BY:10:2, BP:10:2);
writeln;
while P<> 0 do // on choisit ici de tester l'arrêt sur le poids
	begin
	// 1. màj de BX BY et BP
	NP := BP + P; // attention au piège : ne pas modifier BP avant màj de BX et BY !
	BX := (BX*BP + X*P)/NP;
	BY := (BY*BP + Y*P)/NP;
	BP := NP;
	// 2. on passe ensuite et toujours en dernier au point suivant
	write('donnez l''abscisse du point suivant ou 0 pour finir : '); 				
	readln(X);
	write('donnez l''ordonnée du point suivant ou 0 pour finir : '); 				
	readln(Y);
	write('donnez le poids du point suivant ou 0 pour finir : '); 				
	readln(P);
	// à cet instant (X, Y, P) correspond au dernier point pris en compte
	// et (BX, BY, BP) au barycentre des points précédemment pris en compte
	// on peut éventuellement l'afficher après chaque saisie
	writeln ('le dernier point est défini par ',X:10:2, Y:10:2, P:10:2);
	writeln ('et le barycentre des points précédents est défini par ', BX:10:2, BY:10:2, BP:10:2);
	writeln;
	end;

// en sortie de l'itération 
// (BX, BY, BP) correspond au barycentre de tous les points significatifs de la liste 

writeln ('le barycentre des points de la liste est défini par ', BX:10:2, BY:10:2, BP:10:2);

// reprenez l'exercice en considérant des colis définis par
// longueur, largeur et hauteur
// et calculez le plus grand volume d'une liste de colis
// question subsidiaire : comment en retenir le rang ?

// vous reprendrez l'exercice avec les types tableau et enregistrement

end.

donnez l'abscisse du 1er point : 10
donnez l'ordonnée du 1er point : 10
donnez le poids du 1er point : 1
le dernier point est défini par      10.00     10.00      1.00
et le barycentre des points précédents est défini par       0.00      0.00      0.00

donnez l'abscisse du point suivant ou 0 pour finir : 20
donnez l'ordonnée du point suivant ou 0 pour finir : 20
donnez le poids du point suivant ou 0 pour finir : 3
le dernier point est défini par      20.00     20.00      3.00
et le barycentre des points précédents est défini par      10.00     10.00      1.00

donnez l'abscisse du point suivant ou 0 pour finir : 0
donnez l'ordonnée du point suivant ou 0 pour finir : 0
donnez le poids du point suivant ou 0 pour finir : 0
le dernier point est défini par       0.00      0.00      0.00
et le barycentre des points précédents est défini par      17.50     17.50      4.00

le barycentre des points de la liste est défini par      17.50     17.50      4.00




