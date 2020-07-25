This project consists of files to implement node entropy, edge entropy,
predicitive sub-network, intersection sub-graph and union sub-graph as mentioned in 

1. B. Sen, S.-H. Chu and K.K. Parhi, "Ranking Regions, Edges and Classifying Tasks in Functional Brain Graphs by Sub-Graph Entropy," 
Scientific Reports, Vol. 9, Article 7628, May 2019.

2. B. Sen, G.A. Bernstein, B.A. Mueller, K.R. Cullen and K.K. Parhi, "Sub-Graph Entropy based Network Approaches for Classifying Adolescent Obsessive-Compulsive Disorder from Resting-State Functional MRI," 
Neuroimage: Clinical, 20, Article 102208, 2020.

You need to add a few more dependecies 

1. LibSVM available from https://www.csie.ntu.edu.tw/~cjlin/libsvm/
2. BCT Toolbox from https://sites.google.com/site/bctnet/

Add all the folders and then run the scripts.  

addpath(genpath('../MATLAB/BCT'))
addpath(genpath('../MATLAB/LIBSVM/matlab'))
addpath(genpath('../MATLAB/GraphEntropy'))