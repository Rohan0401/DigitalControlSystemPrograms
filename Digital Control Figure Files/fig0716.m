%  Figure 7.15      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab 4.2 or 5.0

clear
clf
w=logspace(-2,1);
 
% s-plane 
 np= [0 1];
dp=[1 1 0];
[mag,phase]=bode(np,dp,w);
subplot(2,1,1),loglog(w,mag,'-'),grid 
ylabel('Magnitude')
xlabel('Frequency (rad/sec)')
axis([ .01 10 .01 100]);
title('Fig. 7.16 Frequency Response as a function of T')
hold on
subplot(2,1,2),semilogx(w,phase,'-'),grid
ylabel('Phase (deg)')
xlabel('Frequency (rad/sec)')
hold on

%              T = 0.2 sec
T = 0.2;
k=find(w<pi/T);
wd=w(k);
[num den]=c2dm(np,dp,T,'z');
[mag,phase]=dbode(num,den,T,wd);
subplot(2,1,1),loglog(wd,mag,'r-') 
subplot(2,1,2),semilogx(wd,phase,'r-')

%              T = 1 sec
T = 1;
 k=find(w<pi/T);
k=[k 1+max(k)];
wd=w(k);
 [num den]=c2dm(np,dp,T,'z');
[mag,phase]=dbode(num,den,T,wd);
subplot(2,1,1),loglog(wd,mag,'g-') 
subplot(2,1,2),semilogx(wd,phase,'g-')

%              T = 2 sec
T = 2;
k=find(w<pi/T);
k=[k 37];
wd=w(k);
 [num den]=c2dm(np,dp,T,'z');
[mag,phase]=dbode(num,den,T,wd);
subplot(2,1,1),loglog(wd,mag,'m-') 
subplot(2,1,2),semilogx(wd,phase,'m-')
subplot(2,1,1) , axis([.1 10 .01 10])
hold off
subplot(2,1,2) , axis([.1 10 -250 -50]) 
hold off
