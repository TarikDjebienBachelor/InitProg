//nom :DJEBIEN
//date : 20/10/2006
//objet : manipulation de jeu de cartes
//etat initial : tas1='[T]' tas2='[K]'tas3='[C]'tas4='[P]'
//etat final : tas1='[T]^' tas2='[K]^' tas3='[C]^'tas4='[P]^'
//le symbole ^ signifiant que les cartes sont rangées par ordre croissant
//de valeurs de bas en haut.


program exo22;
uses cartes;



//procedure permettant de vider des cartes d'un tas n vers un tas p
procedure vidertas(n,p:taspossibles);
begin
  while tasnonvide(n) do
        deplacersommet(n,p);
end;//vidertas


begin
 inittas(1,'[T]');
 inittas(2,'[K]');
 inittas(3,'[C]');
 inittas(4,'[P]');


//lenteur permet d'augmenter la vitesse d'execution du programme étant donné qu'il s'execute sur un intervalle de temps élevé.
lenteur:=50;

deplacersommet(1,2);

while tasnonvide(1) do
begin
  while tasnonvide(1) do
         begin 
            if superieur(1,2) then
               deplacersommet(1,3)
            else
              begin
                deplacersommet(2,3);
                deplacersommet(1,2);
              end;
         end;

  while sommettrefle(3) do
     deplacersommet(3,1);
   
  deplacersommet(1,2);
end;

while sommettrefle(2) do
      deplacersommet(2,3);

while sommettrefle(3) do
      deplacersommet(3,1);



deplacersommet(2,3);

while tasnonvide(2) do
begin
  while tasnonvide(2) do
         begin 
          if superieur(2,3) then
             deplacersommet(2,4)
          else
            begin
              deplacersommet(3,4);
              deplacersommet(2,3);
            end;
         end;
while sommetcarreau(4) do
   deplacersommet(4,2);

deplacersommet(2,3);
end;

while sommetcarreau(3) do
      deplacersommet(3,4);

while sommetcarreau(4) do
      deplacersommet(4,2);




deplacersommet(3,4);

while tasnonvide(3) do
begin
  while tasnonvide(3) do
         begin 
          if superieur(3,4) then
             deplacersommet(3,2)
          else
            begin
              deplacersommet(4,2);
              deplacersommet(3,4);
            end;
         end;
while sommetcoeur(2) do
   deplacersommet(2,3);

deplacersommet(3,4);
end;

while sommetcoeur(4) do
      deplacersommet(4,2);

while sommetcoeur(2) do
      deplacersommet(2,3);




deplacersommet(4,3);

while tasnonvide(4) do
begin
  while tasnonvide(4) do
         begin 
          if superieur(4,3) then
             deplacersommet(4,2)
          else
            begin
              deplacersommet(3,2);
              deplacersommet(4,3);
            end;
         end;
while sommetpique(2) do
   deplacersommet(2,4);

deplacersommet(4,3);
end;

while sommetpique(3) do
      deplacersommet(3,1);

while sommetpique(1) do
      deplacersommet(1,4);


end.