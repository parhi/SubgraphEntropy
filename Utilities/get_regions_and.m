regions = 85;
r = 1;
index_and = [];
 for r1 = 1:regions
        for r2 = r1+1:regions
            if A(r1,r2) == 1
                index_and = [index_and r];
            end
        r = r+1;
        end
 end