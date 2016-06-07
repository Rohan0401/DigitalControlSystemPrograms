%  Figure 9.19     Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
%
% Section 9.5.4 with integral control and estimator 
% includes added meas noise and plant disturbance 
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
T=.05;
[phi,gam]=c2d(F,G,T);
H=[0 .5 .5 0 0
0 -2.113 2.113 .375 .375
0 0 0 .5 .5
1 0 0 0 0];
HI=[-2.113 2.113 .375 .375];
He=[.5 .5 0 0;-2.113 2.113 .375 .375]; % meas is X3 & T
phia=[1 HI;
zeros(4,1) phi];
gama=[0 0;gam];
Q2=[1 0;0 1];
Q1bar=[1 0 0 0;0 1 0 0;0 0 1 0;0 0 0 1];
Q1bar=Q1bar/10;
Q1=H'*Q1bar*H;
Ka=dlqr(phia,gama,Q1,Q2);
Ka=real(Ka);
Rv=[.4 0;0 .1];
Rw=[.1 0;0 .1];
L=dlqe(phi,gam,He,Rw,Rv);
L=real(L);
LH=L*He;
phie=phi-LH;
ze=eig(phie);
se=log(ze)/T;
K=Ka(:,2:5);
KI=Ka(:,1);
GK=gam*K;
phic=[1 HI zeros(1,4);
-gam*KI phi -GK;
-gam*KI LH phi-GK-LH];
n=61;
[Nx,Nu,Nbar]=refi(phi,gam,He,K);
r=[1;2];  % r is vector of reference X3 and tension
xr=Nx*r  ;
Hc=[zeros(2,1) He zeros(2,4)];
% set up reference input
x3=ones(n,1);
Te=2*ones(n,1);
randn('seed',0);
v1=.02*randn(n,1);
v2=.01*randn(n,1);
Fdm=.01;
Fd=[zeros(30,1);Fdm*ones(31,1)];
uc=[x3 Te v1 v2 Fd];
d=zeros(2,5);
B=[0 -1 0 0 0;GK*Nx zeros(4,2) gam(:,1);GK*Nx L zeros(4,1)];
y=dlsim(phic,B,Hc,d,uc);
t=0:T:(n-1)*T;
plot(t,y(:,1),':',t,y(:,2),'--'),grid
axis([0 3 0 2.5])
hold on
ylabel('Outputs')
xlabel('Time   (sec)')
% Now check control limits, where u=-Ka*x + ...
Hu=[-KI zeros(2,4) -K];
d=[K*Nx zeros(2,3)];
u=dlsim(phic,B,Hu,d,uc);
zohplot(t',u(:,1),'-')
zohplot(t',u(:,2),'-.')
title('Fig. 9.19')
text(1.5,1.8,'............ X3 (mm)')
text(1.5,1.6,'- - - - - - - Te (N)')
text(1.5,1.4,'------------- i1 (Amps)')
text(1.5,1.2,'-.-.-.-.-.-.- i2 (Amps)')
hold off
