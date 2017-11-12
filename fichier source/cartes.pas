unit cartes;
// Michel Latteux pour le mod�le des tas de cartes
// Alain Terlutte pour une premi�re programmation en Pascal
// Christian Lasou pour un portage en Ada
// Didier Mailliet pour un portage en Delphi/Windows
// Philippe Durif pour rendre la version Delphi/Windows utilisable sous Linux
//                et introduire le mode texte
////////////////////////////////////////////////////////
//  Portage de la version Windows vers Linux
//  P.Durif 14 septembre 2004
//
//  Cette version permet d'�crire l'�tat des tas de
//  fa�on purement s�quentielle (fichier texte) sans
//  aucun positionnement � l'�cran.
//
//  Un int�r�t est qu'on dispose alors de la trace
//  compl�te du programe dont on peut analyser apr�s coup
//  le fonctionnement. Si cette trace est trop importante
//  pour "tenir" dans la console, on peut toujours rediriger
//  l'ex�cution du programme sur un fichier, par exemple :
//
//     mon_programme > resultats
//
//  on pourra ensuite visualiser tranquillement le contenu de
//  ce fichier avec n'importe quel �diteur de texte.
//
//  Un autre int�r�t est que cette version fonctionne aussi sous
//  Windows.
////////////////////////////////////////////////////////

{*****************************INTERFACE**************************
   ensemble des entit�s disponibles � l'exterieur de l'unit�
****************************************************************}



interface
//
//   Initialement, les tas sont tous vides
//
uses
  SysUtils;

const maxhttas=60;                   {hauteur maximale d'un tas
                                     l'�cran permet d'en afficher au plus 23}
                                     // valeur augment�e par EW le 16/09/05
                                     // � la demande de CL pour disposer de tas plus importants
      maxnbtas=4;                    {nombre maximum de tas utilisables}

type HauteurTas=0..maxhttas;            {intervalle de validit� pour un
                                        indice de position sur un tas}
   //     TasPossibles=0..maxnbtas;          {intervalle de validit� pour un
//                                        indice sur un num�ro de tas}
   // Je pr�f�re commencer � 1 (utilit� du 0 ???)
   TasPossibles=1..maxnbtas;
   Valeur = 0..12 ;
   Couleurs=(trefle,carreau,coeur,pique,indefini); {no comment}
   Tas_Vide = class (SysUtils.Exception) ;
   Tas_Plein = class (SysUtils.Exception) ;

var lenteur : word;                     {accessible � l'ext�rieur, permet de
                                      ralentir ou d'acc�lerer l'affichage
                                      utilis� dans une instruction DELAY
                                      par d�faut elle vaut 500 }
    decouvert : boolean;                {les cartes du tas sont affich�es
                                      si decouvert est True
                                      Par d�faut la variable est True}



                {********************************************
                  les proc�dures et fonctions de l'unit�
                ********************************************}
//  Par d�faut l'affichage sous Windows se fait en mode semi-graphique.
//  On peut demander � basculer vers l'affichage en mode TEXTE
//  avec cette proc�dure.
//  Sous Linux le mode est forc�ment texte.
//  Une fois le mode texte demand�, on ne peut pas revenir au mode
//  semi-graphique.
procedure Afficher_En_Mode_Texte ;

// initialise le tas donn� par son LE_TAS
// avec un certain NOMBRE de cartes (inf�rieur � Maxhttas)
// les quatres derniers param�tres indiquent si le tas peut contenir
// du Tr�fle, du Karreau, du Coeur, du Pique
// le tas sera affich� � la fin de la proc�dure
procedure InitTas(const Le_Tas : TasPossibles ; const l_expression : string);


// d�place une carte du sommet du tas de d�part (TASDEPART)pour la placer
// au sommet du tas d'arriv�e (TASARRIV)
// les deux tas sont r�affich�s par la proc�dure
// D�clenche Tas_Vide si TasDepart est vide.
// D�clenche Tas_Plein si TasArriv est plein.
procedure DeplacerSommet(const TasDepart, TasArriv : TasPossibles) ;



