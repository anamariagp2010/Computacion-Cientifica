function [yk,tk] = elem_finitos(f,a,b,alpha,beta,n)
    h = (b-a)/(n-1);
    yk = zeros(n,1);
    tk = (a:h:b);
    
    yk(1) = alpha;
    yk(n) = beta;
    
    A = zeros(n,n);
    d = zeros(n,1);

    for i = 1:n
        A(1,i) = yk(1)^(i-1);
        A(2,i) = yk(n)^(i-1);
        d(1) = yk(1);
        d(2) = yk(n);
    end
    for j = 3:n
        coef = 2;
        for i = 3:n
            A(j,i) = (coef*(i-2))*(tk(j-1)^(i-3));
            coef = coef +1;
            
        end
        d(j) = feval(f,tk(j-1));
    end
    tmp = solGaussJordan(A,d);
    
    for i = 2:n-1
        for j = 0:n-1
            yk(i) = yk(i) + (tmp(j+1)*(tk(i)^(j)));    
        end 
    end
    tk = tk';
end