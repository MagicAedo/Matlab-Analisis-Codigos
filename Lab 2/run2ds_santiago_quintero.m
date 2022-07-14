syms x 
% 
% y = ylim; % current y-axis limits
% plot([21 21],[y(1) y(2)])
% a = @(x) x.^2;
% fplot(a)
% hold on 
% stem(2,4)
% grid on
m = my_visual_bisection_function_santiagoQuintero(@(x) 1500.*exp(1).^(x) + 475.*((exp(1).^(x) - 1)./x ) - 2264,0.01,1,100);
% b = my_visual_bisection_function_santiagoQuintero(@(x) (x - 8).*(x - 3).^2,7.8,8.1,10);

function [p] = my_visual_bisection_function_santiagoQuintero(fun,a,b,iter)
     string = sprintf('Visualizacion de la bisección en el intervalo [%f, %f] con %d iteraciones',a,b,iter);
     if fun(a)*fun(b)<0
         xline(a,'g','LineWidth',1,'LineStyle','--')
         hold on 
         xline(b,'g','LineWidth',1,'LineStyle','--')
         hold on
         fplot(fun)
         hold on 
        for i=1:iter
            c = (a+b)/2;
            if (fun(a)*fun(c)>0)
                a = c;
            else 
                b = c;
            end 
            
            stem(c,fun(c),'LineWidth',2)
            title(string)
            hold on 
        end
        grid on 

        

    
     end 
     p = [c,fun(c)];

end 