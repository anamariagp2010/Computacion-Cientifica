function [yk,tk] = euler(f,t0,y0,h,n)
    yk = zeros(n,1);
    tk = zeros(n,1);
    
    yk(1) = y0;
    tk(1) = t0;
    
    for i = 1:n-1
        tk(i+1) = tk(i)+h;
        tmp = feval(f,tk(i),yk(i));
        yk(i+1) = yk(i) + (tmp*h);
    end 
end