%
x2 = [0,1,2,3,4]; 
y2 = double(subs(@(x) 3*sin((pi * x)/6)^2,x2));
p_2 = newton_pol(x2,y2);
newton_p = polyval(p_2,x2);
function [suma_p] = newton_pol(X,Y)
%primero se buscan los A: 
    m = zeros(length(X));
    a= zeros(1,length(X));
    m(1,1) = Y(1); 
    a(1,1) = m(1,1);
    for i=2:length(X)
        n = 1;
        m(i,1) = Y(i);
        for j=2:i
            m(i,j) = (m(i,j-1) - m(i-1,j-1))/(X(i)-X(i-n));
            n = n + 1;
        end 
        a(i) = m(i,i);
    end
    %ahora se va hacer el polinomio
    suma_p = zeros(1,length(a));
    suma_p(length(a)) =  a(1);
    a = a(2:length(a));
    for i = 1:length(a)
        p_a = 1;
        for j = 1 :i 
            p_a = conv(p_a,poly(X(j)));
        end 
        op_y = p_a * a(i);
        suma_p(length(suma_p)-(i):length(suma_p)) = suma_p(length(suma_p)-(i):length(suma_p)) + op_y;
    end 
end