function [meanROI] = mean_ROI(I_l,mask_l,L)
 for i = 1:85
     i
     ind = find(mask_l==L(i));
     s(i) = length(ind);
     n = sum(I_l(ind,:),2);
     meanROI(i,:) = sum(I_l(ind,:))/length(find(n~=0));
 end