%  Figure 14.08     Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0

%  Script to produce Fig. 14.08a and 14.08b of Franklin, Powell and Workman  MLW 6/89
% Dynamic state-space description for actuator used in
% design example of Chapter 14: DASD servo
%
%  
clf
clear
m=0.2;
kt=20;
ky = 10000.;
kv = 100.;
kf= 2.51;
z1 = 0.05;  w1 = 2*pi*70;     b1 = -0.00575; b2 = -.0000115;
z2 = 0.005;  w2 = 2*pi*2200;   b3 =  0.0230; b4 =  0.0;
z3 = 0.05; w3 = 2*pi*4000;     b5 =  0.826; b6 =  0.0;
z4 = 0.005; w4 = 2*pi*9000;   b7 =  0.16420; b8 =  0.0273;

F=[0 ky 0 0 0 0 0 0 0 0;
0 -kf/m kv*b1 kv*b2 kv*b3 kv*b4 kv*b5 kv*b6 kv*b7 kv*b8;
0 0   0    w1     0     0     0     0     0     0  ;
0 0  -w1 -2*z1*w1 0     0     0     0     0     0  ;
0 0   0    0     0     w2     0     0     0     0  ;
0 0   0    0   -w2  -2*z2*w2  0     0     0     0  ;
0 0   0    0     0      0     0    w3     0     0  ;
0 0   0    0     0      0   -w3 -2*z3*w3  0     0  ;
0 0   0    0     0      0     0     0     0     w4 ;
0 0   0    0     0      0     0     0  -w4 -2*z4*w4];

G=[0 0  0 w1 0 w2 0 w3 0 w4 ]';

H = [1 0 0 0 0 0 0 0 0 0];

J=0;

f=logspace(1,4,400);
w = f*2*pi;
[magp phasep]=bode(F,G,H,J,1,w);
mag = 20* log10(magp);
figure(1)
set(gca,'XScale','log')
set(gca,'YTick',[-100:20:60])
axis([10 10000 -100 60]), hold on
semilogx(f,mag),grid,xlabel('Frequency (Hz)'),ylabel('Magnitude')
title('Figure 14.8(a)')
hold off
figure(2)
semilogx(f,phasep), grid,xlabel('Frequency (Hz)'),ylabel('Phase')
set(gca,'YTick',[-720:90:-90])
axis([10 10000 -720 -90])
title('Figure 14.8(b)')




