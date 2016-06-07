%  Figure 5.9      Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab 4.2 or 5.0

clear
clf
k = 0:25;
y = 3*sin(.5*k+pi/6);
zohplot(k,y)
grid
hold on
n = 0:125;
y1 = 3*sin(.1*n + pi/6);
plot(n/5, y1)
title('PLOT OF 3*SIN(50t + PI/6)')
xlabel('               Fig. 5.9         t/T --->')
hold off
