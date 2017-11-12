//exo 7 page 129

program PIANO;
uses crt;
var 
   touche : char;
   stop : boolean;

procedure son (frequence : word);
begin
	sound(frequence);
	delay(4000);
	nosound;
end;//son
begin
  
  stop := false;
  repeat
  touche := readkey;
     case touche of
	   'A','a' : son(500);//do
	   'Z','z' : son(561);//ré
	   'E','e' : son(630);//mi
	   'R','r' : son(667);//fa
	   'T','t' : son(749);//sol
	   'Y','y' : son(841);//la
	   'U','u' : son(944);//si
	   'I','i' : son(1000);//do
	else
		stop := true
	end;
	
  until (stop = false); 	   
end.
