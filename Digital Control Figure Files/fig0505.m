%  Figure 5.5      Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab 4.2 or 5.0

clear
clf
k = 0:.1:12;
n = 0:12;
y = sin(k);
y1 = sin((1-2*pi)*k);
y2 = sin(n);
plot(k,y),grid
hold on
plot(k,y1)
plot(n,y2,'o')
title('TWO SINUSOIDS SHOWING ALIASING')
xlabel('Fig. 5.5')
hold off
