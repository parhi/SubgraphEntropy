%% This script is for extracting Intersection sub-graph entropy as described in 
% B. Sen, G.A. Bernstein, B.A. Mueller, K.R. Cullen and K.K. Parhi, 
%"Sub-Graph Entropy based Network Approaches for Classifying Adolescent Obsessive-Compulsive 
%Disorder from Resting-State Functional MRI," Neuroimage: Clinical, 20,
%Article 102208, 2020.
% Input X (Region X Region X Subjects), Y is labels, features is number of
% edges to be tested.
% Output accuracy, specificity, sensitivity, sub-graph edges.
function [accuracy_val, specificity_val, sensitivity_val, sub_graph] = predictiveSubgraph(X, Y, features)


num_subjects = size(X, 3);
[effect_edge] = edgeEntropy(X);
% effect_edge = X;
[I, p, s, r] = find_p(effect_edge, Y);
X = effect_edge(:,I(1:120));

[accuracy_val, specificity_val, sensitivity_val, sub_graph] = leave_one_out_SVM_func(X, Y, features);

sub_graph = I(1:features);
end 