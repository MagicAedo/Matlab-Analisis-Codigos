x = [-8,-2,0,4,6];
y = [6.8,5,2.2,.5,-1.3];


T = [87.97 224.70 365.26 686.98 4332.59 10759.22 30685.40 60189.00];
R = [57.91 108.70 149.60 227.92 778.57 1433.53 2872.46 4495.06];

y_t = log10((T.*86400).^2);
x_t = log10((R.*10^9).^3);


% x = [-1,0,1,2,3,4,5,6];
% y= [10,9,7,5,4,3,0,-1];

sol_1 = my_lsline(x,y);


sol_2 = my_lsline(x_t,y_t); 

%ahora se procede a hallar la constante gravitacional


G_exp = 4*pi.^2/((10.^sol_2(2)).*1.989e30);
G_teorico = 6.674e-11;
disp("La constante de gravitacion es: ");
disp(G_exp);
disp("El error de la constante de gravitacion es: ")
disp(abs(G_teorico-G_exp)/G_teorico); 





function [S] = my_lsline(X,Y)
    x_sum = 0;
    y_sum = 0;
    x_sum_square = 0;
    xy_prod = 0; 
    for i=1:length(X)
        x_sum = x_sum + X(i); 
        y_sum = y_sum + Y(i);
        x_sum_square = x_sum_square + X(i)^2; 
        xy_prod = xy_prod + X(i)*Y(i);
    end 
    matrix_p = [x_sum_square,x_sum, xy_prod;x_sum,length(X),y_sum];
    sol_matrix = linsolve(matrix_p(1:2,1:2),matrix_p(1:2,3));
    S = [sol_matrix(1,1),sol_matrix(2,1)];
    fx = polyval(S,X);
    figure
    title('Regresión lineal');
    hold on 
    plot(X,fx); 
    hold on 
    scatter(X,Y,'filled','r');
    hold on
    legend('f(xk)','yk');
    grid on
    error2 = sqrt(sum(abs(fx-Y).^2)/length(X));
    disp("El error2 es: ");
    disp(error2);
end 

