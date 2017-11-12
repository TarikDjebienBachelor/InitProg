//nom : BOULEMIA DJEBIEN
//date : 16/10/2006
//objet : manipulation de jeu de cartes
//etat initial : tas1='[T+K+C+P]' tas2=tas3=tas4=''
//etat final : tas1='[T]' tas1='[K]' tas3='[C]' tas4='[P]'


program exo17;
uses cartes;
begin
inittas(1,'[T+K+C+P]');
inittas(2,'');
inittas(3,'');
inittas(4,'');
  while tasnonvide(1) do
    begin
      if sommetpique(1) then
         deplacersommet(1,4)
      else
      if sommetcoeur(1) then
         deplacersommet(1,3)
      else
         deplacersommet(1,2);
    end;
  while tasnonvide(2) do
    begin
      if sommettrefle(2) then
         deplacersommet(2,1)
      else
         deplacersommet(2,3);
    end;
while tasnonvide(3) and sommetcarreau(3) do
      deplacersommet(3,2);
end.