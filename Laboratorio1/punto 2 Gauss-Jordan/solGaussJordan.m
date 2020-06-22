%{
    Entrada: matriz cuadrada A de n*n 
             vector b de n filas 

    Salida: vector X de n filas 
            que es la solución del sistema AX = b
%}


function X = solGaussJordan(A,b)
    if det(A) ~= 0
        n = length(A);
        % se reduce a A a una matriz diagonal
        [A,b] = reduccionDiagonal(A,b);
        %{ 
            se calcula la solución con la formula iterativa
            vista en clase
        %}
        
        i = 1;
        X = zeros(n,1);
        
        while i <= n
            X(i) = b(i)/A(i,i);
            i = i+1;
        end
      
    else
        disp('El sistema no tiene solucion') 
    end
end
