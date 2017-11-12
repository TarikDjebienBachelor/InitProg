//Tutorat du 24/10/07


//Le programme suivant répartit les cartes mélangées quelconques 
// du tas 1 sur 4 tas à raison d'1 couleur par tas

// Quand on veut séparer 2 couleurs il faut nécessairement 3 tas :
// le tas de départ et 2 tas pour 2 couleurs. 
// Il n'y a que 4 tas donc on procède en plusieurs fois : 

// 1- on sépare les noires et les rouges depuis 1 sur 2 et 3
// tas 1 vide, tas 2 = [P+T], tas 3 = [C+K], tas 4 = vide

// 2- on sépare les P et les T depuis 2 sur 1 et 4
// tas 1 = [P], tas 2 = vide, tas 3 = [C+K], tas 4 = [T]

// 3- on sépare les C et les K depuis 3 sur 2 et 4 par exemple 
// sur ce dernier tas les K seront au-dessus des T
// tas 1 = [P], tas 2 = [C], tas 3 = vide, tas 4 = [T] [K]

// 4- on ramène les K au-dessus des T depuis 4 vers 3
//tas 1 = [P], tas 2 = [C], tas 3 = [K], tas 4 = [T]

// on aurait pu gagner une étape en séparant les C sur 2 les K sur 3 
// et les noires sur 4 : à vous de le refaire

program separer_4_couleurs;
// SI : tas 1 = [T+P+C+K]
// SF : tas 1 = [P], tas 2 = [C], tas 3 = [K], tas 4 = [T]

// clause de contexte : ce pgm utilise "cartes"
// donc les actions-procédures inittas, deplacersommet
// ainsi que les tests-fonctions sommettrefle, tasvide etc
uses cartes;

// tête du pgm : on y déclare les variables et les traitements
// ici rien

begin // du corps du pgm
// rappel : le point-virgule est un séparateur qui sépare
// chaque instruction de la suivante
// l'alternative s'écrit sans point-virgule devant le else !!!
// si besoin on enferme une séquence entre les parenthèses begin et end
// par exemple derrière then, derrière else, derrière do

// on initialise le tas 1 avec des noires
InitTas(1,'[K+T+C+P]');

// 1- on sépare les noires et les rouges depuis 1 sur 2 et 3 :
// tester si une carte est noire c'est tester que c'est un P ou un T
// notez l'utilisation de or comme opérateur booléen
// on pourrait aussi utiliser la fonction couleursommet
// et comparer la couleur-résultat à pique ou trefle :
// (couleursommet(1)=pique) or (couleursommet(1)=trefle)

while tasnonvide(1) do // on vérifie d'abord qu'il existe une carte
	begin
	if sommettrefle(1) or sommetpique(1) then // puis sa couleur
			  	begin
				deplacersommet(1,2);
			    	end
					else
			  	begin
     			  	deplacersommet(1,3);
				end;
     end;

// en sortie de l'itération on a
// tas 1 vide, tas 2 = [P+T], tas 3 = [C+K], tas 4 = vide


// 2- on sépare les P et les T depuis 2 sur 1 et 4 :
// c'est le même principe d'itération, pensez à copier-coller-corriger

while tasnonvide(2) do // on vérifie d'abord qu'il existe une carte
	begin
	if sommettrefle(2) then // puis sa couleur
			  	begin
				deplacersommet(2,4);
			    	end
			  else
			  	begin
     			  	deplacersommet(2,1);
				end;
	end;

// en sortie de l'itération on a
// tas 1 = [P], tas 2 = vide, tas 3 = [C+K], tas 4 = [T]

// 3- on sépare les C et les K depuis 3 sur 2 et 4 par exemple 
// sur ce dernier tas les K seront au-dessus des T

while tasnonvide(3) do // on vérifie d'abord qu'il existe une carte
	begin
	if sommetcoeur(3) then // puis sa couleur
			  	begin
				deplacersommet(3,2);
			    	end
			  else
			  	begin
     			  	deplacersommet(3,4);
				end;
       end;

// en sortie de l'itération on a
// tas 1 = [P], tas 2 = [C], tas 3 = vide, tas 4 = [T] [K]

// 4- on ramène les K au-dessus des T depuis 4 vers 3
// soit on trouve un T sur 4 et on s'arrête
// soit on a vidé le tas 4 (il n'y avait pas de T)
// si on s'arrête par l'une OU l'autre de ces conditions
// on continue tant que l'on a Ni l'une NI l'autre
// donc tant que tasnonvide(4) ET sommetcarreau(4)
// en tenant compte de l'ordre de ces tests !

while tasnonvide(4) and sommetcarreau(4)do
      Begin
      Deplacersommet(4,3)
      End;

//et donc : tas 1 = [P], tas 2 = [C], tas 3 = [K], tas 4 = [T]
end. // fin du pgm
