clearvars -except X Y effect_region_1
%% Assume that data is stored in X
num_subjects = size(X,3);
regions = size(X,1);
effect_region = zeros(num_subjects,regions);
p = 0.01:0.02:0.50;
for i = 1:num_subjects
    i
    A = squeeze(X(:,:,i));
   
    for j = 1:length(p)
        Adj = threshold_proportional(A,p(j));
        degree(j) = log(regions)/log(mean(degrees_und(Adj)));
    end
    [c, index] = min(abs(degree-1.8));
    A = threshold_proportional(A, p(index));
    for r = 1:regions
        [Adj] = jsphere_old(A,r,1);
        Adj = Adj/(sum(Adj(:)));
        Adj(isnan(Adj)) = 1;
        Adj(find(Adj==0)) = 1;
        effect_region(i,r) = -(0.5)*sum(Adj(:).*log(Adj(:)))/log(2);
    end
end
    