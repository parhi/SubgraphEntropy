clearvars -except X Y 
% addpath /home/senxx056/Documents/MATLAB/BCT
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
    r = 1;
    for r1 = 1:regions
        for r2 = r1+1:regions
        [Adj] = jksphere(A,r1,r2,1);
        Adj = Adj/(sum(Adj(:)));
        Adj(isnan(Adj)) = 1;
        Adj(find(Adj==0)) = 1;
        effect_region(i,r) = -sum(Adj(:).*log(Adj(:)))/log(2);
        r = r+1;
        end
    end
end    
effect_edge = effect_region;
% clear effect_region;
% save gambling_emotion_edge_entropy.mat