


fun = @(x) (10*x)/(sqrt(x) + 1).^5;
a = 1;
b = 2; 
M = 5;  

r = my_simpson_function( fun, a,b,M);
function [P] = my_simpson_function(fun,a,b,M)
    h = (b-a)/(2*M);
    p = a;
    P = fun(a) + fun(b);
    for i=1:2*M-1
        p = p + h; 
        if mod(i,2) == 0
            P = P + 2*fun(p);
        else 
            P = P + 4*fun(p);
        end
    end

    P = h/3 * P;
    disp(P);

end 
