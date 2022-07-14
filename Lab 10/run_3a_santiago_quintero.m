


fun = @(x,y) exp(-2*x) - 2*y; 

a = my_euler_function_santiago_quintero(fun,0,0.4,1/10,0.1); 


%Metodo de Euler
function [R] = my_euler_function_santiago_quintero(fun, a, b,y0,h)
    
    for i=0:b/h
        y0 =  y0 + h*fun(a,y0); 
        a = a + h;
    end 

    R = y0; 


end 