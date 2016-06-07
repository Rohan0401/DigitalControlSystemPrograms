%  Figure 7.32      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0
% Kv from the Bode plot  

clf
clear
close
 np=1;
dp=[10 1 0];
T=1.0;
w=logspace(-2,pi);
[npd,dpd]=c2dm(np,dp,T,'z');
nc= 6*[1 -0.8];
dc=[1 -.05];
num=conv(npd , nc);
den=conv(dpd , dc);
 
 [mag,phase]=dbode(num,den,T,w);
 
loglog(w,mag); grid
hold on
ylabel('Magnitude')
xlabel('w (rad/sec)')
title('Fig.7.32  Determination of Kv')
a=[.001 2 ];
b=[1 1];
loglog(b,a,'-')
a=[126 1.26 1];
b=[.01 1 1.26];
loglog(b,a,'-')
a=[1.26 1.26];
b=[.01 1];
loglog(b,a,'--')
hold off



