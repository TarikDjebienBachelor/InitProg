// version table de Pythagore avec proc�dure
// pgm qui appelle une proc�dure qui affiche la table de multiplication
// des nombres d'un intervalle de 1 � n donn� par eux-m�mes

// on utilise le formatage pour afficher les entiers 
// exemple : write (N : 4) pour cadrer N 
// sur 4 caract�res � droite (avec signe "-" �ventuel)

// on affiche ligne par ligne
// on a donc besoin d'un indice lig variant de 1 au nombre n donn� en param�tre
// et pour chaque ligne d'un indice col variant aussi de 1 � n

// on aura 2 boucles en "pour" imbriqu�es
// l'affichage pour chaque ligne n�cessitant une boucle sur les colonnes

//ci-dessous la proc�dure passer_lignes 
// notez son appel dans la proc�dure pytha autant que ds le pgm principal

procedure passer_lignes(nl : cardinal);
var i : cardinal;
begin
for i :=1 to nl do writeln
end;

procedure pytha (n : cardinal);
// notez le param�tre n nombre entier positif
// qui permet de choisir la borne sup�rieure de la table
// on pourrait imaginer d'afficher la table avec des n�gatifs
// pensez ds ce cas � inverser la boucle

// n est un nom formel quelconque ind�pendant du programme

// declaration des locales (caisse � outils de la proc�dure)
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

// affichage du num�ro de ligne
// suivi de l'affichage des produits pour chaque valeur de lig

for lig := 1 to n do
	begin
	write(lig : 4);write(' |');
	// affichage des produits lig*col pour chaque valeur de col
	for col := 1 to n do
		begin
		write(lig * col : 4)
		end;
	// ne pas oublier le passage � la ligne pour les autres lignes
	writeln
	end;
passer_lignes(2);
end;

var nb : cardinal;

begin // du pgm
	write ('donnez un nombre entier positif : ');
	// si vous prenez nb trop grand la table ne tiendra pas � raison d'une ligne par ligne �cran
	readln(nb);

	passer_lignes(2);
	writeln ('voici la table de Pythagore correspondante : ');
	pytha (nb);
	// notez le param�tre d'appel nb qui jouera le r�le de n
	// il n'y a aucune raison de prendre les m�mes noms
	// pour param�tres formels et param�tres d'appel

	// voici d'autres appels avec param�tres en contexte de valeur :
	pytha (4);
	pytha (nb+1);
	pytha (nb+nb);

end.
