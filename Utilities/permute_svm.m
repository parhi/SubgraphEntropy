% Yac = Y;

for m = 1:1000
    m
  id = randsample(28,28);
  Y = Yac(id);   
  leave_one_out_SVM;
  acc(m) = mean(Ypredict'==Y);
end