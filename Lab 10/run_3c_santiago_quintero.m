



fun = @(x,y) exp(-2*x) - 2*y; 

c = my_RK4_function_santiago_quintero(fun,0,0.4,1/10,0.1); 






%Metodo de Runge Kutta R4
function [R] = my_RK4_function_santiago_quintero(fun, a, b,y0,h)
    
    for i=0:b/h
        k1 = fun(a,y0);
        k2 = fun(a + h/2,y0 + (h/2)*k1);
        k3 = fun(a + h/2,y0 + (h/2)*k2);
        k4 = fun(a+h, y0 + h*k3); 
        y0 = y0 + (h/6)*(k1 + 2*k2 + 2*k3 + k4); 
        a = a + h;
    end 

    R = y0; 


end 