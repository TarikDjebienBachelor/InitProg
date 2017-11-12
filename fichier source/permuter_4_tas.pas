// exempprogram permuter_4_tasle de pgm qui fait une permutation circulaire des tas�:
// SI�: tas 1 = [P], tas 2 = [C], tas 3 = [K], tas 4 = [T]
// SF�: tas 1 = [T], tas 2 = [P], tas 3 = [C], tas 4 = [K]
// il s?agit de vider 1 tas sur 1 autre
// on construit une proc�dure dont on fait diff�rents appels
program permuter_4_tas;


Uses cartes;

// t�te du pgm qui contient les d�clarations
// ici la proc�dure vidertas

// proc�dure = action complexe nomm�e par un verbe avec des param�tres 
// il faut distinguer la d�claration (t�te du pgm)
// et l?appel (action ds le corps du pgm)
// la d�claration de proc�dure consiste en un bloc nom-t�te-corps
// param�tres formels : des noms qcq choisis par vous mais ayant un sens
// en nb donn�, en ordre donn�, avec des types donn�s
// � l'appel il faudra respecter ce nb, l'ordre et les types
// corps enferm� entre "begin" et "end"
// ici proc qui porte sur 2 tas, plus exactement sur 2 num�ros de tas
// nomm�s ndepart et narrivee de type "TasPossibles" 
// comme pr�cis� dans "cartes", et valant exclusivement 1 2 3 ou 4
// � l?appel chaque param�tre d?appel jouera le r�le du param�tre formel 
// de rang correspondant
// ordre important : vidertas(1,4) est diff�rent de vidertas(4,1)

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
// 1er appel de la proc�dure vidertas, notez l?�tat du tas 1

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

// tout ce qu?on �crit apr�s le end final d?un pgm est ignor�
// profitez-en pour recopier ici un exemple d?ex�cution
// ou faire des remarques

// si l?on voulait �crire une proc�dure qui enl�ve les cartes
// d?une couleur donn�e situ�es sur un tas donn�
// vers un autre tas donn�
// on aurait besoin de la param�trer avec 2 num�ros de tas
// et avec une couleur
// il faudrait donc utiliser la fonction couleursommet
// et passer une couleur en param�tre

// par exemple enlever les T du tas 3 vers le tas 4
// se traduirait par l?appel
// enlevercartes(trefle, 3, 4);

// on �crit alors la proc�dure suivante�:

procedure enlevercartes(color�: couleurs�; ndep, narr�: taspossibles);
Begin
while tasnonvide(ndep) and couleursommet(ndep) = color do
      Begin
      Deplacersommet(ndep,narr)
      End
End;

// ins�rez cette d�claration ds la t�te du pgm et
// remplacez les tas 1 et 3 par les appels correspondants 

