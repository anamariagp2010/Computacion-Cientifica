function [yk,tk] = RK4(f,t0,y0,h,n)
    yk = zeros(n,1);
    tk = zeros(n,1);
    
    yk(1) = y0;
    tk(1) = t0;
    
    for i = 1:n-1
        tk(i+1) = tk(i)+h;
        k1 = (feval(f,tk(i),yk(i))*h);
        k2 = (feval(f,tk(i)+(h/2),yk(i)+(k1/2))*h);
        k3 = (feval(f,tk(i)+(h/2),yk(i)+(k2/2))*h);
        k4 = (feval(f,tk(i)+h,yk(i)+k3)*h);
        yk(i+1) = yk(i) + ((1/6)*(k1+(2*k2)+(2*k3)+k4));
    end 
end