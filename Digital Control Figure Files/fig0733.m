%  Figure 7.33      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0

clear
clf
T=1;
w=logspace(-2,pi);
l=length(w);
one=ones(l,1);
oeighty=-180*one;
 

% uncompensated
z=[-.9672;inf];
p=[1;.9048];
kp=.0484;
ko=kp;
[npd,dpd]=zp2tf(z,p,ko);
[mag,phase]=dbode(npd,dpd,T,w);
subplot(2,1,1),loglog(w,mag,'y-',w,one,'-');
grid
axis([.01 10 .01 100]);
title(' Fig.7.33  Frequency responses with D1,D2,and D3') 
ylabel('magnitude')
xlabel('w (rad/sec)')
hold on
subplot(2,1,2), semilogx(w,phase,'y-',w,oeighty,'-')
axis([.01 10 -270 -90]);
grid
hold on
ylabel('phase (deg)')
xlabel('w (rad/sec)')
% f=w';
% fr=[f,mag,phase+180];

% Compensation #1
dz=.85;
dp=0;
z=[-.9672;dz;inf];
p=[1;.9048;dp];
ko=kp*(1-dp)/(1-dz);
[num,den]=zp2tf(z,p,ko);
[mag,phase]=dbode(num,den,T,w);
subplot(2,1,1),loglog(w,mag,'r-')
axis([.01 10 .01 100]);

subplot(2,1,2),semilogx(w,phase,'r-')
axis([-2 1 -270 -90]);

%  fr=[f,mag,phase+180];

% Compensation #2
dz=.9;
dp=0;
z=[-.9672;dz;inf];
p=[1;.9048;dp];
ko=kp*(1-dp)/(1-dz);
[num,den]=zp2tf(z,p,ko);
[mag,phase]=dbode(num,den,T,w);
subplot(2,1,1),loglog(w,mag,'b-')
axis([.01 10 .01 100]);

subplot(2,1,2),semilogx(w,phase,'b-')
axis([-2 1 -270 -90]);

% Compensation #3
dz=.9;
dp=-.5;
z=[-.9672;dz;inf];
p=[1;.9048;dp];
ko=kp*(1-dp)/(1-dz);
[num,den]=zp2tf(z,p,ko);
[mag,phase]=dbode(num,den,T,w);
subplot(2,1,1),loglog(w,mag,'m-')
axis([.01 10 .01 100]);
hold off

subplot(2,1,2),semilogx(w,phase,'m-')
axis([.01 10 -270 -90]);
hold off
