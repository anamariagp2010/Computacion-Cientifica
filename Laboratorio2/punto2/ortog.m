function [A,b] = ortog(A,b)
    %Calcular el numero de filas y columnas de A
    [filas,cols] = size(A);
    for i = 1:cols
        %recorre cada columna, guardando su resultado en a y agregando 0s
        %en la parte superior de i
       a = zeros(filas,1);
       a(i:filas) = A(i:filas,i);
       e = zeros(filas,1);
       e(i) = 1;
       norma = norm(a);
       if(a(i)<0) 
           norma = (-1)*norma;
       end
       v = a - (norma*e);
       ident = eye(filas);
       H = ident - ((2*v*v')/(v'*v));
       A = H*A;
       b = H*b;
       
    end
    %Colocar A cuadrada
    A = A(1:cols,:);
    b = b(1:cols);

end