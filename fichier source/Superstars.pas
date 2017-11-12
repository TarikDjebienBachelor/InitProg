{--------------------------------------------------------------------------------------------}
{-                                       Superstars.pas                                     -}
{- Christian Lasou, 19/12/07                                                                -}
{- pour dessiner des figures géométriques                                                   -}
{- C'est une généralisation de l'exercice 5 du TD sur la boucle pour,                       -}
{- Généralisation car je passe le caractère utilisé pour le dessin en paramètres            -}
{-                et parce que je fais aussi des dessins non demandés                       -}
{--------------------------------------------------------------------------------------------}
program superstars ;

   procedure dessiner_ligne(n : CARDINAL ; c : CHAR) ;
   // dessine une ligne de n caractères c
   // exemple : dessiner(5,'a') ;   affichera  aaaa  sans aller à la ligne
   var i : CARDINAL ;
   begin
      for i := 1 to n do begin
         write(c) ;
      end {for} ;
   end {dessiner_ligne} ;

   procedure dessiner_carre_plein(n : CARDINAL ; c : CHAR) ;
   // dessine un carre de n x n dessiné avec des c et rempli de c
   var i : CARDINAL ;
   begin
      for i := 1 to n do begin  // je dessine une ligne de n caractères c
         dessiner_ligne(n,c) ;  // si je n'utilise pas dessiner_ligne je dois faire 2 boucles imbriquées
         writeln ;
      end {for} ;
   end {dessiner_carre_plein} ;

   procedure dessiner_carre_creux(n : CARDINAL ; c : CHAR) ;
   // dessine un carre de n x n dessiné avec des c et "vide"
   var i : CARDINAL ;
   begin
      // la première ligne
      dessiner_ligne(n,c) ;
      writeln ;
      // les lignes intermédiaires (il y en a n-2)
      for i := 1 to n-2 do begin       // je dessine une ligne
         write(c) ;                    // le premier c
         dessiner_ligne(n-2,' ') ;     // les espaces 
         writeln(c) ;                  // le dernier c
      end {for} ;
      // la dernière ligne
      dessiner_ligne(n,c) ;
      writeln ;
   end {dessiner_carre_creux} ;

   procedure dessiner_rectangle_plein(n,p : CARDINAL ; c : CHAR) ;
   // dessine un rectangle de n x p dessiné avec des c et rempli avec des c
   var i : CARDINAL ;
   begin
      for i := 1 to p-2 do begin  // je dessine une ligne
         dessiner_ligne(n,c) ;
         writeln ;
      end {for} ;
   end {dessiner_rectangle_plein} ;

   procedure dessiner_rectangle_creux(n,p : CARDINAL ; c : CHAR) ;
   // dessine un rectangle de n x p dessiné avec des c et "vide"
   var i : CARDINAL ;
   begin
      // la première ligne
      dessiner_ligne(n,c) ;
      writeln ;
      // les lignes intermédiaires (il y en a p-2)
      for i := 1 to p-2 do begin       // je dessine une ligne
         write(c) ;                    // le premier c
         dessiner_ligne(n-2,' ') ;     // les espaces 
         writeln(c) ;                  // le dernier c
      end {for} ;
      // la dernière ligne
      dessiner_ligne(n,c) ;
      writeln ;
   end {dessiner_rectangle_creux} ;

   // Dans les questions 3 et 4 de l'exercice 5 de la feuille de TD sur les boucles pour on parle de
   // triangle isocèle (car le nombre de lignes et le nombre de caractères de la dernière ligne sont
   // égaux mais à l'écran ça ne ressemble pas trop à un triangle isocèle mais plutôt à un triangle
   // rectangle donc...
   procedure dessiner_triangle_rectangle_plein(n : CARDINAL ; c : CHAR) ;
   // dessine un triangle rectangle sur n lignes avec le caractère c
   // exemple   dessiner_triangle_rectangle_plein(6,'$') affichera
   // $
   // $$
   // $$$
   // $$$$
   // $$$$$
   // $$$$$$
   var i : CARDINAL ;
   begin
      for i := 1 to n do begin // dessiner la ligne i
         dessiner_ligne(i,c) ;
         writeln ;
      end {for} ;
   end {dessiner_triangle_rectangle_plein} ;

   procedure dessiner_triangle_rectangle_creux(n : CARDINAL ; c : CHAR) ;
   // dessine un triangle rectangle sur n lignes avec le caractère c
   // exemple   dessiner_triangle_rectangle_creux(6,'$') affichera
   // $
   // $$
   // $ $
   // $  $
   // $   $
   // $$$$$$
   var i : CARDINAL ; 
   begin
      // la première ligne
      writeln(c) ;
      // les n-2 premières lignes intermédiaires
      for i := 2 to n-1 do begin // dessiner la ligne i
         write(c) ;
         dessiner_ligne(i-2,' ') ;  // sur la ligne i on i-2 espaces
         writeln(c) ;
      end {for} ;
      // la dernière ligne
      dessiner_ligne(n,c) ;
      writeln ;
   end {dessiner_triangle_rectangle_creux} ;

   // Les mêmes à l'envers
   procedure dessiner_triangle_rectangle_plein_2(n : CARDINAL ; c : CHAR) ;
   // dessine un triangle rectangle sur n lignes avec le caractère c
   // exemple   dessiner_triangle_rectangle_plein_2(6,'$') affichera
   // $$$$$$
   // $$$$$
   // $$$$
   // $$$
   // $$
   // $
   var i : CARDINAL ;
   begin
