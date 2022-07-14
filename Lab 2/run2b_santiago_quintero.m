


i = 2;
a= 7.8;
b= 8.1;
f = @(x) (x - 8)*(x - 3).^2;




figure
while i <= 10 
    %se dibujan las iteraciones practicas 
    
    j = bisection_fuction_santiago_quintero(f, a,b,20,exp(1).^(-i)); 
    stem(exp(1).^(-i),j(2),'LineWidth',2,'LineStyle',':')
    hold on 
    
    i = i + 2; 


end 
title('N practico')
xlabel('Criterio de parada')
ylabel('n')
grid on 


% ahora se saca los que se hacen de manera teorica 

figure
i=2;
while i<= 10 
    
    stem(exp(1).^(-i),fix(log2((b-a)/exp(1).^(-i)))+1,'LineWidth',2)
    hold on 
    
    i = i + 2; 

end 
title('N teorico')
xlabel('Criterio de parada')
ylabel('n')
grid on







function [P] = bisection_fuction_santiago_quintero(fun,a,b,iter,tol)
    if fun(a)*fun(b)<0
        for i=1:iter
            c = (a+b)/2;
            if c-a <= tol 
               
                break
            end 
            
            if (fun(a)*fun(c)>0)
                a = c;
            else 
                b = c;
            end 
        end 
    
    end 
    P = [c,i] ; 
    
    

end 