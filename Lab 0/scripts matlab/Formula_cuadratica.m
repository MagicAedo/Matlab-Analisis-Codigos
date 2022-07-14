%Formula cuadratica 
x = [formula_cuadratica(1,-1000.001,1);formula_cuadratica(1,-10000.0001,1);formula_cuadratica(1,-100000.00001,1);formula_cuadratica(1,-1000000.000001,1)];




function [R] = formula_cuadratica(a,b,c)
    r = (b^2 - 4*a*c)^(1/2);
    if b > 0
        x1 = (-2*c) / (b+r);
        x2 = (-b-r) / 2*a;
    else 
    x1 = (-b+r) / 2*a;
    x2 = (-2*c) / (b-r);
    end 
    
    
    R = [x1,x2];

end 


