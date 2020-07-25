

for i = 1:28
    i
  Xtrain = X(:,:);
  Ytrain = Y;
  Xtest = Xtrain(i,:);
  Ytest = Ytrain(i);
  Xtrain(i,:) = [];
  Ytrain(i) = [];
  [I, p, s] = find_p(Xtrain, Ytrain);
  H(i,:) = I(1:end);
end