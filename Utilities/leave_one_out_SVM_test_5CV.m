features = size(X,2);
rI = randperm(28,28);
Yt = [];
Yta = [];
rng(1)
for i=1:5
    i
%   rI = randperm(28,28);
  if i == 1 
    Itest = rI(1:5); 
    Itrain = setdiff(rI, Itest); 
  elseif i == 2
    Itest = rI(6:10);
    Itrain = setdiff(rI, Itest); 
  elseif i == 3
    Itest = rI(11:16);
    Itrain = setdiff(rI, Itest);
  elseif i == 4
    Itest = rI(17:22);
    Itrain = setdiff(rI, Itest);  
  elseif i == 5
    Itest = rI(23:28);
    Itrain = setdiff(rI, Itest); 
  end
  Xtrain = X(Itrain,1:features);
  Ytrain = Y(Itrain);
  Xtest = X(Itest,1:features);
  Ytest = Y(Itest);
%   model = svmtrain(Ytrain, Xtrain,'-t 2 -g 0.05 -v 10');  
  model = svmtrain(Ytrain, Xtrain,'-t 2 -g 0.00015');  

  Ypredict = svmpredict(Ytest,Xtest, model);
  Yt = [Yt;Ypredict];
  Yta = [Yta;Ytest];
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

  mean(Yt == Yta)