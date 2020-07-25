function [accuracy_val, specificity_val, sensitivity_val, sub_graph] = leave_one_out_SVM_func(X, Y, features)
features = size(X,2);
for i=1:size(X,1)
    i
  Xtrain = X(:,1:features);
  Ytrain = Y;
  Xtest = Xtrain(i,:);
  Ytest = Ytrain(i);
  Xtrain(i,:) = [];
  Ytrain(i) = [];
%   model = svmtrain(Ytrain, Xtrain,'-t 2 -g 0.05 -v 10');  
  model = svmtrain(Ytrain, Xtrain,'-t 2 -g 0.0005');  

  Ypredict(i) = svmpredict(Ytest,Xtest, model);
end

  accuracy_val = mean(Ypredict'==Y);
  specificity_val = 1-sum(Ypredict(find(Y==0)))/(length(Y)-sum(Y));
  
  sensitivity_val = sum(Ypredict(find(Y==1)))/sum(Y);
  sub_graph = [1:120];
end
