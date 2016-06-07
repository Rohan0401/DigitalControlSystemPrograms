%  Figure 5.3d     Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab 4.2 or 5.0


v = [-10 10 -10 10];
x = [-7  -3  -2];
y = [0 0 1];
x1 = [-2  2];
y1 = [0 0];
plot(x,y)
axis(v);
hold on
plot(x1,y1)
x1 = [2 2 6 6 2];
y1 = [-2 2 2 -2 -2];
plot(x1,y1)
x2 = [6 8];
y2 = [0 0];
plot(x2,y2)
text(-4,1,'r')
text(0,1,'r*')
text(6.5,1,'rh')
text(2.5,-1,'ZOH')
text(-2.5, -2.5,'T')
title('SAMPLE & HOLD')
axis([-8 8 -8 8])
xlabel('Fig. 5.3')
hold off
