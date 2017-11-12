// auteur : Djebien Tarik  ( tarik.djebien@etudiant.univ-lille1.fr)
// date   : novembre 2009
// objet  : opérations sur la structure de donnée lineaire de type Liste,
//			cas particulier des listes circulaires.

// ladd((1,2,3),4) = (1,2,3,4)
// tel que (1->2->3->1) => (1->2->3->4->1)
procedure ladd(var L: LISTE; E: ELEMENT);
var Ptr,Temp: LISTE;
begin
  new(Ptr);
  if L <> NIL
    then begin
       Temp := L^.suivant;
       L^.suivant := Ptr;
       Ptr^.info := E;
       Ptr^.suivant:= Temp;
       end
    else begin
       L:= Ptr;
       L^.info:= E;
       L^.suivant:= L;
    end;
end{laddCirculaire};

// affiche tous les éléments d'une liste circulaire
procedure lview(L: LISTE);
var First: LISTE;
begin
   First:= L;
   if L = NIL then
      write('La liste est vide')
   else repeat
      write(L^.info,'');
      L:= L^.suivant;
   until L = First;
   writeln;
end{lview};

// transformation liste simple => liste circulaire
procedure simpleToCirc(var L: LISTE);
var First: LISTE;
begin
  if L = NIL
    then writeln('La liste est vide')
  else begin
     First:= L;
     while L^.suivant <> NIL do
        L:= L^.suivant;
     L^.suivant:= First;
       end;//if
end{simpleToCirc};

// transformation liste circulaire => liste simple
procedure circToSimple(var L: LISTE);
var First: LISTE;
begin
  if L = NIL
    then writeln('La liste est vide')
  else begin
     First:= L;
     while L^.suivant <> First do
        L:= L^.suivant;
     L^.suivant:= NIL;
       end;//if
end{circToSimple};
