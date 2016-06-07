%  Figure 7.12a     Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab  v5.0
% script to generate Figure 7.12(a)  rootlocus design

clear
clf
kp=.0484;
 np =  [1.0000    0.9672];
npc=conv(np,[1 -.8]);
dp=conv([1 -1],[1 -.9048]);
dpc=conv(dp,[1 -.05]);
kc=6;
k=kp*kc;
zgrid('new')
rlocus(npc,dpc)
axis('square')
title('Figure 7.12(a)  Rootlocus for antenna design')
axis([-1.2 1.2 -1.2 1.2])
hold on
 r=rlocus(npc,dpc,k); 
plot(real(r),imag(r),'*',real(r),imag(r),'*')
hold off

