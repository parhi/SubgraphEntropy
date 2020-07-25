addpath /Users/bhaskarsen/Documents/MATLAB/228_OCD/OCD_code
cd /Users/bhaskarsen/Documents/MATLAB/228_OCD
D = dir;

for i = 32:32
    i
clearvars -except i D 
X = zeros(85,599);
f = strcat('/Users/bhaskarsen/Documents/MATLAB/228_OCD/',D(i).name);
cd(f)
data = strcat(D(i).name,'scrubbed.mat');
load(data)
meanROI = meanROI - mean(meanROI,2)*ones(1,size(meanROI,2));
T = readtable('reject_file.txt');
T = [0;T.x1];
T = 1-T;
ind = 1;
size(X)
for j=1:599
    if T(j)>0
    X(:,j) = meanROI(:,ind);
    ind = ind+1;
    end
end
X = X';
[b,a] = cheby1(20,10,0.26);
Y = filter(b,a,X);
X = Y(22:end,:);
save filterdata.mat X
end