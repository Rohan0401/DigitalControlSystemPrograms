%  Figure 7.34      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0

clear
clf
 T=1;
w=logspace(-2,pi);
l=length(w);
one=ones(l,1);
oeighty=-180*one;
np=1;
dp=[10 1 0];
[npd dpd]=c2dm(np,dp,T,'z');
[mag,phase]=dbode(npd,dpd,T,w);
 subplot(2,1,1),loglog(w,mag,'-',w,one,'-'),grid 
ylabel('magnitude')
xlabel('w   (rad/sec)')
axis([.02 10 .02 100])
title('Fig.7.34  Frequency response with D3, D4, D5')
hold on
subplot(2,1,2),semilogx(w,phase,'-',w,oeighty,'-'),grid
axis([.02 10 -270 -90]);
ylabel('phase (deg)')
xlabel('w   (rad/sec)')
hold on  

% Compensation #3

nc=15*[1 -.9];
 dc = [1 .5 ];
 num=conv(npd,nc);
den=conv(dpd,dc);
[mag,phase]=dbode(num,den,T,w);
 subplot(2,1,1),loglog(w,mag,'r-',w,one,'--')
subplot(2,1,2),semilogx(w,phase,'r-',w,oeighty,'--')

% Compensation #4
% figure

 nc=10*[1 -.85];
dc=[1 .5];
num=conv(npd,nc);
den=conv(dpd,dc);
[mag,phase]=dbode(num,den,T,w);
 subplot(2,1,1),loglog(w,mag,'b-') 
 subplot(2,1,2),semilogx(w,phase,'b-' ) 

% Compensation     #5
% figure

 nc=12.8*[1 -.883];
dc=[1 0.5];
  num=conv(npd,nc);
den=conv(dpd,dc);
[mag,phase]=dbode(num,den,T,w);
 subplot(2,1,1),loglog(w,mag,'m-')
hold off
subplot(2,1,2),semilogx(w,phase,'m-')
 hold off

