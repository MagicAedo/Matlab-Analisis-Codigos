

j = my_finding_interval_santiago_quintero(@(x) x*sin(x) - 1);






function [P] = my_finding_interval_santiago_quintero(fun)

    condicion = false;
    cambio = 0;
    while condicion == false
        cambio = cambio + 0.025;
        if(fun(cambio)*fun(cambio-0.025)<0)
            a = cambio-0.025;
            b=cambio;
            condicion = true; 
        end
      
    end 
    P = [a,b];
    

end 