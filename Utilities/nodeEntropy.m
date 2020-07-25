%% This script is for extracting edge entropy as described in 
% B. Sen, S.-H. Chu and K.K. Parhi, "Ranking Regions, Edges and Classifying Tasks in 
% Functional Brain Graphs by Sub-Graph Entropy," Scientific Reports, Vol. 9, Article 7628, 
% May 2019.
% The input is X (Region X Region X Subjects), output node entropy
% in effect_region

function [effect_region] = nodeEntropy(X)
num_subjects = size(X,3);
regions = size(X,1);
effect_region = zeros(num_subjects,regions);
p = 0.01:0.02:0.50;
for i = 1:num_subjects
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
end    