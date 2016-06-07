%  Figure 7.30      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab  v5.0

clf
clear
w=[logspace(-1, .4) 3];
np=[0 0 1];
dp=[1 0 0];
[a,b,c,d]=tf2ss(np,dp);
sysc=ss(a,b,c,d);
T=1;
sysd=c2d(sysc,T,'zoh');
[mag ph]= bode(sysd,w);
subplot(2,1,1); loglog(w,mag(1,:)) ; grid
%ph=ph-360*ones(size(w'));
title('Figure 7.30 Discrete Bode plot of 1/s^2 plant, T=1')
subplot(2,1,2);
semilogx(w,ph(1,:)); grid
axis([.1 10 -300 -150])
hold on;
pha=-180*ones(size(w'));
semilogx(w,pha) 
hold off
