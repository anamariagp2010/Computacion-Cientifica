function [yk,tk] = RK2(f,t0,y0,h,n)
    yk = zeros(n,1);
    tk = zeros(n,1);
    
    yk(1) = y0;
    tk(1) = t0;
    
    for i = 1:n-1
        tk(i+1) = tk(i)+h;
        k1 = (feval(f,tk(i),yk(i))*h);
        k2 = (feval(f,tk(i)+h,yk(i)+k1)*h);
        yk(i+1) = yk(i) + ((1/2)*(k1+k2));
    end 
end