// affiche les cartes du tas LE_TAS
// elles continueront � appara�tre si on ne modifie pas le tas
// ou si la variable DECOUVERT est True
procedure Decouvrir (const Le_Tas : TasPossibles) ;



// fournit la valeur vrai si le tas LE_TAS est vide (normal non?)
function TasVide (const Le_Tas : TasPossibles) : boolean ;

// l'inverse de la fonction pr�c�dente
function TasNonVide(const Le_Tas : TasPossibles) : boolean;

function TasPlein (const Le_Tas : TasPossibles) : boolean ;

// fournit la valeur vrai si la carte au sommet du tas Le_Tas est
// une carte Tr�fle (normal non?)
// fournit la valeur faux sinon
// D�clenche Tas_Vide si Le_Tas est vide.
function SommetTrefle(const Le_Tas : TasPossibles) : boolean;

// idem avec Carreau
function SommetCarreau(const Le_Tas : TasPossibles) : boolean;

// idem avec Coeur
function SommetCoeur(const Le_Tas : TasPossibles) : boolean;

// idem avec Pique
function SommetPique(const Le_Tas : TasPossibles) : boolean;

// Renvoie la couleur de la carte au sommet du tas Le_Tas
// D�clenche Tas_Vide si Le_Tas est vide.
function CouleurSommet(const Le_Tas : TasPossibles) : Couleurs;

// donne la valeur vrai si la valeur de la carte au sommet
// du tas Le_Tas1 est sup�rieure ou �gale � celle au
// sommet du tas Le_Tas2
// donne la valeur faux sinon
// D�clenche Tas_Vide si Le_Tas1 ou Le_Tas2 est vide.
function Superieur(const Le_Tas1, Le_Tas2 : TasPossibles) : boolean;



