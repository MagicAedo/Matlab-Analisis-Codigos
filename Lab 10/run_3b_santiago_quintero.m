



fun = @(x,y) exp(-2*x) - 2*y; 

b = my_heun_function_santiago_quintero(fun,0,0.4,1/10,0.1); 


%Metodo de Heun
function [R] = my_heun_function_santiago_quintero(fun, a, b,y0,h)
    
    for i=0:b/h
        pk =  y0 + h*fun(a,y0); 
        y0 = y0 + (h/2)*(fun(a,y0) + fun(a+h,pk)); 
        a = a + h;
    end 

    R = y0; 


end 