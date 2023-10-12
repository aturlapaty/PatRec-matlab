function sm = imstatmeasure(image)
%this function extracts statistical features of an image.
%====================================================
% input - image 
% output - [meanim, secmnt, skew, kurt]
% mean, second moment, skewness and kurtosis
%====================================================
N = size(image);
%mean
meanim = mean(image(:));
%variance
secmnt = var(image(:));
%third moment or skewness;
skew = skewness(image(:));
%fourth moment or kurtosis;
kurt = kurtosis(image(:));
sm = [meanim,secmnt,skew,kurt];
return;