features = size(X,2);
num_trees = 1000;
for i=1:28
    i
  Xtrain = X(:,1:features);
  Ytrain = Y;
  Xtest = Xtrain(i,:);
  Ytest = Ytrain(i);
  Xtrain(i,:) = [];
  Ytrain(i) = [];
  B = TreeBagger(num_trees,Xtrain,Ytrain);
  Yfit = predict(B,Xtest);
  for k = 1:size(Ytest)
    Ypredict(k) = str2num(cell2mat(Yfit(k)));
  end
 
end
  fprintf('Accuracy ')
  mean(Ypredict'==Y)

  
  fprintf('\n Specificity ')
  1-sum(Ypredict(find(Y==0)))/(length(Y)-sum(Y))
  
  fprintf('\n Sensitivity ')
  sum(Ypredict(find(Y==1)))/sum(Y)
