load('phenotype_OCD.mat')
phenotype_OCD(25,:) = [];
for i =  1:28
    i
    
    f = strcat('/Users/bhaskarsen/Documents/MATLAB/228_OCD/',num2str(phenotype_OCD(i,1)));
    cd(f);
    load('filterdata.mat');
%     data(:,:,i) = corrcoef(X);
    data(:,:,i) = X;
    Y(i) = phenotype_OCD(i,2);
    P(i) = phenotype_OCD(i,1);
end