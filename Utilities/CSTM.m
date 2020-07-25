sub_regions = [2,3,4,5,11,12,13,14,19,28,30,42,53,62,64,76];
regions = 85;
p_l = 0.01:0.02:0.50;

% for i = 1:length(regions)
%     for j = i+1:length(regions)
%       L = find(sub(:,1)==regions(i));
%       k = find(sub(L,2)==regions(j));
for k = 1:28
A = squeeze(X(:,:,k));
   
for j = 1:length(p_l)
    Adj = threshold_proportional(A,p_l(j));
    degree(j) = log(regions)/log(mean(degrees_und(Adj)));
end
[c, index] = min(abs(degree-1.8));
A = threshold_proportional(A, p_l(index));
index = 1;
for i = 1:length(sub_regions)
    for j = i+1:length(sub_regions)
        e(index) = A(sub_regions(i),sub_regions(j));
        index = index+1;
    end
end
    e(find(e==0)) = 1;
    e = e/sum(e);
    sub_graph(k) = -sum(e.*log(e))/log(2);
end