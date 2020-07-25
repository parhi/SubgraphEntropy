clear X;
sub_regions = [2,3,4,5,11,12,13,14,19,28,30,42,53,62,64,76];
regions = 85;
p_l = 0.01:0.02:0.50;
for subject_ID = 1:28
    feature_ID = 1;
for i = 1:length(sub_regions)
    for j = i+1:length(sub_regions)
      L = find(sub(:,1)==sub_regions(i));
      k = find(sub(L,2)==sub_regions(j));
      X(subject_ID,feature_ID) = effect_edge(subject_ID,k);
      feature_ID = feature_ID+1;
    end
end
end