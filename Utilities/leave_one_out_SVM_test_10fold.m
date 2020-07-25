rng(10)
features = size(X,2);
for i=1:5
    i
  rI = randperm(28,28);  
  Xtrain = X(rI(1:18),1:features);
  Ytrain = Y(rI(1:18));
  Xtest = X(rI(19:28),1:features);
  Ytest = Y(rI(19:28));
%   model = svmtrain(Ytrain, Xtrain,'-t 2 -g 0.05 -v 10');  
%   model = svmtrain(Ytrain, Xtrain,'-t 2 -g 0.00207');  
 model = svmtrain(Ytrain, Xtrain,'-t 2 -g 0.002'); 
  Ypredict = svmpredict(Ytest,Xtest, model);
  Ymean(i) = mean(Ypredict==Ytest);
  YSpecificity(i) = 1-sum(Ypredict(find(Ytest==0)))/(length(Ytest)-sum(Ytest));
  YSensitivity(i) = sum(Ypredict(find(Ytest==1)))/sum(Ytest);
end

  fprintf('Accuracy ')
  mean(Ymean)

  
  fprintf('\n Specificity ')
  mean(YSpecificity)
  
  fprintf('\n Sensitivity ')
  mean(YSensitivity)
