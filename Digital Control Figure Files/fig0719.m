%  Figure 7.19      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab 4.2 or 5.0
% Discrete Nyquist plot 

clear
close all
clc
np=[0 0 1];
dp=[1 1 0];
[num den]=c2dm(np,dp,2,'z');
dnyquist(num,den,2);
axis([-2 0 -1 1])
axis('square')
title('Fig.7.19 Nyquist plot from Example 1 using contour from Fig.718(c)')
hold off