%Se hace 
x1 = [0,1,2,3,4]; 
y1 = double(subs(@(x) 3*sin((pi * x)/6)^2,x1));
p_1 = lagrange_poly(x1,y1);
lagrange_p = polyval(p_1,x1);


%Para graficar ejectuar tambien el archivo de my_newton_pol_santiago_quintero.m
title("Grafica");
hold on 
xlabel("X");
hold on
ylabel("Y");
hold on
fplot(@(x) 3*sin((pi * x)/6).^2  ); %grafica original
hold on 
plot(x1,y1,'r','LineWidth',2,'LineStyle',':'); 
hold on 
plot(x2,y2,'g','LineWidth',2,'LineStyle','--');
legend("Funcion Original","Lagrange","Newton")
grid on;


function [suma_p] = lagrange_poly(X,Y)
    suma_p = 0; 
    for i=1:length(X)
        p = 1;
        for j = 1:length(X)
            if i~=j
                p_n = poly(X(j)); %Polinomio numerador actual
                p_d = X(i) - X(j); %polinomio denominador actual
                p_a = p_n / p_d; %polinomio actual
                p = conv(p,p_a);
            end 
        end 
        op_y = p * Y(i) ; %se opera el polinomio por la y 
        suma_p = suma_p + op_y;
    end 
end