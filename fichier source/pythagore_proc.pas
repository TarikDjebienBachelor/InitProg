// version table de Pythagore avec procédure
// pgm qui appelle une procédure qui affiche la table de multiplication
// des nombres d'un intervalle de 1 à n donné par eux-mêmes

// on utilise le formatage pour afficher les entiers 
// exemple : write (N : 4) pour cadrer N 
// sur 4 caractères à droite (avec signe "-" éventuel)

// on affiche ligne par ligne
// on a donc besoin d'un indice lig variant de 1 au nombre n donné en paramètre
// et pour chaque ligne d'un indice col variant aussi de 1 à n

// on aura 2 boucles en "pour" imbriquées
// l'affichage pour chaque ligne nécessitant une boucle sur les colonnes

//ci-dessous la procédure passer_lignes 
// notez son appel dans la procédure pytha autant que ds le pgm principal

procedure passer_lignes(nl : cardinal);
var i : cardinal;
begin
for i :=1 to nl do writeln
end;

procedure pytha (n : cardinal);
// notez le paramètre n nombre entier positif
// qui permet de choisir la borne supérieure de la table
// on pourrait imaginer d'afficher la table avec des négatifs
// pensez ds ce cas à inverser la boucle

// n est un nom formel quelconque indépendant du programme

// declaration des locales (caisse à outils de la procédure)
var lig, col : cardinal;


begin
passer_lignes(1);
writeln('table de ',n:4);
// affichage de la ligne de n nombres

write('     |'); 
for col := 1 to n do
	begin
	write(col : 4)
	end;
writeln;
// ajuster le trait au nombre n
write('______');
for col := 1 to n do
	begin
	write('____');
	end;
writeln;

// affichage du numéro de ligne
// suivi de l'affichage des produits pour chaque valeur de lig

for lig := 1 to n do
	begin
	write(lig : 4);write(' |');
	// affichage des produits lig*col pour chaque valeur de col
	for col := 1 to n do
		begin
		write(lig * col : 4)
		end;
	// ne pas oublier le passage à la ligne pour les autres lignes
	writeln
	end;
passer_lignes(2);
end;

var nb : cardinal;

begin // du pgm
	write ('donnez un nombre entier positif : ');
	// si vous prenez nb trop grand la table ne tiendra pas à raison d'une ligne par ligne écran
	readln(nb);

	passer_lignes(2);
	writeln ('voici la table de Pythagore correspondante : ');
	pytha (nb);
	// notez le paramètre d'appel nb qui jouera le rôle de n
	// il n'y a aucune raison de prendre les mêmes noms
	// pour paramètres formels et paramètres d'appel

	// voici d'autres appels avec paramètres en contexte de valeur :
	pytha (4);
	pytha (nb+1);
	pytha (nb+nb);

end.
