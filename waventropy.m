function [went] = waventropy(data)
%========================================
%this function extracts entropy from each block of wavelet decomposition
%vector data
% Input -  data - vector - 1d Array
% C - consists of data  at levels - multires wavelet decomposition 
% S - consists of segment lengths at each level 
% Output - Entropy at each decomposition level
% Dependancies: Wavelet toolbox 
%========================================
[c s] = wavedec(data,3,'haar');
%Approximations level3
entropycA3 = entropy(c(1:s(1)));
%details level 3
entropycD3 = entropy(c(s(1)+1:s(1)+s(2)));
%details level 2
entropycD2 = entropy(c(s(1)+s(2)+1:s(1)+s(2)+s(3)));
%details level 1
entropycD1 = entropy(c(s(1)+s(2)+s(3)+1:s(1)+s(2)+s(3)+s(4)));
went = [entropycA3 entropycD3 entropycD2 entropycD1];
return;