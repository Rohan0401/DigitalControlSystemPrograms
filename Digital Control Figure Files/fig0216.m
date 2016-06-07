%  Figure 2.16      Digital Control of Dynamic Systems, 3e
%                   Franklin, Powell, Emami
%                   Addison-Wesley, Publishing Company, 1998
% Matlab 4.2 or 5.0

clear
clf
num=1;
den=conv([1 0],[1 2 1]);
w=logspace(-1,1,100);
[m,p]=bode(num,den,w);
subplot(2,1,1)
loglog(w,m,w, ones(size(w)));
grid;
axis([.1 10 .1 10])
xlabel('w (rad/sec)');
ylabel('magnitude');
title('Fig. 2.16 Frequency response for example 2.4 (a) magnitude');
hold on
subplot(2,1,2)
semilogx(w,p,w,-180*ones(size(w)));
grid;
xlabel('w (rad/sec)');
ylabel('phase(deg)');
title('Fig. 2.16 (b) phase');
axis([.1 10 -210 -90])

subplot(2,1,1)
K=5
loglog(w,m*K);
[GM,PM]=margin(m*K,p,w);
GM
PM

K=0.48
loglog(w,m*K);
[GM,PM]=margin(m*K,p,w);
GM
PM

K=0.18
loglog(w,m*K);
[GM,PM]=margin(m*K,p,w);
GM
PM
hold off