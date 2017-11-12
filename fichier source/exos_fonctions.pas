{--------------------------------------------------------------------------------------------}
{-                                     exos_fonctions.pas                                   -}
{- Christian Lasou, 13/11/06                                                                -}
{- feuille d'exercices sur les fonctions                                                    -}
{--------------------------------------------------------------------------------------------}

program exos_fonction;

/////////////////////
// RAPPEL DE COURS //
/////////////////////

// En mathématiques une fonction c'est un moyen de calculer un résultat à partir d'une ou
// plusieurs données
//                   f : Ensemble des données -----> Ensemble du résultat
//                           (a,b,c,...)      ----->   le résultat (noté f(a,b,c,...))
//    exemples :     factoriel : N -----> N
//                               n -----> n! défini par 1x2x3x...xn
//                      pgcd : NxN  -----> N
//                            (a,b) -----> le plus grand diviseur commun à a et b
// En informatique on peut définir des fonctions qui permettent elles aussi de calculer un
// résultat à partir d'une ou plusieurs valeurs.
// Une telle fonction doit être déclarée dans la partie déclaration (entre l'entête du pro-
// gramme et son "begin". La syntaxe de la déclaration est la suivante :
//              function <nom>(<liste des paramètres formels>) : <type du résultat> ;
//              <déclarations locales> (variables, ...)
//              begin
//                   // ici on met le calcul du résultat
//                <nom> := le résultat   // ceci est le moyen de dire quel est le résultat
//              end {<nom>} ;
// exemples :   (je ne les mets pas en commentaires pour pouvoir les tester dans le programme)

             function factoriel(n : CARDINAL) : CARDINAL ;
	     var i,resultat : CARDINAL ;
	     begin
	       resultat := 1 ;
	       for i := 1 to n do begin
	         resultat := resultat*i ;
	       end {for} ;
	       factoriel := resultat ;
	     end {factoriel} ;
	     
	     function pgcd(a,b : CARDINAL) : CARDINAL ;
	     // j'utilise l'algo des soustractions à savoir
	     // si a ou b est nul le pgcd c'est l'autre
	     //     pgcd(a,b) = pgcd(a,b-a) si b>a
	     //  et pgcd(a,a) = a
	     var n1,n2 : CARDINAL ; // car on ne modifie pas a et b donc on en fait des copies
	     begin
	       if a = 0 then begin
	         pgcd := b ;
	       end else begin
	         if b = 0 then begin
		   pgcd := a ;
		 end else begin // a et b sont non nuls
	           n1 := a ; n2 := b ;
	           while n1<>n2 do begin
	             if n1<n2 then begin
		       n2 := n2-n1 ;
		     end else begin
		       n1 := n1-n2 ;
		     end {if} ;
		   end {while} ;
                   pgcd := n1 ;  // ou n2 puisque n1 = n2
		 end {if} ;		  
	       end {if} ;
	     end {pgcd} ;

// Quand une fonction a été ainsi déclarée, on peut ensuite l'utiliser dans le programme (ou
// dans une procédure ou dans une autre fonction), mais ATTENTION, ce n'est pas une nouvelle
// instruction (comme c'est le cas pour une procédure) et écrire par exemple
//                          factoriel(5) ;     // tout seul
// n'a aucun sens, factoriel(5) vaut 120, c'est une valeur et il faut en faire quelquechose,
// l'afficher par exemple              write(factoriel(5)) ;    // affiche 120
// ou l'affecter à une variable        n := factoriel(5) ;      // n vaut 120 maintenant
// ou l'utiliser dans une expression   p := 5+2*factoriel(5) ;  // p vaut 245 maintenant
// Pour utiliser une fonction on écrit son nom et derrière entre parenthèses on met les
// valeurs qui remplacent les paramètres formels (ces valeurs peuvent être des valeurs de
// variables existantes ou des expressions, la seule condition est qu'elles soient du bon
// type)
// On peut par exemple écrire  write(pgcd(n+5,2*p+1)) ;
// si n est une variable qui vaut 7 et p une variable qui vaut 10, cela affichera le pgcd de
// 12 et 21, c'est-à-dire 3

///////////////////////////////////
// QUELQUES EXERCICES FAIT EN TD //
///////////////////////////////////

  function puissance(x : INTEGER ; n : CARDINAL) : INTEGER ;
  // Calcule x^n
  // C.U. : x et n ne sont pas tous les deux nuls car 0^0 n'existe pas
  var resultat : INTEGER ;
      i : CARDINAL ;
  begin
    resultat := 1 ;              // resultat est un "accumulateur" multiplicatif
    for i := 1 to n do begin     // on y accumule les multiplications par x et c'est pour
      resultat := resultat*x ;   // cela qu'il est mis à 1 au départ
    end {for} ;
    puissance := resultat ;
  end {puissance} ;
  
  function somme_puissances(a,b : INTEGER ; n : CARDINAL) : INTEGER ;
  // Calcule  a^n + (a+1)^n + ... + b^n
  // C.U. : si a*b < 0 il ne faut pas que n soit nul
  var resultat : INTEGER ;
      i : INTEGER ;
  begin
    resultat := 0 ;                           // resultat est un "accumulateur" additif
    for i := a to b do begin                  // on y accumule les puissances et c'est pour
      resultat := resultat+puissance(i,n) ;   // cela qu'il est mis à 0 au départ
    end {for} ;
    somme_puissances := resultat ;
  end {somme_puissances} ;
      
///////////////////////////////////////////////////////////////
// QUELQUES EXERCICES A FAIRE (CERTAINS ONT ETE FAITS EN TD) //
///////////////////////////////////////////////////////////////

  // Vous n'oublierez pas de tester vos fonctions à chaque fois que vous en avez écrit une

  // Ecrire une fonction somme_chiffres qui calcule la somme des chiffres d'un naturel n pas-
  // sé en paramètre.
  // exemple :   somme_chiffres(256) = 13
  // (On pourra utiliser les opérateurs mod et div qui calcule le reste et le quotient dans 
  // une division entière
  // exemples : 17 mod 5 = 2 et 17 div 5 = 3

  // Ecrire une fonction miroir qui calcule le miroir d'un naturel n passé en paramètre.
  // (le miroir d'un naturel n est le nombre avec les mêmes chiffres que n mais mis dans
  // l'autre sens)
  // exemples : miroir(254) = 452  et  miroir(3050) = 503
  
  // Ecrire une fonction dedouble qui, à partir d'un nombre n, calcule le nombre p ayant les 
  // mêmes chiffres que n mais dédoublés
  // exemple : dedouble(235) = 223355
  
  // Ecrire une fonction somme_diviseurs qui calcule la somme des diviseurs de son paramètre n
  // exemple : somme_diviseurs(12) = 28   (1+2+3+4+6+12) 

  // Ecrire une fonction est_premier qui teste si son paramètre n est un nombre premier
  // Rappel : un naturel est premier si il est supérieur à 1 et n'est divisible que par 1 et
  // lui-même (exemples : 2, 3, 5, 7, 11, 13, 17, 19, 23, ...).
  // exemple : est_premier(17) = TRUE  et  est_premier(63) = FALSE
  // On pourra faire d'abord une version simple puis on essaiera de limiter les calculs en
  // remarquant que si un nombre n'est pas premier alors son plus petit diviseur d (différent
  // de 1) vérifie d*d <= n, puis en remarquant que ce même plus petit diviseur est premier 
  // donc soit 2 ou un nombre impair et que les nombres premiers sont du type 6k+1 ou 6k+5
  
  
BEGIN // du programme

  // tests de la fonction factoriel
  writeln('5! = ',factoriel(5)) ;
  writeln('0! = ',factoriel(0)) ;
  
  // tests de la fonction pgcd
  writeln('pgcd(12,18) = ',pgcd(12,18)) ;
  writeln('pgcd(12,0) = ',pgcd(12,0)) ;
  
  // tests de la fonction puissance
  writeln('5^3 = ',puissance(5,3)) ;
  writeln('0^5 = ',puissance(0,5)) ;
  writeln('3^0 = ',puissance(3,0)) ;
  writeln('(-2)^5 = ',puissance(-2,5)) ;

    // tests de la fonction somme_puissances
  writeln('(-5)^3+(-4)^3+(-3)^3+...+6^3 = ',somme_puissances(-5,6,3)) ;
  
END.

RESULTAT

5! = 120
0! = 1
pgcd(12,18) = 6
pgcd(12,0) = 12
5^3 = 125
0^5 = 0
3^0 = 1
(-2)^5 = -32
(-5)^3+(-4)^3+(-3)^3+...+6^3 = 216
