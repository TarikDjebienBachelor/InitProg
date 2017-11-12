//nom :DJEBIEN
//date : 18/10/2006
//objet : manipulation de jeu de cartes
//etat initial : tas1='[T]' tas2=tas3=tas4=''
//etat final : tas1='' tas2='[T]^' tas3=tas4=''
//le tas 2 est rangé par ordre croissant

program exo19;
uses cartes;


procedure vidertas(n,p:taspossibles);
begin
  while tasnonvide(n) do
        deplacersommet(n,p);
end;//vidertas

begin
 inittas(1,'[T]');
 inittas(2,'');
 inittas(3,'');
 inittas(4,'');

deplacersommet(1,2);
while tasnonvide(1) do
  begin
  while tasnonvide(1) do
   begin
     if superieur(1,2) then
        deplacersommet(1,4)
     else
       begin
        deplacersommet(2,4);
        deplacersommet(1,2);
       end;
   end;
  vidertas(4,1);
  deplacersommet(1,2);
  end;
end.