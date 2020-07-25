regions = 85;
r = 1;
 for r1 = 1:regions
        for r2 = r1+1:regions
            sub(r,1) = r1;
            sub(r,2) = r2;
            ind(r) = r;
            r = r+1;
        end
 end