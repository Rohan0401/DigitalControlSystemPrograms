%  Figure 2.9       Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab 4.2 or 5.0

clear
clf
num=[1 0];
den=[1 0 1];
rlocus(num,den)
axis([-2 2 -2 2])
hold on
%k1=.2:.2:1.8;
%k2=1.9:.1:2.7;
%k3=3:2:12;
%k=[k1 k2 k3];
r=rlocus(-num,den);
plot(r,'.')
%plot(r,'-')
title('Fig. 2.9  Root locus for example')
axis('square')
hold off