%  Figure 11.12     Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0

clear
clf
w2=60*2*pi;
w1=2*pi;
T=1/480;
t=0:T:2;
x=sin(w1*t)+.2*sin(w2*t);

subplot(2,2,1),plot(t,x),grid
axis([0 2 -1.5 1.5])
title('Fig. 11.12, (a) signal + noise')
xlabel('time (sec)')

Wp=20;   %prefilter breakpoint, rad/sec
x=sin(w1*t)+.2*Wp/w2*sin(w2*t);  % assumes 1st order filter
subplot(2,2,2),plot(t,x),grid
axis([0 2 -1.5 1.5])
title('(c) prefiltered (a)')
xlabel('time (sec)')

T=1/28;
t=0:T:2;
x=sin(w1*t)+.1*sin(w2*t);
subplot(2,2,3),plot(t,x,'o'),grid
axis([0 2 -1.5 1.5])
title('(b) 28 Hz sampled (a)')
xlabel('time (sec)')

x=sin(w1*t)+.1*Wp/w2*sin(w2*t);
subplot(2,2,4),plot(t,x,'o'),grid
axis([0 2 -1.5 1.5])
title('(d) 28 Hz sampled (c)')
xlabel('time (sec)')


