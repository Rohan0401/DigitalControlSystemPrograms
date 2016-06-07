% fig1227a.m to produce Fig. 12.27a of Franklin, Powell and Workman  MLW 6/89
%  UPDATED 3/31/97 to fix error in second edition for 3rd edition.
%  M L Workman
clg, hold off,  subplot
% axis('normal')
% Dynamics state-space description for actuator used in
% design example of Chapter 12: DASD servo
%
ky = 10000.
kv = 100.
kf= 2.51
z1 = 0.05,  w1 = 2*pi*70,     b1 = -0.00575, b2 = -.0000115
z2 = 0.005,  w2 = 2*pi*2200,   b3 =  0.0230, b4 =  0.0
z3 = 0.05, w3 = 2*pi*4000,     b5 =  0.626, b6 =  0.0
z4 = 0.005, w4 = 2*pi*9000,   b7 =  0.1150, b8 =  0.0173

F=[0 ky 0 0 0 0 0 0 0 0;
0 -kf*kv kv*b1 kv*b2 kv*b3 kv*b4 kv*b5 kv*b6 kv*b7 kv*b8;
0 0   0    w1     0     0     0     0     0     0  ;
0 0  -w1 -2*z1*w1 0     0     0     0     0     0  ;
0 0   0    0     0     w2     0     0     0     0  ;
0 0   0    0   -w2  -2*z2*w2  0     0     0     0  ;
0 0   0    0     0      0     0    w3     0     0  ;
0 0   0    0     0      0   -w3 -2*z3*w3  0     0  ;
0 0   0    0     0      0     0     0     0     w4 ;
0 0   0    0     0      0     0     0  -w4 -2*z4*w4]

G=[0 0  0 w1 0 w2 0 w3 0 w4 ]'

H = [1 0 0 0 0 0 0 0 0 0]

J=0

f=logspace(1,4,400);
w = f*2*pi;
[magp phasep]=bode(F,G,H,J,1,w);
mag = 20* log10(magp);
set(gca,'XScale','log')
set(gca,'YTick',[-100:20:60])
axis([10 10000 -100 60]), hold on
semilogx(f,mag),grid,xlabel('Frequency (Hz)')
hold off
% semilogx(f,phasep), grid





