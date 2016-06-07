%  Figure 3.6      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab 4.2 or 5.0

clear
clf
numG=1;
denG=[1 1 0];

Ko=70;
numD=Ko*[1 2];
denD=[1 10];

num=conv(numG,numD);
den=conv(denG,denD);

[numcl,dencl]=feedback(num,den,1,1);

T=.1;

tf=1;
t=0:.01:tf;
yc=step(numcl,dencl,t);
subplot(2,1,1)
plot(t,yc,'-'),grid
axis([0 1 0 1.5])
hold on

% now do the digital case

[numGd,denGd]=c2dm(numG,denG,T,'zoh');
a=2;
b=10;
Ko=70;
numDd=Ko*[1 -(1-a*T)];
denDd=[1 -(1-b*T)];
numd=conv(numGd,numDd);
dend=conv(denGd,denDd);
[numcld,dencld]=feedback(numd,dend,1,1);

N=tf/T;
yd=dstep(numcld,dencld,N);
td=0:T:(N-1)*T;
plot(td,yd,'*')
ylabel('output')
xlabel('Time (sec)')
plot(td,yd,'-')
title('Fig. 3.6 Continuous and digital response for Example 3.3')
hold off

