%  Figure 7.28      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0
% Stability robustness function for the disk read/write head assembly

clear
clf
dp=[1 0 0];
np=[1 .03 1];
dp1=[1/36 0 0];
np1=[1/36 .03/6 1];
w=logspace(-1,1);
w(26)=1;
w(45)=6;
[mag ph]=bode(np,dp,w);
[mag1 ph1]=bode(np1,dp1,w);
loglog(w,mag)
grid
hold on
loglog(w,mag1)
title('Fig.7.28  Stability robustness function for disk read/write head assembly')
hold off

