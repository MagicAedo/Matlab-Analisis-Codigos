syms x 
h = my_fixed_point(@(x) 1 + 2/x,1,5,4,100);
Ws = 4.8;
j = my_fixed_point(@(x) (x+10)^(1/2)/x,0,50,1,50);
visual_verification((x+10)^(1/2)/x,1,50);
s = my_fixed_point(@(x) (x+10)^(1/4),0,50,1,50);
visual_verification((x+10)^(1/4),1,50);
l = my_fixed_point(@(x) 10/(x^3 - 1),0,50,1,1000);
visual_verification(10/((x^3)-1),2,50);

% visual_verification(1 + 2/x,1,5);




function [] = visual_verification(fun,a,b)
    syms x 
    I = linspace(a,b,100);
    y = subs(fun,x,I);
    c1 = a * ones(1, length(I));
    c2 = b * ones(1, length(I));
    figure 
    plot(I,y, 'b', 'LineWidth', 2)
    hold on 
    plot(I, c1, 'r', 'LineWidth', 2)
    hold on
    plot(I, c2, 'r', 'LineWidth', 2)
    grid on;
    %Ahora se hace la segunda prueba que es ver si la derivada de la
    %funcion se en cuentra entre -1 y 1, en ese caso es UNICO fixed point
    figure 
    c1 = 1 * ones(1, length(I));
    c2 = -1 * ones(1, length(I));
    fun = diff(fun);
    y = subs(fun,x,I);
    plot(I,y, 'b', 'LineWidth', 2)
    hold on
    plot(I, c1, 'r', 'LineWidth', 2)
    hold on
    plot(I, c2, 'r', 'LineWidth', 2)
    grid on; 
end


function [P] = my_fixed_point(fun,a,b,p0,iter)
    P = p0;
    for i = 0:iter
        P = fun(P);
    end 
end 