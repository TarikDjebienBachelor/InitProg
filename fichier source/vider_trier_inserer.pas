program proc_vider_trier_inserer;
// pgm qui vide 1 tas sur 1 autre
// en ins�rant les cartes au fur et � mesure
//en �vitant de red�placer toutes les cartes � chaque �tape

// clause de contexte : ce pgm utilise "cartes"
uses cartes;

// t�te du pgm : on y d�clare les variables et les traitements
// ici pas de variable, juste 1 d�claration de proc�dure

// proc�dure = action complexe nomm�e par un verbe avec des param�tres 
// la d�claration de proc�dure consiste en un bloc nom-t�te-corps
// param�tres formels : des noms qcq choisis par vous mais ayant un sens
// en nb donn�, en ordre donn�, avec des types donn�s
// � l'appel il faudra respecter ce nb, l'ordre et les teypes
// corps enferm� entre "begin" et "end"
// ici proc qui porte sur 2 tas, d�part et arriv�e, de type non pas "integer" ou "cardinal" 
// mais "TasPossibles" comme pr�cis� dans "cartes", et valant exclusivement 1 2 3 ou 4
// ordre important : vidertas(1,4) ne signifie pas vidertas(4,1)

procedure ViderTas(ndep, narr : TasPossibles);
begin //du corps de proc
while not TasVide(ndep) do
	begin
	deplacersommet(ndep,narr);
	end;
end;//du corps de proc


begin // du corps du pgm

// on initialise le tas 1 avec des noires
InitTas(1,'[P+T]');


if tasnonvide(1) then deplacersommet(1,2);
//if tasnonvide(1) then
			//if superieur(1,2) then deplacersommet(1,3)
			//	    else begin
			//		 deplacersommet(2,3);
			//		 deplacersommet(1,2)
                          //               end;
// on a donc tas1 reste tas 2 plus ptt que 3 et on va organiser tas 2 croisst et tas 3 decroisst

while tasnonvide(1) do
	begin
	if superieur(1,2) then
			  	begin
                          	while tasnonvide(3) and superieur(1,3) do
					deplacersommet(3,2);
			    	end
			  else
			  	begin
     			  	while tasnonvide(2) and superieur(2,1) do
						deplacersommet(2,3);
				end;
	deplacersommet(1,2)
			  			
	end;
// si on a des cartes restantes sur 3 on peut les remettre sur 2
// vider 3 sur 2
// le corps du pgm qui contient des instructions contient ici un appel de la proc
// ViderTas, avec des param�tres effectifs
// qui jouent le r�le de ndep et narr
// attention � respecter le type, le nb et l'ordre des param�tres !

if tasnonvide(3) then vidertas(3,2)


end.
InitTas (Le_Tas => 1, l_expression => '[P+T]')
+----------+----------+----------+----------+
|  valet P |          |          |          |
|    as  T |          |          |          |
|   roi  P |          |          |          |
|    2   T |          |          |          |
|    4   P |          |          |          |
|  valet T |          |          |          |
|   10   T |          |          |          |
|    8   T |          |          |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+

DeplacerSommet (TasDepart => 1, TasArriv => 2)
+----------+----------+----------+----------+
|    as  T |          |          |          |
|   roi  P |          |          |          |
|    2   T |          |          |          |
|    4   P |          |          |          |
|  valet T |          |          |          |
|   10   T |          |          |          |
|    8   T |  valet P |          |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+

DeplacerSommet (TasDepart => 2, TasArriv => 3)
+----------+----------+----------+----------+
|    as  T |          |          |          |
|   roi  P |          |          |          |
|    2   T |          |          |          |
|    4   P |          |          |          |
|  valet T |          |          |          |
|   10   T |          |          |          |
|    8   T |          |  valet P |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+

DeplacerSommet (TasDepart => 1, TasArriv => 2)
+----------+----------+----------+----------+
|   roi  P |          |          |          |
|    2   T |          |          |          |
|    4   P |          |          |          |
|  valet T |          |          |          |
|   10   T |          |          |          |
|    8   T |    as  T |  valet P |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+

DeplacerSommet (TasDepart => 3, TasArriv => 2)
+----------+----------+----------+----------+
|   roi  P |          |          |          |
|    2   T |          |          |          |
|    4   P |          |          |          |
|  valet T |          |          |          |
|   10   T |  valet P |          |          |
|    8   T |    as  T |          |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+

