//nom : BOULEMIA DJEBIEN
//date : 16/10/2006
//objet : manipulation de jeu de cartes
//etat initial : tas1='T[T]' tas2=tas3=tas4=''
//etat final : tas1='' tas1='T'- tas3='[T]' tas4=''
//le symbole - signifie que la carte est de valeur minimale

program exo18;
uses cartes;

begin
 inittas(1,'T[T]');
 inittas(2,'');
 inittas(3,'');
 inittas(4,'');

deplacersommet(1,2);

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
end.