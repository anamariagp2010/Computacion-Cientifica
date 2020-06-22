%{
    Entrada: vector columna t de tamaño n
             vector columna b de tamaño n

    Salida: vector columna X de tamaño n
            que es la aproximacion de la 
            solucion del sistema
%}

function X = interMono(t,b)
   
    n = length(t);
    A = ones(n,n);
    for i = 1:n-1
        A(:,i+1) = t.^i;
    end
    
    
    L = chol(A'*A,'Lower');
    
    y = solGaussInferior(L,A'*b);
    
    X = solGaussSuperior(L',y);
    
end
