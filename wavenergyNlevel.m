function [we] = wavenergyNlevel(data,NL,wname)
%=========================================
%this function extracts energy from each block of wavelet decomposition
%vector
% Input :- data vector,  number of levels of decomposition to be used,
% wavelet name 
% Output:- energies of decomposed signal - wavelet coefficients at the 
% specified levels 
%=========================================
[c,s] = wavedec(data,NL,wname);
%Approximations level3
sumcA3 = sum(c(1:s(1)).^2);
%details level 3
startinx = s(1);
for lx = 1:NL
sumcD(lx) = sum(c(startinx+1:startinx+s(lx+1)).^2);
startinx = startinx+s(lx+1);
end
%details level 2
% sumrcD2 = sum(c(s(1)+s(2)+1:s(1)+s(2)+s(3)).^2);
%details level 1
% sumcD1 = sum(c(s(1)+s(2)+s(3)+1:s(1)+s(2)+s(3)+s(4)).^2);
we = [sumcA3 sumcD];
return;
