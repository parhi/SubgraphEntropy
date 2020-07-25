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

 
for j = 1:N
    m = 1;
    for i=1:num_subgraph_edges
        if length(find(sub(Ie(i),1)==Ir(1:num_sig_regions)))>0||length(find(sub(Ie(i),2)==Ir(1:num_sig_regions)))>0
            edge_feature(j,m) = effect_edge(j,Ie(i));
            m = m+1;
        end
    end
end

edge_feature = [edge_feature, effect_region(:, I(1:num_sig_regions))];

clearvars -except edge_feature X Y
    
    
    
        
        

