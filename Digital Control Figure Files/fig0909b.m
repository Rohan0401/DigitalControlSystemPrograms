%  Figure 9.9b      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0

clear
clf

F=[-.2 .1 1;
-.05 0 0;
0 0 -1];
G=[0 1;0 .7;
1 0];
T=.2;
[phi,gam]=c2d(F,G,T);
ts=2.4;
k=ts/T;
alpha=100^(1/k);
phip=alpha*phi;
gamp=alpha*gam;
q1=[.25 0 0;
0 1 0;
0 0 0];
q2=[1/25 0;
0 .01];
K=dlqr(phip,gamp,q1,q2);
phic=phi-gam*K;
z=eig(phic);
H=-K;
d=[0;0];
ic=[0;1;0];
n=22;
t=-T:T:(n-2)*T;
[y,x]=dimpulse(phic,ic,H,d,1,n);

plot(t,x(:,1)/2,'o',t,x(:,2),'x'),grid
hold on
axis([0 4 -2 2]);
plot(t,x(:,1)/2,'-',t,x(:,2),'-')
zohplot(t',y(:,2)/10,'--')
zohplot(t',y(:,1)/5,'-')
hold off
ylabel('Outputs')
xlabel('Time   (sec)')
title('Fig. 9.9(b)')
text(2.1,-1.15,'---o--- X1/2')
text(2.1,-1.4,'---x--- X2')
text(2.1,-1.65,'------- U1/5')
text(2.1,-1.9,'- - - - U2/10')

%disp('       t       x1        x2         x3')
%output=[t(2:19)' x(2:19,1) x(2:19,2) x(2:19,3)]
