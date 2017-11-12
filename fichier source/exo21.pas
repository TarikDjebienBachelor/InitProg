//nom :DJEBIEN
//date : 19/10/2006
//objet : manipulation de jeu de cartes
//etat initial : tas1='K[T]' tas2=tas3=tas4=''
//etat final : tas1='[T+K]' tas2='[T+K]' tas3='[T+K]'tas4='[T+K]'
//les trefles étant équitablement répartis sur les quatre tas,l'unique carreau se trouvant n'importe où.

program exo21;
uses cartes;
procedure vidertas(n,p:taspossibles);
begin
  while tasnonvide(n) do
        deplacersommet(n,p);
end;//vidertas

begin
 inittas(1,'K[T]');
 inittas(2,'');
 inittas(3,'');
 inittas(4,'');

while  couleursommet(1)=trefle  do
     begin
        deplacersommet(1,2);
      if couleursommet(1)=trefle then
        deplacersommet(1,3);
     end;
        
        deplacersommet(1,2);
while tasnonvide(3) do
    begin  
      deplacersommet(3,1);
    if tasnonvide(3) then
      deplacersommet(3,4);
    end;

 if tasvide(3) and tasnonvide(2)  then
      vidertas(2,4);

while  couleursommet(4)=trefle  do
     begin
        deplacersommet(4,2);
      if couleursommet(4)=trefle then
        deplacersommet(4,3);
     end;
end.