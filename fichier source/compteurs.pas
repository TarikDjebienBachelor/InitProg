// program qui utilise des compteurs
// relatifs aux nombres de cartes des tas

program compter;

uses cartes;

// on a besoin de compteurs donc de variables qu'il faut nommer
// et auxquelles on associe des valeurs entières positives ou nulles
// donc de type cardinal
// on les appellera avec des noms significatifs
// par exemple n1, n2... pour les tas 1, 2...
// et nT, NR... pour nombre de T ou nombre de Rouges

// déclaration de variables ds la tête du pgm
// le contenu de ces variables est "indéterminé"
// càd que la machine Pascal associe une zone-mémoire qui contient n'importe quoi

var nN, nR : cardinal;

begin

// initialisation
inittas(1,'[T+P+K+C]');

// initialisation des compteurs à 0
// c'est à vous qu'incombe l'obligation de mettre les compteurs à 0
// c'est une initialisation : la valeur initiale va servir

nN := 0;
nR := 0;

// l'affectation notée := n'est pas une égalité
// le signe = est un comparateur qui sert à tester l'égalité
// par exemple : if n1 = n2 then....
// l'affectation est une action qui recopie dans la variable citée à gauche
// la valeur obtenue à droite du :=
// la variable de gauche est en contexte de nom (contenant)
// les variables citées à droite sont en contexte de valeur (contenu)
// ce sont les valeurs qui sont utilisées

while tasnonvide(1) do
	begin
	if sommettrefle(1) or sommetpique(1) then
		begin
		// on déplace
		deplacersommet(1,2);
		// et on ajoute 1 au compteur des noires nN
		// c'est une action qui prend la valeur de nN citée à droite, ajoute 1
		// et recopie la nouvelle valeur dans nN citée à gauche comme contenant
		nN := nN +1 	
		end
			else
		begin
		deplacersommet(1,3);
		nR := nR+1
		end
	end;

// après avoir calculé ces nombres, la machine les garde en mémoire
// si on veut les connaître il faut les faire afficher
// write ou writeln sont des procédures standard d'écriture
// appelées avec des paramètres valeur càd des valeurs
// qui peuvent être ici chaines de caractères ou numériques

write ('il y a '); // consigne pour l'utilisateur
write(nN); // pour afficher le contenu de nN
writeln(' noires');

// ou en regroupant avec un seul appel
writeln; // pour passer une ligne à l'écran
writeln('il y a ', nR, ' rouges');

// on peut comparer ces compteurs 
writeln;
if nN > nR then
	 writeln ('il y a davantage de noires')
	   else
	 writeln ('il y a davantage de rouges')	

// que se passe-t-il en cas d'égalité : justifiez-le

// créez maintenant 2 autres compteurs pour les C et les K
// et procédez au calcul et à l'affichage
// du nb de C et de K

// reprenez le problème :
// après calcul de nN et nR choisissez de calculer
// le nombre de C et K si nR est plus grand
// ou le nombre de T et P si nN est plus grand
// et affichez la couleur la plus représentée

end.

// pensez à garder trace d'une exécution en sélectionnant la zone dans le terminal 
// et en la recopiant après le end final (clic bouton milieu de souris sous linux)

// ci-dessous le résultat final
+----------+----------+----------+----------+
|          |    7   T |    6   K |          |
|          |   dame P |   10   C |          |
|          |    3   T |    4   K |          |
|          |   dame P |    4   K |          |
|          |    3   P |    8   K |          |
|          |    9   P |    6   C |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+
il y a 6 noires

il y a 6 rouges




