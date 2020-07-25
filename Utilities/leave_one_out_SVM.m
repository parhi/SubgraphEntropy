features = 120;
for i=1:28
    i
  Xtrain = X(:,1:features);
  Ytrain = Y;
  Xtest = Xtrain(i,:);
  Ytest = Ytrain(i);
  Xtrain(i,:) = [];
  Ytrain(i) = [];
%   model = svmtrain(Ytrain, Xtrain,'-t 2 -g 0.05 -v 10');  
  model = svmtrain(Ytrain, Xtrain,'-t 2 -g 0.0000979');  

  Ypredict(i) = svmpredict(Ytest,Xtest, model);
end

  fprintf('Accuracy ')
  mean(Ypredict'==Y)

  
  fprintf('\n Specificity ')
  1-sum(Ypredict(find(Y==0)))/(length(Y)-sum(Y))
  
  fprintf('\n Sensitivity ')
  sum(Ypredict(find(Y==1)))/sum(Y)
