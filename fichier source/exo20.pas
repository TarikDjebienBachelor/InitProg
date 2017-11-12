//nom :DJEBIEN
//date : 18/10/2006
//objet : manipulation de jeu de cartes
//etat initial : tas1='[T+K]' tas2=tas3=tas4=''
//etat final : tas1='[X][Y]' tas2='' tas3=tas4=''
//le symbole X designe la couleur trefle ou carreau la plus nombreuse
//,l'autre couleur étant designée par Y.

program exo20;
uses cartes;
var
  compteurtrefle:cardinal;
  compteurcarreau:cardinal;

procedure vidertas(n,p:taspossibles);
begin
  while tasnonvide(n) do
        deplacersommet(n,p);
end;//vidertas

begin
 inittas(1,'[T+K]');
 inittas(2,'');
 inittas(3,'');
 inittas(4,'');
 compteurtrefle:=0;
 compteurcarreau:=0;

while tasnonvide(1) do
  begin
    if couleursommet(1)=trefle then
      begin
        deplacersommet(1,2);
        compteurtrefle:=compteurtrefle+1;
      end
    else
      if couleursommet(1)=carreau then
        begin
          deplacersommet(1,3);
          compteurcarreau:=compteurcarreau+1;
        end;
  end;
if compteurtrefle > compteurcarreau then
  begin
    vidertas(2,1);
    vidertas(3,1);
  end
else
  begin  
    vidertas(3,1);
    vidertas(2,1);
  end;
end.