(*      for i := 1 to n do begin // dessiner la ligne i
         dessiner_ligne(n-i+1,c) ;
         writeln ;
      end {for} ;
ou
*)      for i := n downto 1 do begin // dessiner la ligne i
         dessiner_ligne(i,c) ;
         writeln ;
      end {for} ;
   end {dessiner_triangle_rectangle_plein_2} ;

   procedure dessiner_triangle_rectangle_creux_2(n : CARDINAL ; c : CHAR) ;
   // dessine un triangle rectangle sur n lignes avec le caractère c
   // exemple   dessiner_triangle_rectangle_creux_2(6,'$') affichera
   // $$$$$$
   // $   $
   // $  $
   // $ $
   // $$
   // $
   var i : CARDINAL ; 
   begin
      // la première ligne
      dessiner_ligne(n,c) ; writeln ;
      // les n-2 premières lignes intermédiaires
(*      for i := 2 to n-1 do begin // dessiner la ligne i
         write(c) ;
         dessiner_ligne(n-i-1,' ') ;  // sur la ligne i on i-2 espaces
         writeln(c) ;
      end {for} ;
ou
*)      for i := n-1 downto 2 do begin // dessiner la ligne i
         write(c) ;
         dessiner_ligne(i-2,' ') ;  // sur la ligne i on i-2 espaces
         writeln(c) ;
      end {for} ;
      // la dernière ligne
      writeln(c) ;
   end {dessiner_triangle_rectangle_creux_2} ;

   // Et enfin un vrai triangle isocèle

   procedure dessiner_triangle_isocele_plein(n : CARDINAL ; c : CHAR) ;
   // dessine un triangle isocèle sur n lignes avec le caractère c et rempli de c
   // exemple   dessiner_triangle_isocele_plein(6,'$') affichera
   //      $
   //     $$$
   //    $$$$$
   //   $$$$$$$
   //  $$$$$$$$$
   // $$$$$$$$$$$
   var i : CARDINAL ;
   begin
      for i := 1 to n do begin   // dessiner la ligne i
         // devant les c on a n-i espaces
         dessiner_ligne(n-i,' ') ;
         // ensuite on a on 2i-1 c
         dessiner_ligne(2*i-1,c) ;
         writeln ;
      end {for} ;
   end {dessiner_triangle_isocele_plein} ;

   procedure dessiner_triangle_isocele_creux(n : CARDINAL ; c : CHAR) ;
   // dessine un triangle isocèle sur n lignes avec le caractère c et "vide"
   // exemple   dessiner_triangle_isocele(6,'$') affichera
   //      $
   //     $ $
   //    $   $
   //   $     $
   //  $       $
   // $$$$$$$$$$$
   var i : CARDINAL ;
   begin
      // la première ligne (on a n-1 espaces devant c)
      dessiner_ligne(n-1,' ') ;
      writeln(c) ;
      // les n-2 premières lignes intermédiaires
      for i := 2 to n-1 do begin   // dessiner la ligne i
         // devant le premier c on a n-i espaces
         dessiner_ligne(n-i,' ') ;
         write(c) ;
         dessiner_ligne(2*i-3,' ') ;  // sur la ligne i on 2i-3 espaces entre les c
         writeln(c) ;
      end {for} ;
      // la dernière ligne (on a 2n-1 c)
      dessiner_ligne(2*n-1,c) ;
      writeln ;
   end {dessiner_triangle_isocele} ;

   // SI VOUS LE VOULEZ VOUS POUVEZ ECRIRE DES VERSIONS 2 DE CES 2 DERNIERES PROCEDURES QUI
   // DESSINENT LES MÊMES TRIANGLES "POINTE EN BAS"

BEGIN

   // test de dessiner_ligne
   dessiner_ligne(7,'r') ; writeln ; writeln ;

   // test de dessiner_carre_plein
   dessiner_carre_plein(6,'*') ; writeln ;

   // test de dessiner_carre_creux
   dessiner_carre_creux(6,'*') ; writeln ;

   // test de dessiner_rectangle_plein
   dessiner_rectangle_plein(8,6,'*') ; writeln ;

   // test de dessiner_rectangle_creux
   dessiner_rectangle_creux(8,6,'*') ; writeln ;

   // test de dessiner_triangle_rectangle_plein
   dessiner_triangle_rectangle_plein(8,'&') ; writeln ;

   // test de dessiner_triangle_rectangle_creux
   dessiner_triangle_rectangle_creux(8,'&') ; writeln ;

   // test de dessiner_triangle_rectangle_plein_2
   dessiner_triangle_rectangle_plein_2(8,'&') ; writeln ;

   // test de dessiner_triangle_rectangle_creux_2
   dessiner_triangle_rectangle_creux_2(8,'&') ; writeln ;

   // test de dessiner_triangle_isocele_plein
   dessiner_triangle_isocele_plein(8,'%') ; writeln ;

   // test de dessiner_triangle_isocele_creux
   dessiner_triangle_isocele_creux(8,'%') ; writeln ;

END.

RESULTAT

rrrrrrr

******
******
******
******
******
******

******
*    *
*    *
*    *
*    *
******

********
********
********
********

********
*      *
*      *
*      *
*      *
********

&
&&
&&&
&&&&
&&&&&
&&&&&&
&&&&&&&
&&&&&&&&

&
&&
& &
&  &
&   &
&    &
&     &
&&&&&&&&

&&&&&&&&
&&&&&&&
&&&&&&
&&&&&
&&&&
&&&
&&
&

&&&&&&&&
&     &
&    &
&   &
&  &
& &
&&
&

       %
      %%%
     %%%%%
    %%%%%%%
   %%%%%%%%%
  %%%%%%%%%%%
 %%%%%%%%%%%%%
%%%%%%%%%%%%%%%

       %
      % %
     %   %
    %     %
   %       %
  %         %
 %           %
%%%%%%%%%%%%%%%
