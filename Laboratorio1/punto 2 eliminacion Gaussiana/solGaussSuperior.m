%{
    Entrada: matriz cuadrada A de n*n 
             vector b de n filas 

    Salida: vector X de n filas 
            que es la solución del sistema AX = b
%}

function X = solGaussSuperior(A,b)
    if det(A) ~= 0
        n = length(A);
        % se transforma a A en una matriz triangular superior
        [A,b] = triangularSuperior(A,b);
        %{ 
            se calcula la solución con la formula iterativa
            vista en clase
        %}
        i = n-1;
        X = zeros(n,1);
        X(n) = b(n)/A(n,n);

        while i > 0
            Sum = 0;
            for j = i+1:n
                Sum = Sum + A(i,j)*X(j);
            end
            X(i) = (b(i)- Sum)/A(i,i); 
            i= i-1;
        end
    else
        disp('El sistema no tiene solucion') 
    end
end
