syms x 

 my_visual_bisection_function_santiagoQuintero(fun,der,0,5)
 
 
 
 function [] = my_visual_bisection_function_santiagoQuintero(fun,der,p0,iter)
     string = sprintf('Visualizacion del metodo de newton con %d iteraciones',iter);
     root = p0;
     g_root = []; 
     fval =[];
     for i=1:iter
            funcion = double(subs(fun,root));
            derivada = double(subs(der,root));
            root =  root - funcion/derivada;
            g_root(i) = root;        
            fval(i)=funcion;
     end
     
     plot(g_root, fval,"LineWidth",2);
     hold on 
     title(string)
     grid on 

        

 end 