DeplacerSommet (TasDepart => 1, TasArriv => 2)
+----------+----------+----------+----------+
|    2   T |          |          |          |
|    4   P |          |          |          |
|  valet T |   roi  P |          |          |
|   10   T |  valet P |          |          |
|    8   T |    as  T |          |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+

DeplacerSommet (TasDepart => 2, TasArriv => 3)
+----------+----------+----------+----------+
|    2   T |          |          |          |
|    4   P |          |          |          |
|  valet T |          |          |          |
|   10   T |  valet P |          |          |
|    8   T |    as  T |   roi  P |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+

DeplacerSommet (TasDepart => 2, TasArriv => 3)
+----------+----------+----------+----------+
|    2   T |          |          |          |
|    4   P |          |          |          |
|  valet T |          |          |          |
|   10   T |          |  valet P |          |
|    8   T |    as  T |   roi  P |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+

DeplacerSommet (TasDepart => 1, TasArriv => 2)
+----------+----------+----------+----------+
|    4   P |          |          |          |
|  valet T |          |          |          |
|   10   T |    2   T |  valet P |          |
|    8   T |    as  T |   roi  P |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+

DeplacerSommet (TasDepart => 1, TasArriv => 2)
+----------+----------+----------+----------+
|  valet T |    4   P |          |          |
|   10   T |    2   T |  valet P |          |
|    8   T |    as  T |   roi  P |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+

DeplacerSommet (TasDepart => 3, TasArriv => 2)
+----------+----------+----------+----------+
|          |  valet P |          |          |
|  valet T |    4   P |          |          |
|   10   T |    2   T |          |          |
|    8   T |    as  T |   roi  P |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+

DeplacerSommet (TasDepart => 1, TasArriv => 2)
+----------+----------+----------+----------+
|          |  valet T |          |          |
|          |  valet P |          |          |
|          |    4   P |          |          |
|   10   T |    2   T |          |          |
|    8   T |    as  T |   roi  P |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+

DeplacerSommet (TasDepart => 2, TasArriv => 3)
+----------+----------+----------+----------+
|          |  valet P |          |          |
|          |    4   P |          |          |
|   10   T |    2   T |  valet T |          |
|    8   T |    as  T |   roi  P |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+

DeplacerSommet (TasDepart => 2, TasArriv => 3)
+----------+----------+----------+----------+
|          |    4   P |  valet P |          |
|   10   T |    2   T |  valet T |          |
|    8   T |    as  T |   roi  P |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+

DeplacerSommet (TasDepart => 1, TasArriv => 2)
+----------+----------+----------+----------+
|          |   10   T |          |          |
|          |    4   P |  valet P |          |
|          |    2   T |  valet T |          |
|    8   T |    as  T |   roi  P |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+

DeplacerSommet (TasDepart => 2, TasArriv => 3)
+----------+----------+----------+----------+
|          |          |   10   T |          |
|          |    4   P |  valet P |          |
|          |    2   T |  valet T |          |
|    8   T |    as  T |   roi  P |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+

DeplacerSommet (TasDepart => 1, TasArriv => 2)
+----------+----------+----------+----------+
|          |    8   T |   10   T |          |
|          |    4   P |  valet P |          |
|          |    2   T |  valet T |          |
|          |    as  T |   roi  P |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+

DeplacerSommet (TasDepart => 3, TasArriv => 2)
+----------+----------+----------+----------+
|          |   10   T |          |          |
|          |    8   T |          |          |
|          |    4   P |  valet P |          |
|          |    2   T |  valet T |          |
|          |    as  T |   roi  P |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+

DeplacerSommet (TasDepart => 3, TasArriv => 2)
+----------+----------+----------+----------+
|          |  valet P |          |          |
|          |   10   T |          |          |
|          |    8   T |          |          |
|          |    4   P |          |          |
|          |    2   T |  valet T |          |
|          |    as  T |   roi  P |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+

DeplacerSommet (TasDepart => 3, TasArriv => 2)
+----------+----------+----------+----------+
|          |  valet T |          |          |
|          |  valet P |          |          |
|          |   10   T |          |          |
|          |    8   T |          |          |
|          |    4   P |          |          |
|          |    2   T |          |          |
|          |    as  T |   roi  P |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+

DeplacerSommet (TasDepart => 3, TasArriv => 2)
+----------+----------+----------+----------+
|          |   roi  P |          |          |
|          |  valet T |          |          |
|          |  valet P |          |          |
|          |   10   T |          |          |
|          |    8   T |          |          |
|          |    4   P |          |          |
|          |    2   T |          |          |
|          |    as  T |          |          |
|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |
+----------+----------+----------+----------+
