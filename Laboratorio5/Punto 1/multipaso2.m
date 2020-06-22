function [yk,tk] = multipaso2(f,t0,y0,h,n)
    yk = zeros(n,1);
    tk = zeros(n,1);
    
    yk(1) = y0;
    tk(1) = t0;
    
    for i = 1:n-1
        tk(i+1) = tk(i)+h;
        tmp =feval(f,tk(i),yk(i));
        tmp2 = 0;
        if (i > 1)
            tmp2 = feval(f,tk(i-1),yk(i-1));
        end
        yk(i+1) = yk(i) + ((1/2)*((3*tmp)- tmp2)*h);
    end 
end