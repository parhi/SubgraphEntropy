function [Adj, node] = jsphere_old(A,s,d)
A = 1./A;
A(isinf(A)) = 0;

G = graph(A);
node = nearest(G, s, d, 'Method','unweighted');

node_n = [];

for i = 1:length(node)
    [P, dist] = shortestpath(G,s,node(i),'Method','unweighted');
     node_n = unique([P(end) node_n]);
end
node = unique([s node_n]);

G1 = subgraph(G, node);
Adj = full(adjacency(G1, 'weighted'));

Adj = 1./Adj;
Adj(isinf(Adj)) = 0;
end

