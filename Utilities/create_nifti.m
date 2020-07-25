addpath(genpath('/Users/bhaskarsen/Documents/MATLAB/228_OCD/36714'))
I = load_untouch_nii('freesurfer_space.nii');
T = readtable('free_surfer.xlsx');
k = unique(I.img(:));
l=1;
for i = 1:length(k)
    if(ismember(k(i),T.Color))
        ind = find(I.img(:) == k(i));
        I.img(ind) = r1(l);
        l = l+1;
    else
        ind = find(I.img(:) == k(i));
        I.img(ind) = 0;
    end
        
end

