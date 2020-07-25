addpath /Users/bhaskarsen/Documents/MATLAB/228_OCD/OCD_code
cd /Users/bhaskarsen/Documents/MATLAB/228_OCD
addpath /Users/bhaskarsen/Documents/MATLAB/fMRI_info
D = dir;
T = readtable('free_surfer_modified.xlsx');
L = double(T.Color);
for i = 4:32
    clearvars -except D i L
    I = load_untouch_nii(strcat('/Users/bhaskarsen/Documents/MATLAB/228_OCD/',D(i).name,'/denoised_data_scrubbed.nii'));
    mask = load_untouch_nii(strcat('/Users/bhaskarsen/Documents/MATLAB/228_OCD/',D(i).name,'/freesurfer_space.nii'));
    I_l = reshape(I.img,106*106*60,size(I.img,4));
    mask_l = reshape(mask.img,106*106*60,1);
    [meanROI] = mean_ROI(double(I_l),double(mask_l), L);
    sf = strcat(D(i).name,'scrubbed.mat');
    cd(strcat('/Users/bhaskarsen/Documents/MATLAB/228_OCD/',D(i).name));
    save(sf , 'meanROI');
end
    