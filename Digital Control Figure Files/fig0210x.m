%  Figure 2.10a     Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab 4.2 or 5.0
%  Example of rlocfind usage as in Example 2.2

clear
clf
numD=[1 3];
denD=[1 10];
numG=[10];
denG=[1 2 0];
num=conv(numD,numG);
den=conv(denD,denG);
rlocus(num,den)
axis([-6 6 -6 6])
axis('square')
title('Fig. 2.10(a) Root locus to find gain')
K=rlocfind(num,den)