features = size(X,2);
% rI = randperm(28,28);
rng(1)
for i=1:30
    i
  rI = randperm(28,28);  
  Xtrain = X(rI(1:23),1:features);
  Ytrain = Y(rI(1:23));
  Xtest = X(rI(23:28),1:features);
  Ytest = Y(rI(23:28));
%   model = svmtrain(Ytrain, Xtrain,'-t 2 -g 0.05 -v 10');  
  model = svmtrain(Ytrain, Xtrain,'-t 2 -g 0.0007');  

  Ypredict = svmpredict(Ytest,Xtest, model);
  Ymean(i) = mean(Ypredict==Ytest);
  YSpecificity(i) = 1-sum(Ypredict(find(Ytest==0)))/(length(Ytest)-sum(Ytest));
  YSensitivity(i) = sum(Ypredict(find(Ytest==1)))/sum(Ytest);
end
YSensitivity(find(isnan(YSensitivity))) = 1;
YSpecificity(find(isnan(YSpecificity))) = 1;
  fprintf('Accuracy ')
  mean(Ymean)

  
  fprintf('\n Specificity ')
  mean(YSpecificity)
  
  fprintf('\n Sensitivity ')
  mean(YSensitivity)
