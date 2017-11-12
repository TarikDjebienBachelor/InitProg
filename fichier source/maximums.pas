// program qui affiche le plus grand de 2 puis 3 puis 4 nombres
// le pb est diff�rent selon que l'on se contente d'afficher,  ou de stocker le maximum
// ou encore d'ordonner les nombres c�d de ranger les valeurs en ordre croissant dans les variables


program maximums;

// on traitera de 2,3 ou 4 nombres et on d�clare en t�te du pgm 5 variables
// A B C D pour les nombres et MAX2 MAX3 MAX4 pour les maximums
// on choisit le type INTEGER pour traiter d'�ventuels nombres n�gatifs

var A,B,C,D,TR,MAX3,MAX4 : integer;
// � cet instant A B C et D sont des zones-m�moires au contenu ind�termin�

begin // du pgm

// saisie des donn�es
// on rappelle que la machine Pascal ex�cute les ordres donn�s par le pgm
// c'est la machine Pascal qui lit depuis le clavier et recopie ds les variables
// c'est la machine Pascal qui �crit soit les consignes soit les valeurs r�sultats souhait�es

// lecture de A B C D

write('donnez un 1er entier : '); // la machine Pascal affiche la consigne
				
readln(A); 	// il ne se passe rien ... tant que l'utilisateur n'intervient pas !
		// quand l'utilisateur intervient : valeur tap�e au clavier valid�e par touche "entr�e"
		// la machine Pascal la lit et la recopie ds la variable A

write('donnez un 2�me entier : ');
readln(B);

write('donnez un 3�me entier : ');
readln(C); 

write('donnez un 4�me entier : ');
readln(D); 

// calcul et affichage du maximum de 2 nombres A et B

if A > B then
	begin
	// on est s�r ici que A est > � B
	writeln('le maximum de ', A, ' et ', B,' est ',A)
	end
	else
	begin
	// on est s�r ici que A est < ou = � B, le cas d'�galit� est trait� en branche sinon
	writeln('le maximum de ', A, ' et ', B,' est ',B)
	end;

writeln; // pour aller � la ligne sur l'�cran

// "valeur affich�e = valeur perdue" c�d qu'apr�s ex�cution de l'instruction alternative pr�c�dente
// on ne sait plus si A > B ou non
// si l'on veut conserver le maximum il faut le stocker dans une variable

// reprenons le pb avec 3 nbs A B et C pour calculer MAX3
// l'instruction alternative ou encore conditionnelle suivante
// envisage tous les cas possibles
// � l'ex�cution du pgm une seule branche sera emprunt�e et une seule affectation ex�cut�e

if A > B then
	// on est s�r ici que A > B
	begin
	if A > C then
			// on est s�r ici que A > B et A > c
			begin
			MAX3 := A // on conserve la valeur de A dans la variable MAX3 (contenant)
					// inutile d'initialiser MAX3 avant
			end
		else
			// on est s�r ici que A > B et C > ou = � A donc C >=A>B
			begin
			MAX3 := C
			end
	end

	else
	// on est s�r ici que A < ou = B
	begin
	if  B > C then
			// on est s�r ici que B > C et B >= A
			begin
			MAX3 := B
			end
		  else
			// on est s�r ici que B >= A et B <= C
			begin
			MAX3 := C
			end
	end;

// puisque MAX3 a �t� calcul� on peut l'afficher

write ('voici vos 3 premiers nombres : ');
writeln (a,' ',B,' ',C);
write ('voici le maximum des 3 nombres : '); writeln(MAX3);
writeln;

// si l'on veut calculer le maximum de 4 nombres on pourrait reprendre
// la d�marche pr�c�dente "si A > B alors si A > C alors si A > D alors etc
// mieux vaut r�fl�chir � une g�n�ralisation en consid�rant des comparaisons de 2 nombres � la fois
// calculons m = max(A,B)
// en comparant m � C on red�finirait m = max(A,B,C)
// en comparant m � D on d�finirait le maximum de A B C D etc
// c'est donc une comparaison 2 � 2 avec mise � jour du maximum qui r�pond � la g�n�ralisation

writeln('comparaison avec mise � jour');
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

// la comparaison suivante de MAX4 et C entra�ne une mise � jour �ventuelle de MAX4
// notez le si alors sans sinon
if C > MAX4 then
	begin
	MAX4 := C 
	end;

writeln('max de ', A, ' et ', B, ' et ', C,' = ', MAX4);
writeln;

// et on g�n�ralise :

if D > MAX4 then
	begin
	MAX4 := D 
	end;


writeln('max de ', A, ' et ', B, ' et ', C, ' et ', D, ' = ', MAX4);
writeln;

// on traiterait ainsi 5 nombres, si 6 nombres etc
// le pb sera repris avec la structure de donn�es tableau
// en �crivant UNE seule action de comparaison-mise � jour qui sera r�p�t�e AUTANT DE FOIS QUE NECESSAIRE

// mise en ordre des variables
// traitement de 3 variables
// il s'agit ds le m�me ordre d'id�e de permuter les varaibles 2 � 2

writeln('�tat initial : ',A,' ',B,' ',C);
if A > B then
	// on permute A et B pour obtenir A et B en ordre croissant
	begin
	TR := A;
	A := B;
	B := TR
	// notez l'obligation d'utiliser une variable annexe de transfert TR
	end;
 // on est s�r ici que A <= B
writeln('�tat apr�s ordre sur les 2 premiers : ',A,' ',B,' ',C);

if B > C then
	// on permute B et C
	// il faudra v�rifier l'incidence de cette action sur A et la nouvelle valeur de B
	begin
	TR := B;
	B := C;
	C := TR;
	if A > B then
		// on repermute A et B pour obtenir A et B en ordre croissant
		// on r�utilise TR sans probl�me
		begin
		TR := A;
		A := B;
		B := TR
		end;
	end;

writeln('�tat apr�s ordre sur les 3 premiers : ',A,' ',B,' ',C);	

// � vous de traiter la mise en ordre sur les 4 nombres
// le pb sera repris avec les tableaux

end.

// ci-dessous trace d'une ex�cution :

donnez un 1er entier : 10
donnez un 2�me entier : 21
donnez un 3�me entier : -5
donnez un 4�me entier : 46
le maximum de 10 et 21 est 21

voici vos 3 premiers nombres : 10 21 -5
voici le maximum des 3 nombres : 21

comparaison avec mise � jour
max de 10 et 21 = 21

max de 10 et 21 et -5 = 21

max de 10 et 21 et -5 et 46 = 46

max de 10 et 21 et -54 et 32 = 32

�tat initial : 10 21 -5
�tat apr�s ordre sur les 2 premiers : 10 21 -5
�tat apr�s ordre sur les 3 premiers : -5 10 21
