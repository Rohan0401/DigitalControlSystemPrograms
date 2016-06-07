%  Figure 13.18     Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0
% script to generate Figure 13.18

clf
clear
np=[.3102 -.5993 .2902];
dp=[1 -3 3 -1];
dnyquist(np,dp,0.1)
axis([-10 10 -10 10])
xlabel('Real')
ylabel('Imaginary')
title('Nyquist plot for the system of Eq.(13.30)')

