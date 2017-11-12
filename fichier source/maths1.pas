program maths1;


const n=5;
var s:cardinal;
var i:real;


begin
  i:=1; 
for s:=1 to n do begin
    i:= i*s;
end;

writeln('le factorielle de ',n,' vaut: ',i:2:5);
end.