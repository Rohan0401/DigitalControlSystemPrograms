%  Figure 9.15      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
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
n=61;
% steady state tension error too high, let's compute Uss
Hr=H(1:2,:);
[Nx,Nu,Nbar]=refi(phi,gam,Hr,K);
r=[1;2];  % r is vector of reference X3 and tension
xr=Nx*r  ;
uss=Nu*r;
B=gam*K*xr+gam*uss;
d=zeros(3,1);
y=dstep(phic,B,H,d,1,n);
t=0:T:(n-1)*T;

plot(t,y(:,1),':',t,y(:,2),'--'),grid
axis([0 3 0 2.5]);
hold on
ylabel('Outputs')
xlabel('Time   (sec)')
xlabel('Time (sec)')
% Now check control limits, where u=-K*x + ...
Hu=-K;
d=K*xr+uss;
u=dstep(phic,B,Hu,d,1,n);
zohplot(t',u(:,1),'-')
zohplot(t',u(:,2),'-.')
title('Fig. 9.15')
text(1.5,1.8,'............ X3 (mm)')
text(1.5,1.6,'- - - - - - -Te (N)')
text(1.5,1.4,'-------------i1 (Amps)')
text(1.5,1.2,'-.-.-.-.-.-.-i2 (Amps)')
hold off

