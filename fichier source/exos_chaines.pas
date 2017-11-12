{--------------------------------------------------------------------------------------------}
{-                                      exos_chaines.pas                                    -}
{- Christian Lasou, 30/11/06                                                                -}
{- feuille d'exercices sur les cha�nes de caract�res                                        -}
{--------------------------------------------------------------------------------------------}

program exos_chaines;

uses SysUtils;

////////////////////////////////////////
// RAPPEL DE COURS SUR LES CARACTERES //
////////////////////////////////////////

// Le type en Pascal est CHAR, les valeurs de ce type sont mis entre apostrophes
// On peut donc d�clarer
//          var c : CHAR ;
// puis dans le programme �crire une instruction du type
//          c := 'A' ;   // qui affecte � la variable c la valeur 'A'
// Les "CHAR" sont cod�s sur un octet donc leur code va de 0 � 255, ce codage appel� ASCII
// n'est pas fait n'importe comment, les majuscules 'A',..,'Z' sont ensemble et dans l'ordre
// de l'alphabet, m�me chose pour les minuscules 'a',..,'z' et m�me chose pour les chiffres
// '0',..,'1', par contre il n'est pas n�cessaire de savoir les positions relatives des 
// majuscules, minuscules et chiffres.
// Enfin on dispose de deux fonctions qui permettent de passer d'un caract�re � son code et
// vice-versa :
//                      ord : CHAR --------------> CARDINAL
//                              c  --------------> le code de c
// exemple : ord('C') vaut 67
// et                      
//                      char : CARDINAL ---------> CHAR
//                                n     ---------> le caract�re de code n
// exemple : char(68) vaut 'D'
// On a bien s�r char(ord(c) = c et ord(char(n)) = n


///////////////////////////////////
// QUELQUES EXERCICES FAIT EN TD //
///////////////////////////////////

  // Une proc�dure qui affiche les caract�res et leur codes sous la forme :
  //  code:car ; code:car ; code:car ; ...
  // on ne le fait que pour les codes de 32 � 255 (les codes de 0 � 31 sont des caract�res
  // de contr�le
  procedure afficher ;
  var i : CARDINAL ;
  begin
    for i := 32 to 255 do begin
      write(i,':',char(i),' ; ') ;
    end {for} ;
    writeln ;
  end {afficher} ;
  
  // Une fonction qui calcule la majuscule d'un caract�re si ce caract�re est une minuscule
  // ou sinon le r�sultat est le caract�re lui-m�me
  function majuscule(c : CHAR) : CHAR ;
  begin
    if ('a' <= c) and (c <= 'z') then begin  // c est une minuscule
      majuscule := char(ord(c)+ord('A')-ord('a')) ;
    end else begin
      majuscule := c ;
    end {if} ;
  end {majuscule} ;

  // Une fonction qui calcule la valeur d'un caract�re suppos� �tre un chiffre
  // valeur('5') = 5
  function valeur(c : CHAR) : CARDINAL ;
  // c est un chiffre '0', '1', ... '9'
  begin
    valeur := ord(c) - ord('0') ;
  end {valeur} ;
  
  // Une fonction qui calcule la valeur d'une cha�ne de caract�res suppos� repr�senter un
  // nombre
  // valeur('573') = 573
  function valeur(s : STRING) : CARDINAL ;
  // s repr�sente un nombre
  var resultat,i : CARDINAL ;
  begin
    resultat := 0 ;
    for i := 1 to length(s) do begin
      resultat := 10*resultat+valeur(s[i]) ;  // quelle fonction valeur il utilise ?
    end {for} ;
    valeur := resultat ;
  end {valeur} ;
      
///////////////////////////////////////////////////////////////
// QUELQUES EXERCICES A FAIRE (CERTAINS ONT ETE FAITS EN TD) //
///////////////////////////////////////////////////////////////

  // Vous n'oublierez pas de tester vos fonctions � chaque fois que vous en avez �crit une

  // Ecrire une fonction image_chiffre qui calcule le chiffre (caract�re) correspondant � un
  // nombre n d'un chiffre (c'est la fonction r�ciproque de valeur)
  // exemple :   image_chiffre(7) = '7'

  // Ecrire une fonction image qui calcule la cha�ne correspondant � un naturel n pass� en
  // param�tre (c'est aussi la fonction r�ciproque de valeur).
  // exemple : valeur(2504) = '2504' 

  // Le miroir d'une cha�ne s est une cha�ne s' ayant les m�mes caract�res que s mais dans 
  // l'ordre inverse. Exemple : miroir('info') = 'ofni'
  // Ecrire une fonction miroir qui, � partir d'une cha�ne s, calcule son miroir

  // Une cha�ne de caract�res s est un palindrome si elle est �gale � son miroir
  // Exemple : �t�, laval, elle, anna sont des palyndromes, mais 'toto' non
  // Ecrire un pr�dicat est_palindromme qui teste si son param�tre s est un palindrome.
  // Remarque : on pourrait tester si s = miroir(s) mais ce n'est pas efficace (on calcule
  // miroir de s alors que si s = 'a......b' il n'est pas n�cessaire de calculer miroir(s)
  // pour voir que s n'est pas un palindrome (c'est imm�diat). 

  // Voici une transformation d'une cha�ne de caract�res
  //           'bonjour' ----> 'boonnnjjjjooooouuuuuurrrrrrr'
  // chaque caract�re est reproduit autant de fois que sa place dans la cha�ne
  // Ecrivez une fonction "de_plus-en_plus_long" qui calcule le transform� de son param�tre

  // Le verlan consiste en la chose suivante : pour un mot donn� par exemple 'patati' on
  // inverse les syllabes ce qui donne 'titapa'.
  // Evidemment traduire en verlan un mot quelconque de la langue fran�aise risque d'�tre
  // difficile � cause du d�coupage en syllabes, � cause des exceptions, comme le montre
  // les mots suivants : temp�te, compter, crypter.
  // Par contre si on se restreint aux mots dont toutes les syllabes ont deux lettres, il 
  // n'y a plus de probl�me : verlan('velo') = 'love', verlan('ordi') = 'dior' et 
  // verlan('madame') = 'medama'
  // Ecrivez une fonction verlan qui traduit en verlan un mot o� toutes les syllabes ont
  // deux caract�res.

  // Sachant que les caract�res standards ont un code compris entre 32 et 127, on peut uti-
  // liser le principe suivant pour crypter un message :
  // pour chaque caract�re du message je prend son code c, j'enl�ve 32 j'obtiens un nombre n
  // entre 0 et 95, ensuite je code ce nombre par la formule n' = (a*n+b) mod 96, o� a et b
  // sont des nombres choisis, n' est lui aussi entre 0 et 95, on crypte alors c par le carac-
  // t�re c' donc le code est n'+32.
  // question 1 : Que devient le caract�re 'A' dans ce codage si on a choisi a = 5 et b = 3
  // question 2 : Codez le message 'bonjour, il fait beau'
  // question 3 : Ecrivez la fonction code qui code un caract�re pass� en param�tre (a et b
  //              sont des constantes du programme).
  // question 4 : Ecrivez la fonction code qui code une cha�ne de caract�res (toujours avec
  //              les m�mes a et b)
  // question 5 : Que pensez-vous de la fonction decode qui permet de d�coder un message 
  //              cod� ?



  var c : CHAR ;
    
BEGIN // du programme

  c := 'Y' ;
  writeln('ord(Y) = ', ord('Y')) ;
  writeln('char(84) = ', char(84)) ;
  
  afficher ;
  
  // tests de majuscule
  writeln('majuscule(''d'') vaut ',majuscule('d')) ;
  writeln('majuscule(''G'') vaut ',majuscule('G')) ;
  writeln('majuscule('';'') vaut ',majuscule(';')) ;

  // tests de valeur
  writeln('valeur(''7'') vaut ',valeur('7')) ;

  // tests de valeur
  writeln('valeur(''375'') vaut ',valeur('375')) ;
  writeln('valeur(''3705'') vaut ',valeur('3705')) ;

END.

RESULTAT

ord(Y) = 89
char(84) = T
32:  ; 33:! ; 34:" ; 35:# ; 36:$ ; 37:% ; 38:& ; 39:' ; 40:( ; 41:) ; 42:* ; 43:+ ; 44:, ; 45:- ; 46:. ; 47:/ ; 48:0 ; 49:1 ; 50:2 ; 51:3 ; 52:4 ; 53:5 ; 54:6 ; 55:7 ; 56:8 ; 57:9 ; 58:: ; 59:;; 60:< ; 61:= ; 62:> ; 63:? ; 64:@ ; 65:A ; 66:B ; 67:C ; 68:D ; 69:E ; 70:F ; 71:G ; 72:H ; 73:I ; 74:J ; 75:K ; 76:L ; 77:M ; 78:N ; 79:O ; 80:P ; 81:Q ; 82:R ; 83:S ; 84:T ; 85:U ; 86:V ; 87:W ; 88:X ; 89:Y ; 90:Z ; 91:[ ; 92:\ ; 93:] ; 94:^ ; 95:_ ; 96:` ; 97:a ; 98:b ; 99:c ; 100:d ; 101:e ; 102:f ; 103:g ; 104:h ; 105:i ; 106:j ; 107:k ; 108:l ; 109:m ; 110:n ; 111:o ; 112:p ; 113:q ; 114:r ; 115:s ; 116:t ; 117:u ; 118:v ; 119:w ; 120:x ; 121:y ; 122:z ; 123:{ ; 124:| ; 125:} ; 126:~ ; 127: ; 128: ; 129: ; 130: ; 131: ; 132: ; 133: ; 134: ; 135: ; 136: ; 137: ; 138: ;139: ; 140: ; 141: ; 142: ; 143: ; 144: ; 145: ; 146: ; 147: ; 148: ; 149: ; 150: ; 151: ; 152: ; 153: ; 154: ; 155:; 156: ; 157: ; 158: ; 159: ; 160:� ; 161:� ; 162:� ; 163:� ; 164:� ; 165:� ;166:� ; 167:� ; 168:� ; 169:� ; 170:� ; 171:� ; 172:� ; 173:� ; 174:� ; 175:� ; 176:� ; 177:� ; 178:� ; 179:� ; 180:� ; 181:� ; 182:� ; 183:� ; 184:� ; 185:� ; 186:� ; 187:� ; 188:� ; 189:� ; 190:� ; 191:� ; 192:� ; 193:� ; 194:� ; 195:� ; 196:� ; 197:� ; 198:� ; 199:� ; 200:� ; 201:� ; 202:� ; 203:� ; 204:� ; 205:� ; 206:� ; 207:� ; 208:� ; 209:� ; 210:� ; 211:� ; 212:� ; 213:� ; 214:� ; 215:� ; 216:� ; 217:� ; 218:� ; 219:� ; 220:� ; 221:� ; 222:� ; 223:� ; 224:� ; 225:� ; 226:� ; 227:� ; 228:� ; 229:� ; 230:� ; 231:� ; 232:� ; 233:� ; 234:� ; 235:� ; 236:� ; 237:� ; 238:�; 239:� ; 240:� ; 241:� ; 242:� ; 243:� ; 244:� ; 245:� ; 246:� ; 247:� ; 248:� ; 249:� ; 250:� ; 251:� ; 252:� ; 253:� ; 254:� ; 255:� ;
majuscule('d') vaut D
majuscule('G') vaut G
majuscule(';') vaut ;
valeur('7') vaut 7
valeur('375') vaut 375
valeur('3705') vaut 3705
