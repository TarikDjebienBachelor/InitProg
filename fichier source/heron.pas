program heron;

var n,  c : cardinal;
var racapp, u, v : real;


procedure passer_lignes(nl : cardinal);
var i : cardinal;
begin
  for i :=1 to nl do writeln
end;
// une procedure d�finit une action et sera appel�e comme telle
// sous forme d'une instruction

function rac_heron (n : cardinal; r : real) : real;
var u,v : real;
begin
  u := r;
  v := (u+n/u)/2;
  while abs(u-v) > 1E-15 do
  begin
	u := v;
	v:=(u+n/u)/2;
  end;
  rac_heron := u
end;
// une fonction d�finit une valeur
// et la valeur g�n�r�e � l'appel est � utiliser
// en contexte de valeur


begin

  write ('donnez un nb :');readln(n);
  write ('donnez-en une racine approch�e :');readln(racapp);
  passer_lignes(2);	// appel de proc�dure = instruction

  // calcul des 10 1ers termes de la suite  
  // 1er terme u = racine approch�e
  // si u est racine approch�e alors n/u aussi
  // et terme suivant = moyenne de u et n/u

  writeln ('calcul par suite de 10 termes');
  u := racapp;
  for c := 1 to 10 do
  begin
	v:=(u+n/u)/2;
	writeln(v);
	u := v		// on pourrait ici utiliser une seule variable u
  end;
  passer_lignes(2);

  // si l'�cart entre u et v se r�duit on s'arr�te sur une pr�cision donn�e
  // ici on prend 1E-15 (1/10**5)
  // fonction � r��crire en param�trant avec la pr�cision voulue
  writeln('calcul limit� aux termes utiles : ');
  c := 0; 
  u := racapp;
  v := (u+n/u)/2;		// ici on doit avoir 2 variables pour les comparer 
  while abs(u-v) > 1E-15 do
  begin
	u := v;
	v:=(u+n/u)/2;
	c := c + 1	// c est le compteur de termes utiles / pr�cision donn�e
  end;
  writeln('nb termes utiles : ',c);
  passer_lignes(3);

  writeln('calcul par fonction : ');
  writeln(rac_heron(n, racapp):30:15); 	// appel de fonction = valeur

end.