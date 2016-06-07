%  Figure 7.36      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0
% Sensitivity for control with D3, D4, D5   

clear
clf
 T=1;
w=logspace(-2,pi);
l=length(w);
one=ones(l,1);
np=[0 0 1];
dp=[10 1 0];
[npd dpd]=c2dm(np,dp,T,'z');

% Compensation #3

nc=15*[1 -.9];
dc = [1 .5 ];
num=conv(npd,nc);
den=conv(dpd,dc);
nsen=den;
dsen=num+den;
[mag,phase]=dbode(nsen,dsen,T,w);
semilogy(w,mag,'r-')
hold on

% Compensation #4
% figure

 nc=10*[1 -.85];
dc=[1 .5];
num=conv(npd,nc);
den=conv(dpd,dc);
nsen=den;
dsen=num+den;

[mag,phase]=dbode(nsen,dsen,T,w);
semilogy(w,mag,'b-') 
hold on

% Compensation     #5
% figure

nc=12.8*[1 -.883];
dc=[1 0.5];
  num=conv(npd,nc);
den=conv(dpd,dc);
nsen=den;
dsen=num+den;

[mag,phase]=dbode(nsen,dsen,T,w);
semilogy(w,mag,'m-'), grid 
title('Fig.7.36   System sensitivity plots with D3, D4, D5')
 hold off

