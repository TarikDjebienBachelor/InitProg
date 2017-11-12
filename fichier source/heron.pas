program heron;

var n,  c : cardinal;
var racapp, u, v : real;


procedure passer_lignes(nl : cardinal);
var i : cardinal;
begin
  for i :=1 to nl do writeln
end;
// une procedure définit une action et sera appelée comme telle
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
// une fonction définit une valeur
// et la valeur générée à l'appel est à utiliser
// en contexte de valeur


begin

  write ('donnez un nb :');readln(n);
  write ('donnez-en une racine approchée :');readln(racapp);
  passer_lignes(2);	// appel de procédure = instruction

  // calcul des 10 1ers termes de la suite  
  // 1er terme u = racine approchée
  // si u est racine approchée alors n/u aussi
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

  // si l'écart entre u et v se réduit on s'arrête sur une précision donnée
  // ici on prend 1E-15 (1/10**5)
  // fonction à réécrire en paramétrant avec la précision voulue
  writeln('calcul limité aux termes utiles : ');
  c := 0; 
  u := racapp;
  v := (u+n/u)/2;		// ici on doit avoir 2 variables pour les comparer 
  while abs(u-v) > 1E-15 do
  begin
	u := v;
	v:=(u+n/u)/2;
	c := c + 1	// c est le compteur de termes utiles / précision donnée
  end;
  writeln('nb termes utiles : ',c);
  passer_lignes(3);

  writeln('calcul par fonction : ');
  writeln(rac_heron(n, racapp):30:15); 	// appel de fonction = valeur

end.