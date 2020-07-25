function [I, p, s, r,effect_region1,effect_region2,std1,std2] = find_p(effect_region, Y)
effect_region1 = mean(effect_region(find(Y==0),:),1);
std1 = std(effect_region(find(Y==0),:),[],1);
effect_region2 = mean(effect_region(find(Y==1),:),1);
std2 = std(effect_region(find(Y==1),:),[],1);
effect_region_n = abs(effect_region1-effect_region2);
r = effect_region1-effect_region2;
[s, I] = sort(effect_region_n, 'descend');
[h, p] = ttest2(effect_region(find(Y==0),:), effect_region(find(Y==1),:));
p = p(I);
length(p)
end

