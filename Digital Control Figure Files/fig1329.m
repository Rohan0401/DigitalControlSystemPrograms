%  Figure 13.29     Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0
% script to create figure 13.29
% The root locus for the system of Fig. 13.20
 
clf
clear
np = [0     3     2     1];
dp=[1 0 0 0];
[a b c d]=tf2ss(np,dp);
[phi gam]=c2d(a,b,0.1);
[npd,dpd]=ss2tf(phi,gam,c,d);
zgrid
k1=0:.00002:.005;
k2=.01:.01:.1;
k3=.15:.1:5;
k=[k1 k2 k3];
rlocus(npd,dpd,k)
axis([.9  1.1 -.1  .1])
title(' Root locus for the system of Fig. 13.20')

