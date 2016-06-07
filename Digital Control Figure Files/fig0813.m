%  Figure 8.13      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab  v5.0

clear
clf
f=[0 1;
0 0];
g=[0;1];
h=[1 0];
T=.1;
[phi,gam]=c2d(f,g,T);
[numG,denG]=ss2tf(phi,gam,h,0);

numD=[1 -.8182];
denD=[1 -.2375];

num=conv(numG,numD);
den=conv(denG,denD);
zgrid
K=0:3:130;
r1=rlocus(num,den,K);
pzmap(num,den)
plot(r1,'o')
axis([-1 1 -1 1])
axis('square')

Ko=27.7
r=rlocus(num,den,Ko)
plot(r,'*')

hold off
title('Fig. 8.13  Root locus for reduced-order case, example 8.10')