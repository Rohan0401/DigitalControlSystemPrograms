%  Figure 2.10      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab 4.2 or 5.0

clear
clf
numD=[1 3];
denD=[1 10];
numG=[10];
denG=[1 2 0];
num=conv(numD,numG);
den=conv(denD,denG);
subplot(2,1,1)
r=rlocus(num,den);
plot(r,'.')
hold on
axis([-11 1 -6 6])
axis('square')
grid
pzmap(num,den)
title('Fig. 2.10(a) Root locus')
K=3.7;
r1=rlocus(num,den,K);
damp(r1')
plot(r1,'*')
hold off
[numCL,denCL]=feedback(K*num,den,1,1);
subplot(2,1,2)
step(numCL,denCL),grid
title('Fig. 2.10(b) Step response')
