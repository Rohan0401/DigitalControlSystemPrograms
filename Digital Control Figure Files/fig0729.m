%  Figure 7.29      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0

clear
clf
w1=logspace(-2,1);
w2=logspace(1,2);
w3=logspace(2,4);
w=[w1 w2 w3];
W=[90*ones(size(w1)) ones(size(w2)) .015*ones(size(w3))];
loglog(w,W)
title('Fig.7.29  Plot of typical Bode plot requirements')
