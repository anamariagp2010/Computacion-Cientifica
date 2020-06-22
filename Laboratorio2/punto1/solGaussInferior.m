function X = solGaussInferior(A,b)
    %Funcion hecha por Andres Delgado y Ana Garcia en el laboratorio 1
    if det(A) ~= 0
        n = length(A);
        i = 2;

        X = zeros(n,1);
        X(1) = b(1)/A(1,1);

        while i <= n
            Sum = 0;
            for j = 1:i-1
                Sum = Sum + A(i,j)*X(j);
            end
            X(i) = (b(i)- Sum)/A(i,i); 
            i= i+1;
        end
    else 
       disp('El sistema no tiene solucion')    

    end
	
end
