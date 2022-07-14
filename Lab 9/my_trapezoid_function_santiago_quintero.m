
fun = @(x) (10*x)/(sqrt(x) + 1).^5;
a = 1;
b = 2; 
M = 5;  
r = my_trapezoidal_function( fun, a,b,M);


function [R] = my_trapezoidal_function(fun,a,b,M)
    h = (b - a)/M; 
    R = double(h/2 * (subs(fun,a) + subs(fun,b))); 
    p_actual = a;
    for i=0:M - 2
        p_actual = p_actual + h; 
        R = double(R + h*subs(fun,p_actual));
    end
    disp(R)
end 