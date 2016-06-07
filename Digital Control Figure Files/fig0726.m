%  Figure 7.26      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0
% model uncertainty for the disk read/write head assembly

clear
clf
np=[1 0 0];
dp=[1 .03 1];
np1=[1/36 0 0];
dp1=[1/36 .03/6 1];
w=logspace(-1,1);
w(26)=1;
w(45)=6;
[mag ph]=bode(np,dp,w);
[mag1 ph1]=bode(np1,dp1,w);
loglog(w,mag)
grid
title('Fig.7.26 Model uncertainty for disk read/write head assembly')



