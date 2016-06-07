%  Figure 5.3c     Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab 4.2 or 5.0

k = 0:25;
y = 3*sin(.5*k + pi/6);
zohplot(k,y)
hold on
n = 0:125;
y1 = 3*sin(.1*n + pi/6);
plot(n/5 , y1, '.')
grid
title('OUTPUT SIGNAL rh')
hold off
