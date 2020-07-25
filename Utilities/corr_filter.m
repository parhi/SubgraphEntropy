for i = 1:size(data_low,3)
    X(:,:,i) = corrcoef(data_low(:,:,i));
end