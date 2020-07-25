p_l = 0.01:0.02:0.50;

for k = 1:28
    A = squeeze(X(:,:,k));
   
    for j = 1:length(p_l)
        Adj = threshold_proportional(A,p_l(j));
        degree(j) = log(regions)/log(mean(degrees_und(Adj)));
    end
    [c, index] = min(abs(degree-1.8));
    A = threshold_proportional(A, p_l(index));
    for i = 1:120
        r1 = sub(I(i),1);
        r2 = sub(I(i),2);
        e(i) = A(r1,r2);
        
    end
    e(find(e==0)) = 1;
    e = e/sum(e);
    sub_graph(k) = -sum(e.*log(e))/log(2);
end
    