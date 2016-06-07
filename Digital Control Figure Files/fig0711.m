%  Figure 7.11     Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab  v5.0

clear
clf
np=[1 .9672];
dp= conv([1 -1],[1 -.9048]);
zgrid('new')
rlocus(np,dp)
axis('square')
dpc=conv([1 -1],[1 -.3679]);
rlocus(np,dpc)
axis([-1 1 -1 1])
title('Figure 7.11 Discrete rootlocus with and without compensation')
 hold  off
