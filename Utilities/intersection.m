sub_regions = [2,3,4,5,11,12,13,14,19,28,30,42,53,62,64,76];
regions = 85;

A_entropy = zeros(85,85);
A_cstm = zeros(85,85);
% for i = 1:280
%     A_entropy(sub(I(i),1),sub(I(i),2)) = 1;
%     A_entropy(sub(I(i),2),sub(I(i),1)) = 1;
% % end
% for i = 1:450
%     A_entropy(sub(I(i),1),sub(I(i),2)) = 1;
%     A_entropy(sub(I(i),2),sub(I(i),1)) = 1;
% end

for i = 1:120
    A_entropy(sub(I(i),1),sub(I(i),2)) = 1;
    A_entropy(sub(I(i),2),sub(I(i),1)) = 1;
end
for i = 1:length(sub_regions)
    for  j = i+1:length(sub_regions)
        A_cstm(sub_regions(i),sub_regions(j)) = 1;
        A_cstm(sub_regions(j),sub_regions(i)) = 1;
    end
end
    