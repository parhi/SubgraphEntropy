features = size(X,2);
for i=1:28
    i
  Xtrain = X(:,1:features);
  Ytrain = Y;
  Xtest = Xtrain(i,:);
  Ytest = Ytrain(i);
  Xtrain(i,:) = [];
  Ytrain(i) = [];
  MdlLinear = fitcdiscr(Xtrain,Ytrain);
  Ypredict(i) = predict(MdlLinear,Xtest);
end

  fprintf('Accuracy ')
  mean(Ypredict'==Y)

  
  fprintf('\n Specificity ')
  1-sum(Ypredict(find(Y==0)))/(length(Y)-sum(Y))
  
  fprintf('\n Sensitivity ')
  sum(Ypredict(find(Y==1)))/sum(Y)
