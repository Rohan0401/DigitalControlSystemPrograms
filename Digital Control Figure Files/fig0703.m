%  Figure 7.3      Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab 4.2 or 5.0

clear
clf
x=-2:.2:0;
y=sqrt(3)*x;
plot(x,y)
hold on
axis([-2 2 -2 2])
plot(x,-y)
grid
title('Fig. 7.03  Acceptable pole locations for the antenna control')
y1=-2:.1:2;
x1=-0.5*ones(size(y1));
plot(x1,y1)
hold off
