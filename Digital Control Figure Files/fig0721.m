%  Figure 7.21     Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab 4.2 or 5.0

clear
clf
t=0:.1:6.3;
plot(sin(t),cos(t),'-'),grid 

hold on
w=logspace(-1,1);
 np=1;
dp=[1 2 1 0];
T=0.2;
[num den]=c2dm(np,dp,T,'z');
 dnyquist(num,den,T,w);
axis('square')
axis([-1.5 1.5 -1.5 1.5])
 title('Fig.7.21  Nyquist plot for 1/s(s+1)^2')
hold off
 
