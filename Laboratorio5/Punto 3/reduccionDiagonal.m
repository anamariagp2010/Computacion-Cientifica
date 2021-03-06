%{
    Entrada: -matriz cuadrada A de n*n 
             -vector b de n filas 

    Salida: - Matriz A reducida a una Matriz 
            diagonal mediante un proceso
            sucesivo de pre-multiplicacion por matrices de
            eliminación M.

            - vector b resultante despues de varias
            pre-multiplicaciones por matrices de
            eliminación M.
%}


function [A,b] = reduccionDiagonal(A,b)
    n = length(A);
	i = 1;
	while i <= n
        % se construye la matriz M de eliminación
		M = eye(n,n);
		pivote = A(i,i);
		if pivote ~= 0
            
            % se obtienen los números bajo el pivote
            % de la matriz de eliminación
			col = zeros(n-i,1);
			k = i;
			for j = 1:length(col)
				col(j) = (A(k+1,i)/pivote)*-1;
				k = k+1;
			end
			M(i+1:n,i) = col;
            
            % se obtienen los números sobre el pivote
            % de la matriz de eliminación
            
            col = zeros(i-1,1);
			k = i;
			for j = length(col):-1:1
				col(j) = (A(k-1,i)/pivote)*-1;
				k = k-1;
            end
			M(1:i-1,i) = col;
            
            %se multiplica A y b por la matriz de eliminacion M
			A = M*A;
			b = M*b;
       
			i=i+1;
        else
            % se busca un nuevo pivote para permutar
            tmp = i+1;
            while tmp <= n & pivote == 0
                pivote = A(tmp,i);
                tmp = tmp+1;
            end
            if pivote == 0
                disp('El sistema no tiene solución')
                i = n;
            else
                % se permuta
                A([i tmp],:) = A([tmp i],:)
                b([i tmp]) = b([tmp i])
            end
        end	
	end

end