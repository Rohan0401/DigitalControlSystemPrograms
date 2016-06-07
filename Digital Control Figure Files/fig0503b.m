%  Figure 5.3b     Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab 4.2 or 5.0

k = 0:25;
y =3*sin(.5*k + pi/6);
x = zeros(1,78);
x(1:3:76) =  k;
x(2:3:77) = k;
x(3:3:78) = k;
y1 = zeros(size(x));
y1(2:3:77) = y;
plot(x,y1)
grid
title('SAMPLED SIGNAL r*')
