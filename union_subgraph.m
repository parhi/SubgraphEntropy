%% This script is for extracting Intersection sub-graph entropy as described in 
% B. Sen, G.A. Bernstein, B.A. Mueller, K.R. Cullen and K.K. Parhi, 
%"Sub-Graph Entropy based Network Approaches for Classifying Adolescent Obsessive-Compulsive 
%Disorder from Resting-State Functional MRI," Neuroimage: Clinical, 20,
%Article 102208, 2020.
%% The input is X (Region X Region X Subjects), Y is labels, intersection sub-graph entropy
% in edge_feature
N = 475;
num_sig_regions = 25; %% Signifcant regions by running t-test.
num_subgraph_edges = 120; %% Significant edges from running predictiveSubgraph.m

[effect_edge] = edgeEntropy(X);
[Ie, p, s, r] = find_p(effect_edge, Y);
edge_ind_to_sub;

[effect_region] = nodeEntropy(X);
[Ir, p, s, r] = find_p(effect_region, Y);

 edge_feature = [effect_edge(:, I(1:120)), effect_region(:, I(1:num_sig_regions))];

clearvars -except edge_feature X Y
    
    
    
        
        

