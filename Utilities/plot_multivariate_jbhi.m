for i=1:length(Y)
    ind = 1
    for j = 0.05:0.15:0.50
        A = threshold_proportional(X(:,:,i), j);
        A(find(A~=0)) = 1;
        C = clustering_coef_bu(A);
        CC_put(i,ind) = C(4);
        CC_cing(i,ind) = C(39);
        
        BC = betweenness_bin(A);
        BC_put(i,ind) = BC(4);
        BC_cing(i,ind) = BC(39);
        ind = ind+1
    end
end
        
        