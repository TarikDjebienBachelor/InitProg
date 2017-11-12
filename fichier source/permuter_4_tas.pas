// exempprogram permuter_4_tasle de pgm qui fait une permutation circulaire des tas :
// SI : tas 1 = [P], tas 2 = [C], tas 3 = [K], tas 4 = [T]
// SF : tas 1 = [T], tas 2 = [P], tas 3 = [C], tas 4 = [K]
// il s?agit de vider 1 tas sur 1 autre
// on construit une procédure dont on fait différents appels
program permuter_4_tas;


Uses cartes;

// tête du pgm qui contient les déclarations
// ici la procédure vidertas

// procédure = action complexe nommée par un verbe avec des paramètres 
// il faut distinguer la déclaration (tête du pgm)
// et l?appel (action ds le corps du pgm)
// la déclaration de procédure consiste en un bloc nom-tête-corps
// paramètres formels : des noms qcq choisis par vous mais ayant un sens
// en nb donné, en ordre donné, avec des types donnés
// à l'appel il faudra respecter ce nb, l'ordre et les types
// corps enfermé entre "begin" et "end"
// ici proc qui porte sur 2 tas, plus exactement sur 2 numéros de tas
// nommés ndepart et narrivee de type "TasPossibles" 
// comme précisé dans "cartes", et valant exclusivement 1 2 3 ou 4
// à l?appel chaque paramètre d?appel jouera le rôle du paramètre formel 
// de rang correspondant
// ordre important : vidertas(1,4) est différent de vidertas(4,1)

procedure ViderTas(ndepart, narrivee : TasPossibles);
begin //du corps de proc
while not TasVide(ndepart) do
	begin
	deplacersommet(ndepart,narrivee);
	end;
end;//du corps de proc

begin // corps du pgm

inittas(1,'[P]');
inittas(2,'[C]');
inittas(3,'[K]');
inittas(4,'[T]');


// 1- on vide le tas 4 sur le tas 1
// 1er appel de la procédure vidertas, notez l?état du tas 1

Vidertas(4,1); // c?est une instruction

// tas 1 = [P][T], tas 2 = [C], tas 3 = [K], tas 4 = vide

// les 2 appels suivants dans cet ordre videront 3 sur 4 puis 2 sur 3

Vidertas(3,4);
Vidertas(2,3);

//  tas 1 = [P][T], tas 2 = vide, tas 3 = [C], tas 4 = [K]

// on ne peut pas  utiliser vidertas pour le tas 1 car il ne faut enlever que les T
// voir pgm vider_separer_4_couleurs
while tasnonvide(1) and sommettrefle(1)do
      Begin
      Deplacersommet(1,3)
      End;
//  tas 1 = [P], tas 2 = vide, tas 3 = [C][T], tas 4 = [K]

// on vide 1 sur 2

Vidertas(1,2);
//  tas 1 = vide, tas 2 = [P], tas 3 = [C][T], tas 4 = [K]

// puis on retourne chercher les T du tas 3 pour les ramener en 1

while tasnonvide(3) and sommettrefle(3)do
      Begin
      Deplacersommet(3,1)
      End;
// tas 1 = [T], tas 2 = [P], tas 3 = [C], tas 4 = [K]

End.

// tout ce qu?on écrit après le end final d?un pgm est ignoré
// profitez-en pour recopier ici un exemple d?exécution
// ou faire des remarques

// si l?on voulait écrire une procédure qui enlève les cartes
// d?une couleur donnée situées sur un tas donné
// vers un autre tas donné
// on aurait besoin de la paramétrer avec 2 numéros de tas
// et avec une couleur
// il faudrait donc utiliser la fonction couleursommet
// et passer une couleur en paramètre

// par exemple enlever les T du tas 3 vers le tas 4
// se traduirait par l?appel
// enlevercartes(trefle, 3, 4);

// on écrit alors la procédure suivante :

procedure enlevercartes(color : couleurs ; ndep, narr : taspossibles);
Begin
while tasnonvide(ndep) and couleursommet(ndep) = color do
      Begin
      Deplacersommet(ndep,narr)
      End
End;

// insérez cette déclaration ds la tête du pgm et
// remplacez les tas 1 et 3 par les appels correspondants 

