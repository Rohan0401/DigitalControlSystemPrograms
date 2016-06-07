%  Figure 3.7      Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab 4.2 or 5.0
% Proportional Control: reference

clc
clear
close all
numG = 360000;
denG = conv([1 60],[1 600]);
Kp = 5;
Td = .0008;
Ti = .003;
numD=Kp*[Ti*Td Ti 1];
denD=[Ti 0];
[numCL,denCL]=feedback(conv(numG,numD),conv(denG,denD),1,1);
t=0:.0002:.01;
yc=step(numCL,denCL,t);

%subplot(2,1,1)
plot(t*1000,yc,'-');
grid;
hold on
title('Fig. 3.7 Step response of a micro-motor, Example 3.4');
xlabel('time (msec)');
ylabel('speed (rad/sec)');

% now do digital case

T = 0.0003;
[numGd,denGd]=c2dm(numG,denG,T,'zoh');
a=1+T/Ti+Td/T
b=1+2*Td/T
c=Td/T
numDd=Kp*[a -b c];
denDd=[1 -1 0];
[numCLd,denCLd]=feedback(conv(numGd,numDd),conv(denGd,denDd),1,1);

td=0:T:.01;
N=length(td);
yd1=dstep(numCLd,denCLd,N);

plot(td*1000,yd1,'-');
plot(td*1000,yd1,'*');

T=0.0001; 
[numGd,denGd]=c2dm(numG,denG,T,'zoh');
a=1+T/Ti+Td/T
b=1+2*Td/T
c=Td/T
numDd=Kp*[a -b c];
denDd= [1 -1 0];
[numCLd,denCLd]=feedback(conv(numGd,numDd),conv(denGd,denDd),1,1);

td=0:T:.01;
N=length(td);
yd2=dstep(numCLd,denCLd,N);

plot(td*1000,yd2,'-');
plot(td*1000,yd2,'o');

text(4.1,.6,'--------- continuous')
text(4.1,.4,'-*--*--*- digital, T = 0.3 msec')
text(4.1,.2,'-o--o--o- digital, T = 0.1 msec')

hold off