%  Figure 9.4     Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v5.0

clear
clf
z=[0;-1;-1];
p=[1;1;1;1];
kp=1;
k=1:10;
zgrid
[num,den]=zp2tf(z,p,kp);
pzmap(num,den)
rlocus(num,den)
axis([-1.5 1.5 -1.5 1.5])
axis('square')
title('Fig. 9.4  Symmetric root locus of Example 9.4')
hold off
