%  Figure 8.12      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0

clear
clf
f=[0 1;
0 0];
g=[0;1];
h=[1 0];
T=.1;
[phi,gam]=c2d(f,g,T);
z=eig(phi);
zol = z'
i=sqrt(-1);
zd1=[.8+i*.25;.8-i*.25];
zd = zd1'
k=acker(phi,gam,zd1)
zd2=.5
lr=(1-zd2)/T
pbb=phi(2,2);
pab=phi(1,2);
pba=phi(2,1);
paa=phi(1,1);
k1=[k(1) 0];
k2=k(2);
gb=gam(2);
ph13=pba*h - gb*k1 - lr*paa*h + lr*h*phi
ph33=pbb - gb*k2 - lr*pab
phic=[phi-gam*k1 -gam*k2;
     ph13 ph33]
z=eig(phic);
zcl = z'
hec=[0 -1 1;     % output is  xhat2 - x2
     -k1 -k2]        % output is  u
d=[0;0];
n=32;
ic=[0;1;0];
[y,x]=dimpulse(phic,ic,hec,d,1,n);
e=y(:,1);
u=y(:,2);
t=-T:T:(n-2)*T;

plot(t,x(:,1),'o',t,e,'*',t,x(:,2),'x')
axis([0 3 -2 2])
hold on
plot(t,x(:,1),'-',t,e,'-',t,x(:,2),'-')
us=u/4;
zohplot(t',us,'-')
hold off
ylabel('OUTPUTS')
xlabel('Time (sec)')
title('Fig. 8.12  Time histories with reduced-order estimator, example 8.10')
text(2.1,-1.4,'--o--  X1')
text(2.1,-1.8,'--*--  X2 TILDE')
text(2.1,-1.6,'--x--  X2')
text(2.1,-1.2,'-----  U/4')
grid