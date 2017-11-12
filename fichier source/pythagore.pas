program table_Pythagore;

// pgm qui affiche la table de multiplication
// des nombres de 1 � 10 par eux-m�mes


// on utilise le formatage pour afficher les entiers 
// exemple : write (N : 4) pour cadrer N 
// sur 4 caract�res � droite (avec signe "-" �ventuel)

// on affiche ligne par ligne
// on a donc besoin d'un indice lig variant de 1 � 10
// et pour chaque ligne d'un indice col variant aussi de 1 � 10

// on aura 2 boucles en "pour" imbriqu�es
// l'affichage pour chaque ligne n�cessitant une boucle sur les colonnes

var lig, col : cardinal;


begin

// affichage de la ligne de 10 nombres

write('     |'); 
for col := 1 to 10 do
	begin
	write(col : 4)
	end;
writeln;
writeln('______________________________________________');

// affichage du num�ro de ligne
// suivi de l'affichage des produits pour chaque valeur de lig
for lig := 1 to 10 do
	begin
	write(lig : 4);write(' |');
	// affichage des produits lig*col pour chaque valeur de col
	for col := 1 to 10 do
		begin
		write(lig * col : 4)
		end;
	// ne pas oublier le passage � la ligne pour les autres lignes
	writeln
	end;

end.
