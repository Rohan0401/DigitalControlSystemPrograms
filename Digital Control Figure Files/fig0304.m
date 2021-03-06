%  Figure 3.4      Digital Control of Dynamic Systems, 3e 
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
tf=1;
t=0:.01:tf;
yc=step(numcl,dencl,t);
subplot(2,1,2)
plot(t,yc,'-'),grid
axis([0 1 0 1.5])
hold on

% now do the digital case

Ws= 20;  % Hz
T=1/Ws;
[numGd,denGd]=c2dm(numG,denG,T,'zoh');
a=2;
b=10;
numDd=Ko*[1 -(1-a*T)];
denDd=[1 -(1-b*T)];
numd=conv(numGd,numDd);
dend=conv(denGd,denDd);
[numcld,dencld]=feedback(numd,dend,1,1);

N=tf*Ws;
yd=dstep(numcld,dencld,N);
td=0:T:(N-1)*T;
plot(td,yd,'*')
plot(td,yd,'-')
ylabel('output y')
title('Fig. 3.4 Continuous and digital step response with 20 Hz sample rate')
text(.3,.4,'*-----*-----* digital control using Eulers method')
text(.3,.6,'------------- continuous control')
text(.3,.23,'. . . . . . .')
text(.3,.2,'               continuous control with delay approx')

% Now do continuous with delay approximation included

numH=2/T;
denH=[1 2/T];

num=conv(numH,conv(numG,numD));
den=conv(denH,conv(denG,denD));

[numcl,dencl]=feedback(num,den,1,1);
yc=step(numcl,dencl,t);

plot(t,yc,'.')
hold off


