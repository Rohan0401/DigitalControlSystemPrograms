%  Figure 2.4       Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab 4.2 or 5.0

clear
clf
num=1;
t=0:.1:12;

zeta=0;
den=[1 2*zeta 1];
y1=step(num,den,t);

zeta=.1;
den=[1 2*zeta 1];
y2=step(num,den,t);

zeta=.2;
den=[1 2*zeta 1];
y3=step(num,den,t);

zeta=.3;
den=[1 2*zeta 1];
y4=step(num,den,t);

plot(t,y1,'-',t,y2,'-',t,y3,'-',t,y4,'-'),grid
axis([0 12 0 2])
title('Fig. 2.4 Step response vs. zeta')
xlabel('Wn t ')
ylabel('y(t)')
hold on

zeta=.4;
den=[1 2*zeta 1];
y1=step(num,den,t);

zeta=.5;
den=[1 2*zeta 1];
y2=step(num,den,t);

zeta=.6;
den=[1 2*zeta 1];
y3=step(num,den,t);

zeta=.7;
den=[1 2*zeta 1];
y4=step(num,den,t);

plot(t,y1,'-',t,y2,'-',t,y3,'-',t,y4,'-')

zeta=.8;
den=[1 2*zeta 1];
y1=step(num,den,t);

zeta=.9;
den=[1 2*zeta 1];
y2=step(num,den,t);

zeta=1;
den=[1 2*zeta 1];
y3=step(num,den,t);

plot(t,y1,'-',t,y2,'-',t,y3,'-')
hold off
