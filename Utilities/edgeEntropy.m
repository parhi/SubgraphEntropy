%% This script is for extracting edge entropy as described in 
% B. Sen, S.-H. Chu and K.K. Parhi, "Ranking Regions, Edges and Classifying Tasks in 
% Functional Brain Graphs by Sub-Graph Entropy," Scientific Reports, Vol. 9, Article 7628, 
% May 2019.
% The input is X (Region X Region X Subjects), output edge entropy
% in effect_edge
function [effect_edge] = edgeEntropy(X)
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
end
% clear effect_region;
% save gambling_emotion_edge_entropy.mat