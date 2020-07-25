function [Adj, node] = jksphere(A,s,t,d)
A = 1./A;
A(isinf(A)) = 0;

G = graph(A);
node_1 = nearest(G, s, d, 'Method','unweighted');
node_2 = nearest(G, t, d, 'Method','unweighted');
node_n_1 = [];
node_n_2 = [];

for i = 1:length(node_1)
    [P, dist] = shortestpath(G,s,node_1(i),'Method','unweighted');
     node_n_1 = unique([P(end) node_n_1]);
end
for i = 1:length(node_2)
    [P, dist] = shortestpath(G,t,node_2(i),'Method','unweighted');
     node_n_2 = unique([P(end) node_n_2]);
end

node = unique([s t node_n_1 node_n_2]);

G1 = subgraph(G, node);
%Adj = full(adjacency(G1, 'weighted'));
Adj = G1.Edges.Weight;
Adj = 1./Adj;
Adj(isinf(Adj)) = 0;
end

