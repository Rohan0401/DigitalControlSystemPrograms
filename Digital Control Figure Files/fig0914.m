%  Figure 9.14      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Section 9.6.4 full state feedback w/o Uss or integral control
% Matlab v4.2 or v5.0

clear
clf
F=[0 0 -10 0;
0 0 0 10;
3.315 -3.315 -.5882 -.5882;
3.315 -3.315 -.5882 -.5882];
G=[0 0;
0 0;
8.533 0;
0 8.533];
s=eig(F);
T=.05;
[phi,gam]=c2d(F,G,T);
z=eig(phi);
H=[.5 .5 0 0
-2.113 2.113 .375 .375];
% add velocity to cost to get around Q1 negative definite from numerical roundoff
H(3,:)=[0 0 .5 .5];
Q2=[1 0;0 1];
Q1bar=[1 0 0;0 1 0;0 0 1];
%faster than needed, let's slow it down
Q1bar=Q1bar/10;
Q1=H'*Q1bar*H;
K=dlqr(phi,gam,Q1,Q2);
K=real(K);
phic=phi-gam*K;
zcl=eig(phic);
scl=log(zcl)/T;%
n=61;
xr=[.527;1.473;0;0];
d=zeros(3,1);
B=gam*K*xr;
y=dstep(phic,B,H,d,1,n);
t=0:T:(n-1)*T;

plot(t,y(:,1),':',t,y(:,2),'--'),grid
axis([0 3 0 2]);
hold on
ylabel('Outputs')
xlabel('Time   (sec)')
% Now check control limits, where u=-K*x + ...
Hu=-K;
d=K*xr;
u=dstep(phic,B,Hu,d,1,n);
zohplot(t',u(:,1),'-')
zohplot(t',u(:,2),'-.')
title('Fig. 9.14')
text(1.5,1.8,'............ X3 (mm)')
text(1.5,1.6,'- - - - - - - Te (N)')
text(1.5,1.4,'------------- i1 (Amps)')
text(1.5,1.2,'-.-.-.-.-.-.- i2 (Amps)')
hold off

