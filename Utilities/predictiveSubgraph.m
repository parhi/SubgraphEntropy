%% This script is for extracting Intersection sub-graph entropy as described in 
% B. Sen, G.A. Bernstein, B.A. Mueller, K.R. Cullen and K.K. Parhi, 
%"Sub-Graph Entropy based Network Approaches for Classifying Adolescent Obsessive-Compulsive 
%Disorder from Resting-State Functional MRI," Neuroimage: Clinical, 20,
%Article 102208, 2020.
% Input X (Region X Region X Subjects), Y is labels, features is number of
% edges to be tested.
% Output accuracy, specificity, sensitivity, sub-graph edges.
function [accuracy_val, specificity_val, sensitivity_val, sub_graph] = predictiveSubgraph(X, Y, features)

[X] = edgeEntropy(X);
num_subjects = size(X, 3);
[effect_edge] = edgeEntropy(X);
[I, p, s, r] = find_p(effect_edge, Y);
X = X(:, I(1:features));
for i=1:num_subjects
%   Uncomment for testing the model
%   [I, p, s, r] = find_p(effect_edge, Y);
%   X = X(:, I(1:features));
  Xtrain = X(:,1:features);
  Ytrain = Y;
  Xtest = Xtrain(i,:);
  Ytest = Ytrain(i);
  Xtrain(i,:) = [];
  Ytrain(i) = [];
%   model = svmtrain(Ytrain, Xtrain,'-t 2 -g 0.05 -v 10');  
  model = svmtrain(Ytrain, Xtrain,'-t 2 -g 0.0000979');  %% Change this parameter.
  Ypredict(i) = svmpredict(Ytest,Xtest, model);
end

accuracy_val = mean(Ypredict'==Y);
specificity_val = 1-sum(Ypredict(find(Y==0)))/(length(Y)-sum(Y));
sensitivity_val = sum(Ypredict(find(Y==1)))/sum(Y);
sub_graph = I(1:features);
end 