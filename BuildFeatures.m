function [idata,targetvec] = BuildFeatures(dirname)
%--------------------------------------------------------------------------
%input 
% dirname: The directory containing the sub-directories of images
% each sub-directory should contain only one class of images and
% should start with the letters 'cat' (or change the letters in the first
% line of the code)
%--------------------------------------------------------------------------
%output
% idata: The feature matrix
% The rows of this matrix contain the feature vectors corresponding to
% individual images.
% targetvec: The target vector containing the class numbers
% These class numbers are derived from the folder numbers
%--------------------------------------------------------------------------
dirname1 = strcat(dirname,'cat*');
dnames = dir(dirname1);
Ld = size(dnames);
count = 0;
for dinx = 1:Ld
%      dinx;
    clear files;
     dname1 = strcat(dirname,dnames(dinx).name,'\*.bmp');
     files = dir(dname1);
L = length(files);
for ix =  1:L 
clear  I11;
count = count + 1;
targetvec(count) = dinx;
fname = fullfile(dirname,dnames(dinx).name,'\',files(ix).name);
I11 = imread(fname);
idatavec = FeatureCompute_1(I11);
idata(count,:) = idatavec(:)';
end
end
  return; 