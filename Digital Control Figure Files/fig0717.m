%  Figure 7.17      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab 4.2 or 5.0

clear
clf
%                 s-plane 

w=logspace(-2, 2,400);
 np=1;
dp=[1 1 0];
 
[mag,phase]=bode(np,dp,w);

%              T = 0.2 sec
T = 0.2;
th= w*T;
lag=57.295*th/2;
plot(th,lag) ;grid
 axis([0 3.5 0 90])

hold on
xlabel('Normalized frequency, wT (rad)')
ylabel('Phase lag (deg)')
title('Fig. 7.17  Phase Lag due to sampling')
[ num, den]=c2dm(np,dp,T,'z');
 wd=w(w<pi/T);
%   wd=[wd pi/T];
[mag,phased]=dbode(num,den,T,wd);
k=find(w<pi/T);
 phase=phase(k);
lagd= phase-phased;
plot(wd*T, lagd,'r-')

%              T = 1 sec
T=1;
[ num, den]=c2dm(np,dp,T,'z');
 wd=w(w<pi/T);
%    wd=[wd pi/T];
[mag,phased]=dbode(num,den,T,wd);
k=find(w<pi/T);
phase=phase(k);
lagd= phase-phased;
plot(wd*T , lagd,'b-')

%                T=2
T=2;
[ num, den]=c2dm(np,dp,T,'z');
 wd=w(w<pi/T);
%    wd=[wd pi/T];
[mag,phased]=dbode(num,den,T,wd);
k=find(w<pi/T);
phase=phase( k);
lagd= phase-phased;
plot(wd*T , lagd,'m-')



hold off
