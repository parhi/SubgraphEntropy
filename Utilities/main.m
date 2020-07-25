%% create data
% load('language_static');
% load('labels')
% Y = Y(randperm(475,475));
clear all
load('OCD_data_wavefilt.mat')
corr_filter
clearvars -except X Y
load label
for i = 1:28
    [data(:,i)] = extract_upper_triangle(X(:,:,i));
end
data(find(isnan(data))) = 0;
X = data';
% Y = Y';

num_fold = 28;

for i = 1:num_fold
    i
        X_train = X([1:i-1,i+1:28],:);
        Y_train = Y([1:i-1,i+1:28])';
    
        X_test = X(i,:);
        Y_test = Y(i)';
        X_train_mean = mean(X_train,1);
        X_train = X_train - ones(size(X_train,1),1)*X_train_mean;
        X_test = X_test - ones(size(X_test,1),1)*X_train_mean;
    
        Y_train_mean = mean(Y_train,1);
        Y_train = Y_train - Y_train_mean;
        Y_test = Y_test - Y_train_mean;
        [XL,YL,XS,YS,BETA,PCTVAR,MSE] = plsregress(X_train,Y_train,10,'cv',5);
        Y_pred = X_test*BETA(2:end,:);
        Y_pred(find(Y_pred>0)) = 1;
        Y_pred(find(Y_pred<=0)) = 0;
    
        Y_test(find(Y_test>0)) = 1;
        Y_test(find(Y_test<=0)) = 0;
    
        cv_acc(i) = mean(Y_pred==Y_test);
        Y_p(i) = Y_pred;
   

end
mean(cv_acc)


    
    
    
    
