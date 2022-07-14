
syms x 

fun =  x.^3 + 13.*x.^2 - 297.5.*x + 0.00000375.*exp(x);
valor = double(subs(fun,2));
der = diff(fun);
fprintf("El valor es %d \n",4);

raiz1 = my_newton_function_santiago_quintero(fun,der,0,5);

raiz2 = my_newton_function_santiago_quintero(fun,der,20,5);
 
raiz3 = my_newton_function_santiago_quintero(fun,der,-200,5);





function [root] = my_newton_function_santiago_quintero(fun,der,p0,iter)
    syms x 
    root = p0;
    disp('iter     raiz    f(x)  df(x) error')
    for i=1:iter
        root1 = root;
        funcion = double(subs(fun,root));
        derivada = double(subs(der,root));
        root =  root - funcion/derivada;
        error_abs = abs(root-root1);
        fprintf("%d  %d %d %d %d\n",i,root,funcion,derivada,error_abs)      
    end 
    
end 






