%  Figure 3.5      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab 4.2 or 5.0
clc
clear all
close all
numG=1;
denG=[1 1 0];

Ko=70;
numD=Ko*[1 2];
denD=[1 10];

num=conv(numG,numD);
den=conv(denG,denD);

[numcl,dencl]=feedback(num,den,1,1);
damp(dencl)    % zeta of continuous system

T=.1;
numDL = 2/T;
denDL = [1  2/T];
num2=numDL*num;
den2=conv(denDL,den);
[numcl2,dencl2]=feedback(num2,den2,1,1);
damp(dencl2)    % zeta of approx digital system

w=logspace(-1,2,100);
[mag,phase]=bode(num,den,w);
subplot(2,1,1)
loglog(w,mag),grid
hold on
axis([.1 100 .1 10])
title('Fig. 3.5 Frequency response for Example 3.3')
ylabel('Magnitude')
xlabel('Frequency (rad/sec)')

% draw line on mag plot at crossover freg
[Gm,Pm,Wcg,Wcp]=margin(mag,phase,w);
d1=logspace(-1,0,20);
d2=Wcp*ones(1,20);
loglog(d2,d1,'r-')
hold off

subplot(2,1,2)
semilogx(w,phase),grid
axis([.1 100  -180 -90])
ylabel('Phase (Deg)')
xlabel('Frequency (rad/sec)')
[Gm,Pm,Wcg,Wcp]=margin(mag,phase,w);
PMcont = Pm
PMdig=PMcont-Wcp*T/2*180/pi
hold on

phased=phase-w'*T/2*180/pi;
semilogx(w',phased,'o')

% draw line on phase plot at crossover freg
s1=-180:2:-90;
s2=Wcp*ones(1,46);
semilogx(s2,s1,'r-')


hold off
