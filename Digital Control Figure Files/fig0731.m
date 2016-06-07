%  Figure 7.31      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab  v5.0
% Script to generate example of sensitivity integral
% and corresponding step responses.

clear
clf
np =[0     0     1];
dp =[1     2     1];
T =0.2000;
sysp=tf(np,dp);
sysp=ss(sysp);
sysd=c2d(sysp,T,'zoh');
nc = 15*[1.0000   -0.7000];
dc =[1.0000    0.5000];
sysc=tf(nc,dc,T);
sysc=ss(sysc);
sysol=sysc*sysd;
[nol,dol]=tfdata(sysol,'v');
dcl=dol+nol;
w=0:pi/(50*T):pi/T;
sysS=tf(dol,dcl,T);
sysS=ss(sysS);
[mag, ph]=bode(sysS,w);
% Now the unstable maglev plant
np1 =[0     0     1];
dp1 =[1     0     -1];
sysp1=tf(np1,dp1);
sysp1=ss(sysp1);
sysd1=c2d(sysp1,T,'zoh');
nc = 15*[1.0000   -0.7000];
dc =[1.0000    0.5000];
sysc=tf(nc,dc,T);
sysc=ss(sysc);
sysol1=sysc*sysd1;
[nol1,dol1]=tfdata(sysol1,'v');
dcl1=dol1+nol1;
w=0:pi/(50*T):pi/T;
sysS1=tf(dol1,dcl1,T);
sysS1=ss(sysS1);
[mag1, ph1]=bode(sysS1,w);
mag1=mag1(1,:);
ph1=ph1(1,:);
% now plot the step responses
ripple(np,dp,nc,dc,T,5);
hold on
ripple(np1,dp1,nc,dc,T,5);
grid
title('Fig.7.31a Process control and magnetic levitation (a)Step responses')
hold off
figure
semilogy(w,mag(1,:));
hold on
semilogy(w,mag1(1,:));
grid
title('Fig.7.31(b) Process control and magnetic levitation (b)Sensitivity functions')
hold off