{********************IMPLEMENTATION*****************************}
{  proc�dures de l'unit�                                        }
{***************************************************************}

implementation

type
   intervligne = 1..25;
   carte       = 0..51;                       {les cartes sont cod�es par des valeurs
					       enti�res, de 0 � 12 : tr�fle
					       de 13 � 25 : carreau
					       de 26 � 38 : coeur
					       de 39 � 51 : pique}

tabsom=array[TasPossibles] of HauteurTas;  {type tableau pour
					    le tableau des sommet de tas}
   tabtas=array[TasPossibles,HauteurTas] of carte; {type tableau pour
                                                     les tas de cartes}

string2=string[2];
   string6=string[6];
   string7=string[7];
Program_Error = class (SysUtils.Exception) ;

var
tas				 : tabtas;                {tas de cartes par exemple : 4 tas de 23 cartes}
   sommet			 : tabsom;
   i				 : TasPossibles;
   Les_Tas_Ont_Deja_Ete_Affiches : Boolean ; // Pour la proc�dure Decouvrir
   Mode_Texte : Boolean ;
   
procedure Afficher_En_Mode_Texte ;
begin
   Mode_Texte := true ;
end {Afficher_En_Mode_Texte} ;

function La_Valeur (const c : carte) : Valeur ;
begin
   La_Valeur := c mod (High (Valeur) + 1) ;
end {La_Valeur} ;

function Image_De_La_Valeur (const valeur : carte) : string6;
begin  
   case La_Valeur (valeur) of
     0	: Image_De_La_Valeur := '  as  ';
     1	: Image_De_La_Valeur := '  2   ';
     2	: Image_De_La_Valeur := '  3   ';
     3	: Image_De_La_Valeur := '  4   ';
     4	: Image_De_La_Valeur := '  5   ';
     5	: Image_De_La_Valeur := '  6   ';
     6	: Image_De_La_Valeur := '  7   ';
     7	: Image_De_La_Valeur := '  8   ';
     8	: Image_De_La_Valeur := '  9   ';
     9	: Image_De_La_Valeur := ' 10   ';
     10	: Image_De_La_Valeur := 'valet ';
     11	: Image_De_La_Valeur := ' dame ';
     12	: Image_De_La_Valeur := ' roi  ';
   else
      raise Program_Error.Create ('Erreur interne dans Cartes.Image_De_La_Valeur ! contacter durif@lifl.fr') ;
   end;
end {Image_De_La_Valeur} ;

function La_Couleur (const valeur : carte) : Couleurs ;
begin
   case valeur div 13 of
     0 : La_Couleur := trefle;
     1 : La_Couleur := carreau;
     2 : La_Couleur := coeur;
     3 : La_Couleur := pique;
   else
      raise Program_Error.Create ('Erreur interne dans Cartes.La_Couleur ! contacter durif@lifl.fr') ;
   end;	
end {La_Couleur} ;

function Image_De_La_Couleur (const valeur : carte) : char;
begin
   case valeur div 13 of
     0 : Image_De_La_Couleur :=  'T';
     1 : Image_De_La_Couleur :=  'K';
     2 : Image_De_La_Couleur :=  'C';
     3 : Image_De_La_Couleur :=  'P';
   else
      raise Program_Error.Create ('Erreur interne dans Cartes.Image_De_La_Couleur ! contacter durif@lifl.fr') ;
   end;
end {Image_De_La_Couleur} ;

function Image_Carte (const valeur : carte) : string7;
begin
   Image_Carte := Image_De_La_Valeur (valeur) + Image_De_La_Couleur (valeur) ;
end {Image_Carte} ;


function tr (const x : integer) : string2;
var ch : string[2];
begin  
   str(x,ch);
   tr := ch
end {tr} ;


//  Les utilitaires de dessin semi-graphique
   
//  procedure clrscr ;
//  begin
//  end {clrscr} ;

//  procedure gotoxy (const x, y : integer) ;
//  begin
//  end {gotoxy} ;

   
//  (2) la version fichier texte s�quentiel : elle affiche tous les tas
//      en mode TEXTE
procedure Afficher_Les_Tas ;
var hauteur : HauteurTas ;
    le_tas : TasPossibles ;
function Maximum (const v :  tabsom) : HauteurTas ;
var i, iMax : TasPossibles ;
begin
   iMax := Low (v) ;
   for i := Low (v) to High (v) do begin
      if v [iMax] < v [i] then iMax := i ;
   end ;
   Maximum := v [iMax] ;
end {Maximum} ;

begin
   writeln ('+----------+----------+----------+----------+')  ;
   for hauteur := Maximum (sommet) downto 1 do begin
      write ('|') ;
      for le_tas := Low (TasPossibles) to High (TasPossibles) do begin
	 write (' ') ;
	 if hauteur <= sommet [le_tas] then begin
	    write (' ', Image_Carte (tas [le_tas, hauteur])) ;
	 end else begin
	    write ('        ') ;
	 end ;
	 write (' |') ;
      end ;
      writeln ;
   end ;
   writeln ('|  Tas 1   |  Tas 2   |  Tas 3   |  Tas 4   |')  ;
   writeln ('+----------+----------+----------+----------+')  ;
   Les_Tas_Ont_Deja_Ete_Affiches := true ;
end {Afficher_Les_Tas} ;

procedure Decouvrir (const Le_Tas : TasPossibles) ;
begin
   if Mode_Texte then begin
      if Les_Tas_Ont_Deja_Ete_Affiches then begin
	 writeln ('Decouvrir (Le_Tas => ', Le_Tas, ') : n''imprime rien ... car d�j� affich�') ;
      end else begin
	 writeln ;
	 writeln ('Decouvrir (Le_Tas => ', Le_Tas, ')') ;
	 Afficher_Les_Tas ;
      end ;
   end ;
end {Decouvrir} ;



procedure InitTas(const Le_Tas : TasPossibles ; const l_expression : string);
var
   motconstruit,motchoisi  : string;
   expression  : string;
   i,niveaudetoile	   : word;
   longueurtotale : integer;
   debordement		   : boolean;
const
   alphabet    = ['T','K','C','P','+','(',')','[',']'];
   alphdebexp  = ['T','K','C','P','(','['];
   alphfinexp  = ['T','K','C','P',')',']'];
   parentheses = ['(',')','[',']'];
   lettres     = ['T','K','C','P'];

procedure RetirerEspaces(var ch : string);
var i : word;
begin 
   while pos(' ',ch)<>0
      do
      delete(ch,pos(' ',ch),1);
   for i := 1 to length(ch)
      do ch[i] := upcase(ch[i])
end {RetirerEspaces} ;

function  ExprCorrecte(ch : string) : boolean;
var i	   : word;
   correct : boolean;
   parenth : string;
begin	   
   correct := true;
   if length(ch)>0
      then
   begin
      {v�rifier le premier et le dernier caract�re}
      if not((ch[1] in alphdebexp) and (ch[length(ch)] in alphfinexp))
	 then
	 correct := false
      else
	 if length(ch)>=2
	    then
	 begin {v�rifier alphabet, parenth�sage, succession}
	    {v�rifier que les caract�res appartiennent � l'alphabet}
	    i := 2;
	    while (i<length(ch)) and (ch[i] in alphabet)
	       do i := i+1;
	    if i<>length(ch)
	       then correct := false  {un caract�re n'appartient pas � l'alphabet}
	    else
	    begin    {v�rifier parenth�sage, succession}
	       {v�rifier le bon parenth�sage}
	       parenth := '';
	       for i := 1 to length(ch) do
		  if ch[i] in parentheses then parenth := parenth+ch[i];
	       while (pos('()',parenth)<>0) or (pos('[]',parenth)<>0) do begin
		  if pos('()',parenth)<>0 then delete(parenth,pos('()',parenth),2);
		  if pos('[]',parenth)<>0 then delete(parenth,pos('[]',parenth),2)
	       end;
	       if parenth<>''
		  then correct := false         {mal parenth�s�}
	       else
	       begin    {v�rifier succession de caract�res}
		  {du 2�me � l'avant dernier caract�re}
		  {v�rifier les possibilit�s caract�res suivant ou pr�c�dent}
		  i := 2;
		  while (i<length(ch)) and  correct
		     do
		  begin
		     if  ( (ch[i]='(') and not (ch[i+1] in alphdebexp) )
			or ( (ch[i]='[') and not (ch[i+1] in alphdebexp) )
			or ( (ch[i]=')') and not (ch[i-1] in alphfinexp) )
			or ( (ch[i]=']') and not (ch[i-1] in alphfinexp) )
			or ( (ch[i]='+') and
			    (not (ch[i-1] in alphfinexp)
			    or not (ch[i+1] in alphdebexp) )           )
			then correct := false;
		     i := i+1
		  end  {fin du traitement d'un caract�re}
	       end;  {fin de : succession de caract�res}
	    end;  {fin de : parenth�sage, succession}
	 end;{fin de : v�rifier l'alphabet, le bon parenth�sage, succession}
   end;
   exprcorrecte := correct
end {ExprCorrecte} ;

function PosParFermante(ch : string;posinit : word) : word;
{Recherche dans une expression correctement parenth�s�e
 d'une parenth�se fermante correspondant � une parenth�se ouvrante}
{On compte donc les parenth�ses +1 si elle est ouvrante
 -1 si elle est fermante}
{Ceci jusqu'� arriver � 0}
{ Etant correctement parenth�s�e, on est
 s�r de trouver la parenth�se fermante}

var i,cptpar : word;
begin
   i := posinit;
   cptpar := 1;
   while cptpar<>0
      do
   begin
      i := i+1;
      if ch[i]='(' then cptpar := cptpar+1;
      if ch[i]=')' then cptpar := cptpar-1
   end;
   posparfermante := i
end {PosParFermante} ;


function PosCroFermante(ch : string;posinit : word) : word;
{Recherche dans une expression correctement parenth�s�e
 d'un crochet fermant correspondant � un crochet ouvrant}
{On compte donc les crochets +1 si il est ouvrant
 -1 si il est fermant}
{Ceci jusqu� arriver � 0}
{ Etant correctement parenth�s�e, on est
 s�r de trouver le crochet fermant}

var i,cptcro : word;
begin
   i := posinit;
   cptcro := 1;
   while cptcro<>0 do begin
      i := i+1;
      if ch[i]='[' then cptcro := cptcro+1;
      if ch[i]=']' then cptcro := cptcro-1
   end;
   poscrofermante := i
end {PosCroFermante} ;


function NbPlusNiveau1(ch : string) : word;
{Compter les signes + qui se trouvent au m�me niveau}
{On consid�re ce qui est inclus entre deux parenth�ses
 comme un symbole. On ne s'int�resse pas au signes + int�rieurs}
{Donc si on rencontre une parenth�se ouvrante, on passe � celle fermante}

var nb,i : word;
begin
   nb := 0;
   i := 1;
   while i<=length(ch) do begin
      if ch[i]='+' then nb := nb+1;
      if ch[i]='(' then i := posparfermante(ch,i);
      if ch[i]='[' then i := poscrofermante(ch,i);
      i := i+1
   end;
   nbplusniveau1 := nb
end {NbPlusNiveau1} ;


function PosPlus(ch : string;numero : word) : word;
var nbplus,i : word;
begin
   nbplus := 0;
   i := 0;
   while nbplus<numero do begin
      i := i+1;
      if ch[i]='+' then nbplus := nbplus+1;
      if ch[i]='(' then i := posparfermante(ch,i);
      if ch[i]='[' then i := poscrofermante(ch,i);
   end;
   posplus := i
end {PosPlus} ;

function NeContientQueLettres(ch : string) : boolean;
var i : word;
begin
   NeContientQueLettres := true;
   i := 1;
   while (i<=length(ch)) and (ch[i] in lettres) do
      i := i+1;
   if i<=length(ch) then NeContientQueLettres := false
end {NeContientQueLettres} ;

{la fonction MOT est r�cursive, elle met � jour                           }
{  une variable   Debordement (bool�enne)                                 }
{      qui indique si � un des appels on a d�pass� la longueur max (255)  }
{ et une variable LongueurTotale (entiere)                                }
{      qui cumule les longueurs des chaines concat�n�es pour l'expression }
{Au premier appel, il faut donc initialiser ces deux variables            }
function mot(expr : string;niveau : word) : string;
var i,nbexpr,choixexp,posdebexp,posfinexp,
   posparferm,poscroferm,choixnbexpr : word;
   etoile : string;
begin
   if longueurtotale>= (maxhttas div 4) then begin
      mot := '';
      debordement := true
   end else if NeContientQueLettres(expr) then begin
      longueurtotale := longueurtotale+length(expr);
      if longueurtotale<(maxhttas div 4) then
	 mot := expr
      else begin
	 mot := '';
	 debordement := true
      end
   end else begin  {contient lettres mais aussi +,() et/ou [] }
      nbexpr := NbPlusNiveau1(expr)+1;  {nombre de sous-expressions}
      if nbexpr>1 then begin {exp1+exp2+exp3...  choisir une sous expression}
	 choixexp := random(nbexpr)+1;
	 if choixexp=1 then
	    posdebexp := 1
	 else posdebexp := posplus(expr,choixexp-1)+1;
	 if choixexp=nbexpr then
	    posfinexp := length(expr)
	 else
	    posfinexp := posplus(expr,choixexp)-1;
	 mot := mot(copy(expr,posdebexp,posfinexp-posdebexp+1),niveau)
      end else if expr[1] in lettres then begin
	 {si lettre, concatenation commencant par une lettre}
	 longueurtotale := longueurtotale+1;
	 if longueurtotale<(maxhttas div 4) then
	    mot := expr[1]+mot(copy(expr,2,length(expr)-1),niveau)
	 else begin
	    mot := '';
	    debordement := true
	 end
      end else if expr[1]='(' then begin
	 {si (, concatenation commencant par une (  }
	 posparferm := posparfermante(expr,1);
	 mot := mot(copy(expr,2,posparferm-2),niveau)
	 +mot(copy(expr,posparferm+1,length(expr)-posparferm),niveau)
      end else if expr[1]='[' then begin
	 {si [, concatenation commencant par un [ donc it�rer  }
	 poscroferm := poscrofermante(expr,1);
	 choixnbexpr := random(niveau);
	 etoile := '';
	 for i := 1 to niveau+choixnbexpr do
	    etoile := etoile+mot(copy(expr,2,poscroferm-2),niveau);
	 mot := etoile
	 +mot(copy(expr,poscroferm+1,length(expr)-poscroferm),niveau)
      end
   end
end {mot} ;


begin
   if Mode_Texte then begin
      writeln ;
      writeln ('InitTas (Le_Tas => ', Le_Tas, ', l_expression => ''', l_expression, ''')') ;
   end ;
   expression := l_expression ;
   RetirerEspaces(expression);
   
   if not  (exprcorrecte(expression)) then begin
      writeln('Initialisation du Tas ',Le_Tas);
      writeln;
      writeln('syntaxe incorrecte : � revoir');
      writeln(' remplac�e par un tas vide');
      writeln;
      writeln('Veuillez tapez sur la touche Entr�e pour continuer ');
      readln(motchoisi); 
      debordement := false;
      longueurtotale := 0;
      motchoisi := mot('',20)
   end else begin
      debordement := false;
      niveaudetoile := 0;
      motconstruit := '';
      while (length(motconstruit)<(maxhttas div 4))
	 and (niveaudetoile<15)
	 and not debordement
	 do begin
	    motchoisi := motconstruit;
	    longueurtotale := 0;
	    niveaudetoile := niveaudetoile+1;
	    motconstruit := mot(expression,niveaudetoile)
	 end ;
      if niveaudetoile=1 then begin
	 {on est sorti d�s la fin du premier calcul d'expression}
	 writeln('Initialisation du tas ',Le_Tas);
	 writeln;
	 writeln('expression trop longue ou contenant trop d''it�rations');
	 writeln(' remplac�e par un tas vide');
	 writeln;
	 writeln('Veuillez tapez sur la touche Entr�e pour continuer ');
	 readln(motchoisi); 
	 debordement := false;
	 longueurtotale := 0;
	 motchoisi := mot('',20)
      end
   end;


   for i := 1 to length(motchoisi) do
      case motchoisi[i] of
	'T' : tas[Le_Tas,i] := random(13);
	'K' : tas[Le_Tas,i] := random(13)+13;
	'C' : tas[Le_Tas,i] := random(13)+26;
	'P' : tas[Le_Tas,i] := random(13)+39;
      end;  
   sommet[Le_Tas] := length(motchoisi);
   Afficher_Les_Tas ;
end {InitTas} ;

function TasVide (const Le_Tas : TasPossibles) : boolean;
begin
   TasVide := sommet [Le_Tas] = 0 ;
end {TasVide} ;



function TasNonVide (const Le_Tas : TasPossibles) : boolean;
begin
   TasNonVide := not TasVide (Le_Tas) ;
end {TasNonVide} ;


function TasPlein (const Le_Tas : TasPossibles) : boolean ;
begin
   TasPlein := sommet [Le_Tas] = High (HauteurTas) ;
end {TasPlein} ;

function CouleurSommet (const Le_Tas : TasPossibles) : Couleurs;
begin
   if TasVide (Le_Tas) then begin
      raise Tas_Vide.Create ('CouleurSommet : le tas est vide')
   end ;
//   if sommet[Le_Tas]=0 then
//      CouleurSommet := indefini
   CouleurSommet := La_Couleur (tas[Le_Tas,sommet[Le_Tas]]) ;
end {CouleurSommet} ;

//  Une fonction priv�e :
function CouleurSommetEgal(const Le_Tas	: TasPossibles ; const La_Couleur : Couleurs) : Boolean;
begin
   CouleurSommetEgal := CouleurSommet(Le_Tas) = La_Couleur ;
end {CouleurSommetEgal} ;


function SommetTrefle(const Le_Tas : TasPossibles) : boolean;
begin
   SommetTrefle := CouleurSommetEgal (Le_Tas, trefle) ;
end {SommetTrefle} ;

function SommetCarreau(const Le_Tas : TasPossibles) : boolean;
begin
   SommetCarreau := CouleurSommetEgal (Le_Tas, carreau) ;
end {SommetCarreau} ;

function SommetCoeur(const Le_Tas : TasPossibles) : boolean;
begin
   SommetCoeur := CouleurSommetEgal (Le_Tas, coeur) ;
end {SommetCoeur} ;

function SommetPique(const Le_Tas : TasPossibles) : boolean;
begin
   SommetPique := CouleurSommetEgal (Le_Tas, pique) ;
end {SommetPique} ;

function Superieur(const Le_Tas1, Le_Tas2 : TasPossibles) : boolean;
begin
   if TasVide (Le_Tas1) or TasVide (Le_Tas2) then begin
      raise Tas_Vide.Create ('Superieur : un des tas est vide') ;
   end ;
   Superieur := La_Valeur (tas[Le_Tas1,sommet[Le_Tas1]]) >= La_Valeur (tas[Le_Tas2,sommet[Le_Tas2]]) ;
end {Superieur} ;

procedure DeplacerSommet(const TasDepart, TasArriv : TasPossibles);
begin
   if Mode_Texte then begin
      writeln ;
      writeln ('DeplacerSommet (TasDepart => ', TasDepart, ', TasArriv => ', TasArriv, ')') ;
   end ;
   if TasVide (TasDepart) then begin
      raise Tas_Vide.Create ('DeplacerSommet : le tas source est vide') ;
   end ;
   if TasPlein (TasArriv) then begin
      raise Tas_Plein.Create ('DeplacerSommet : le tas cible est plein') ;
   end ;
   tas [TasArriv,sommet [TasArriv]+1] := tas [TasDepart,sommet [TasDepart]] ;
   sommet [TasDepart] := sommet [TasDepart] - 1 ;
   sommet [TasArriv] := sommet [TasArriv] + 1 ;
   Afficher_Les_Tas ;
   sleep (lenteur)
end {DeplacerSommet} ;


initialization
   Mode_Texte := true ;
   randomize;
   Les_Tas_Ont_Deja_Ete_Affiches := false ;
   lenteur := 500;
   decouvert := true ;
   
   for i := Low (sommet) to High (sommet) do begin
      sommet [i] := 0;
   end ;
   
finalization
   if ExceptObject=Nil then
   begin
      writeln('                    ____     ____');
      writeln('                  /''    |   |    \');
      writeln('                /    /  |   | \   \');
      writeln('              /    / |  |   |  \   \');
      writeln('             :   /   |  """"   |\   \' );   
      writeln('             | /   / /^\    /^\  \  _|');         
      writeln('              ~   | |   |  |   | | ~');
      writeln('                  | |__O|__|O__| |');
      writeln('                /~~      \/     ~~\');
      writeln('               /   (      |      )  \');
      writeln('         _--_  /,   `\___/^\___/''    \  _--_');
      writeln('       /~    ~\ / -____-|_|_|-____-\ /~    ~\');
      writeln('     /____--------/~~~~\---/~~~~\ -----------_____');
      writeln('--~~~          ^ |     |   |     |  -     :       ~:~-_     ___-----~~~~~~~~|');
      writeln('   /             `^-^-^''   `^-^-^''                  :  ~\ /''   ____/--------|');
      writeln('       --                                            ;   | /~~~------~~~~~~~~~|');
      writeln(' ;                                    :              :   | ----------/--------|');
      writeln(':                     ,                           ;   .  |---\\--------------|');
      writeln(' :     -                          .                  : : |______________-__|');
      writeln('  :              ,                 ,                :   /''~----___________|');
      writeln('__  \\\        ^                          ,, ;; ;; ;._-~');
      writeln('  ~~~-----____________________________________----~~~  ');
   end (*if*);
end.
