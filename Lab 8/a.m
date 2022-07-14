
syms x 

n = sqrt(5) + sin(x);
d = 1 + x.^2;


fun = @(x) sin(x.^3 - 7*x.^2 + 6*x + 8);
x = (1 - sqrt(5))/2;
toler = 0.01;
u = diffim(fun,x,toler);

disp(u);

function [L,n]= diffim(f,x,toler)
%Input = fisthe function input as astring ’ f ’
% - x is the differentiation point
% - t o l e r i s t h e d e s i r e d t o l e r a n c e
%Output - L =[H’ D’ E ’ ] : H i s t h e v e c t o r o f s t e p s i z e s
% D i s t h e v e c t o r o f a p pr ox im a te d e r i v a t i v e s
% E i s t h e v e c t o r o f e r r o r bounds
% = n i s t h e c o o r d i n a t e o f t h e ” b e s t a p p r o im a t i on ”
% NUMERICAL METHODS: MATLAB Programs
max=15;
h=1/10;
H(1)=h;
D(1)=(feval(f,x+h) - feval(f,x-h))/(2*h);
E(1)= 0;
R(1)= 0;
    for n=1:2
        h=h/10;
        H(n+1)=h;
        D(n+1)=(feval(f,x+h)- feval(f,x-h))/(2*h);
        E(n+1)=abs(D(n+1)- D(n));
        R(n+1)=2*E(n+1)*(abs(D(n+1))+abs(D(n))+eps);
    end
    
n=2;

    while ((E(n)>E(n+1))&&(R(n)> toler))&& n < max
        h=h/10;
        H(n+2)=h ;
        D(n+2)=(feval(f,x+h)- feval(f,x-h))/(2*h);
        E(n+2)=abs(D(n+2)- D(n+1));
        R(n+2)=2*E(n+2)*(abs(D(n+2))+ abs(D(n+1))+eps);
        n=n+1;
    end
n = length(D)-1;
L = [H,D,E];
end