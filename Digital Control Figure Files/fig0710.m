%  Figure 7.10     Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab  v5.0
%  Plot of acceptable pole locations in the z-plane

clear
clf
zgrid('new')
np=[0 1 0];
dp=[1 -2*0.9048 .9048^2];
rlocus(np,dp)
axis('square')
axis([-1 1 -1 1])
title(' Fig. 7.10  Plot of acceptable pole locations in the z-plane')
hold off
