function [yk,tk] = multipaso4(f,t0,y0,h,n)
    yk = zeros(n,1);
    tk = zeros(n,1);
    
    yk(1) = y0;
    tk(1) = t0;
    
    for i = 1:n-1
        tk(i+1) = tk(i)+h;
        tmp =feval(f,tk(i),yk(i));
        tmp2 = [0,0,0];
        j = i-1;
        z = 1;
        while (j > 0 && z < 4)
            tmp2(z) = feval(f,tk(j),yk(j));
            j = j-1;
            z = z+1;
        end
        yk(i+1) = yk(i) + ((1/24)*((55*tmp)- (59*tmp2(1))+(37*tmp2(2))-(9*tmp2(3)))*h);
    end 
end