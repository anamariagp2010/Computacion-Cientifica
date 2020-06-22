%{
    Entrada: vector columna x de tamaño n
             vector columna y de tamaño n

    Salida: matriz X de tamaño 2*n-1 donde cada columna
            representa los valores de la pendiente y la 
            intercepción de las rectas formadas por los puntos
            (x(i),y(i)) y (x(i+1),y(i+1)) donde i va de 
            uno hasta n-1
%}

function X = interTrozos(x,y)
    n = length(x);
    X = zeros(2,n-1);

    for i = 1:n-1
        
        m = (y(i+1) - y(i))/(x(i+1) - x(i));
        b = y(i) - m*x(i);
        
        X(1,i) = m;
        X(2,i) = b;
        
    end
       
end


