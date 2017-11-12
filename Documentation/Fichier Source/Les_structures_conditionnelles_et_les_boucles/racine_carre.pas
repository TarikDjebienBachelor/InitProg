{ Il est possible de calculer la racine carrée d'un nombre en utilisant
un algorithme trés particulier et sans avoir recours à la fonction
mathématique racine carrée prédéfinie. Soit n le nombre dont on souhaite
extraire la racine carrée. On construit une suite de nombres Xi dont
le premier terme vaut 1 et dont le terme général a pour expression :

				Xi = (( n / X(i-1)) + X(i-1)) / 2  

Aussi surprenant que cela puisse paraitre, cette suite converge
                       ___
systematiquement vers V n  .
}
program rac_carr;
uses crt;
var
  x,n : real;
  i,max : integer;
begin
  clrscr;
  write('entrez le nombre dont on cherche la racine carrée : ');
  readln(n);
  write('entrez le nombre d''iterations voulues : ');
  // Le fait d'entrer au clavier le nombre d'iterations voulues permet
  // de se rendre compte de la maniere dont converge cet algorithme.
  readln(max);
  x := 1;
  for i:= 1 to max do
    x:= ((n/x)+x)/2;
	writeln('resultat : ',x);
	repeat
	until keypressed;
	clrscr;
end.
