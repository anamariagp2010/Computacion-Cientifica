function x = minimosCuadrados(t,b,orden)
    n = length(t);
    A = zeros(n,orden+1);
    %calcular matriz A
    for i = 1:orden+1
        A(:,i) = t.^(i-1);
    end
    L = chol(A'*A,'Lower');
    Ab = A'*b;
    % aplica "Ax=b", donde "A" = L, "x" = y, "b" = A'b
    y = solGaussInferior(L,Ab);
    % aplica "Ax=b", donde "A" = L', "x" = x, "b" = y
    x =solGaussSuperior(L',y); 
end
