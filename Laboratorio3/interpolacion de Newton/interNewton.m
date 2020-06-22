%{
    Entrada: vector columna t de tamaño n
             vector columna b de tamaño n

    Salida: vector columna X de tamaño n
            que es la aproximacion de la 
            solucion del sistema
%}

function X = interNewton(t,b)
    n = length(t);
    A = zeros(n,n);
    A(:,1) = ones(n,1);
    for i = 2:n
        tmp = 1;
        for j = 1:i-1
           tmp = tmp*(t(i)-t(j));
           A(i,j+1)= tmp;
        end
    end
    
    X = solGaussInferior(A,b);
    

    
end
