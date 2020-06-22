function [yk,tk] = dif_finitas(f,a,b,alpha,beta,n)
    h = (b-a)/(n-1);
    yk = zeros(n,1);
    tk = (a:h:b);
    
    yk(1) = alpha;
    yk(n) = beta;
    
    A = zeros(n-2,n-2);
    d = zeros(n-2,1);
    
    A(1,1) = -2;
    A(1,2) = 1;
    
    A(n-2,n-3) = 1;
    A(n-2,n-2) = -2;
    
    d(1) = (feval(f,tk(2))*h^2)- yk(1);
    d(n-2) = (feval(f,tk(n-1))*h^2)- yk(n);
    for i = 2:n-3
        d(i) = (feval(f,tk(i+1))*h^2);
        A(i,i-1) = 1;
        A(i,i) = -2;
        A(i,i+1) = 1;
    end
    tmp = solGaussJordan(A,d);
    yk(2:n-1) = tmp'; 
    tk = tk';
end