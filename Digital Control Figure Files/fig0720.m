%  Figure 7.20      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab 4.2 or 5.0
% Computing the gain and phase margins with proportional control

clear
clf

dp=[1 2 1 0];
np=[0 0 0 1];
T=0.2;
[npd dpd]=c2dm(np,dp,T,'z');
w=logspace(-1 ,1);

% w=0:pi/(50*T):pi/T;

[mag ph]=dbode(npd,dpd,T,w);
subplot(2,1,1) , loglog(w,mag), grid
axis([.1 10 .1 10])
m180=-180*ones(size(w));
title('Fig.7.20 Gain and phase margins for Example 7.10')
subplot(2,1,2) , semilogx(w,ph)
hold on
 semilogx(w,m180),grid
axis([.1 10 -270 -90])
hold off



 
