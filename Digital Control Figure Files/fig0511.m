%  Figure 5.7      Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab 4.2 or 5.0

clear
clf
k = 0:25;
y = 3*sin(.5*k+pi/6);
zohplot(k,y)
hold on
abar = 3*sin(.25)/.25;
n = 0:125;
y1 =abar*sin(.1*n + pi/6 -.25);
plot(n/5, y1)
y1 = 3*sin(.1*n + pi/6);
plot(n/5, y1)
title('PLOT OF ZOH OUTPUT AND FIRST HARMONIC')
xlabel('               Fig. 5.11         t/T --->')
grid
hold off
