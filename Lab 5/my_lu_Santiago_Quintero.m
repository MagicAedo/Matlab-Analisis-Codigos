

%Matriz 1 implementacion (sacar LU): 

matriz_1 = [1,1,0,4;2,-1,5,0;5,2,1,2;-3,0,2,6]; %%Primera matriz, sacar la factorizacion LU
lu_factorizacion(matriz_1); 

%Matriz 2: Sacar LU y resolver el sistema lineal: 
matriz_2 = [1,2,-3,4;4,8,12,-8;2,3,2,1;-3,-1,1,-4]; %Segunda matriz, sacar la factorizacion LU y resolver el sistema de ecuaciones
matriz_aumentada = [3;60;1;5];
lu_factorizacion_aumentada(matriz_2,matriz_aumentada);

%Matriz 3 : problema de interpretación 
matriz_3 = [1,-1,-1;0,1,-2;10,15,40]; 
matriz_aum2 = [0;0;300]; 
lu_factorizacion_aumentada(matriz_3,matriz_aum2);

%Matriz 4: Problema propuesto
matriz_4 = [24,6,12;-3,0,1;4,-1,4];
matriz_aum3 = [156;0;0];
lu_factorizacion_aumentada(matriz_4,matriz_aum3);




%Van haber dos funciones para sacar LU pero una recibe una matriz aumentada
%en caso de que se necesite resolver el sistema de ecuaciones.


%Codigo para sacar la factorizacion LU y la solución del sistema de
%ecuaciones con la matriz aumentada.

function [L,U] = lu_factorizacion_aumentada(matriz,matriz_aum)
     matrice_size = size(matriz); 
    temp = matriz; 
    temp_aum = matriz_aum; 
    L = eye(matrice_size); 
    i = 1; 
    while i <= matrice_size(1) % Se realiza el cambio de fila en caso de que sea necesario.
           if(matriz(i,i) == 0)
                rand_n = i;
                matriz = temp; 
                while rand_n == i
                    rand_n = randi([i,matrice_size(2)]);
                end 
                matriz(i,1:matrice_size(2)) = temp(rand_n,1:matrice_size(2));
                matriz(rand_n,1:matrice_size(2)) = temp(i,1:matrice_size(2));
                matriz_aum(i,1) = temp_aum(rand_n,1);
                matriz_aum(rand_n,1) = temp_aum(i,1);
                temp = matriz; 
                temp_aum = matriz_aum; 
                L = eye(matrice_size);
                i = 1;
            end
        for j = i+1:matrice_size(2)
         
            
            m_rp = matriz(j,i)/matriz(i,i); 
            for k = i:matrice_size(1)
                matriz(j,k) = matriz(j,k) - m_rp*matriz(i,k);  

                if k == i
                      L(j,k) = m_rp + L(j,k);
                      matriz(j,k) = matriz(j,k) - matriz(j,k); %simplemente para efectos de visualizacion algunas operaciones no se van a poder volver cero directamente así que acá se hace.
                end 
             end 

        end 
        i = i + 1;
    end 
    U = matriz; 
    disp("La matriz L: ")
    disp(L);
    disp("La matriz U: ")
    disp(U);
    disp("La matriz A: ")
    disp(L*U);
    disp("La matriz aumentada")
    disp(matriz_aum);
    %Ahora se va a resolver la ecuacion lineal con la matriz aumentada
    y = linsolve(L,matriz_aum);
    x = linsolve(U,y); 
    disp("La solucion del sistema es: "); 
    disp(x); 
    disp("-----------------------------------------")
end 

%------------------ Codigo para solamente sacar la factorizacion LU

function  [L,U] = lu_factorizacion(matriz)
    matrice_size = size(matriz); 
    temp = matriz; 
    L = eye(matrice_size); 
    i = 1; 
    while i <= matrice_size(1)
           if(matriz(i,i) == 0)
                rand_n = i;
                matriz = temp; 
                while rand_n == i
                    rand_n = randi([i,matrice_size(2)]);
                end 
                matriz(i,1:matrice_size(2)) = temp(rand_n,1:matrice_size(2));
                matriz(rand_n,1:matrice_size(2)) = temp(i,1:matrice_size(2));
                temp = matriz;
                L = eye(matrice_size);
                i = 1;
            end
        for j = i+1:matrice_size(2)
         
            
            m_rp = matriz(j,i)/matriz(i,i); 
            for k = i:matrice_size(1)
                matriz(j,k) = matriz(j,k) - m_rp*matriz(i,k);  

                if k == i
                      L(j,k) = m_rp + L(j,k);
                      matriz(j,k) = matriz(j,k) - matriz(j,k); %simplemente para efectos de visualizacion algunas operaciones no se van a poder volver cero directamente así que acá se hace.
                end 
             end 

        end 
        i = i + 1;
    end 
    U = matriz; 
    disp("La matriz L: ");
    disp(L);
    disp("La matriz U: ");
    disp(U);
    disp("La matriz A: ");
    disp(L*U);
    disp("--------------------------------------");
end 


