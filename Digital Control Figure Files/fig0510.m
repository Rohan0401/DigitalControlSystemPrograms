%  Figure 5.7      Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab 4.2 or 5.0

clear
clf
w = 0:.1:15;
w(1)=.001;
zoh = sin(w/2)./(w/2);
v =[0 15 0 1.3];

subplot(2,2,3),plot(w,abs(zoh),'.')
x = [1 1];
y = [0  sin(.5)/(.5)];
axis(v)
hold on
plot(x,y)
x1 = [2*pi-1 2*pi-1];
y1 = [0 sin(pi-.5)/(pi-.5)];
plot(x1,y1)
x2 = [2*pi+1 2*pi+1];
y2 = [0 sin(pi+.5)/(pi+.5)];
plot(x2,abs(y2))
x3=[4*pi-1 4*pi-1];
y3=[0 sin(2*pi-.5)/(2*pi-.5)];
plot(x3,abs(y3))
x4 = [4*pi+1 4*pi+1];
y4 =[0 sin(2*pi+.5)/(2*pi+.5)];
plot(x4,y4)
title(' RESPONSE FROM ZOH')
xlabel('Fig. 5.10')
grid
v = [0 15 0 1.3];
hold off

x = [1 1];
y = [0  1];
subplot(2,2,1),plot(x,y)
axis(v)
grid
title('INPUT SPECTRUM')
x = [1 1];
y = [0  1];

subplot(2,2,2),plot(x,y)
axis(v)
hold on
x1 = [2*pi-1 2*pi-1];
y1 = [0 1];
plot(x1,y1)
x2 = [2*pi+1 2*pi+1];
y2 = [0 1];
plot(x2,y2)
x3=[4*pi-1 4*pi-1];
y3=[0 1];
plot(x3,y3)
x4 = [4*pi+1 4*pi+1];
y4 = [0 1];
plot(x4,y4)
grid
title('SAMPLED SPECTRUM')
hold off
