%  Figure 8.10      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0

clear
clf
clear
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
zd2=[.4+i*.4;.4-i*.4];
zd = zd2'
lt=acker(phi',h',zd2);
lp=lt'
gk=gam*k;
lph=lp*h; 
phic=[phi -gk;
     lph phi-gk-lph]
z=eig(phic);
zcl = z'
hec=[0 -1 0 1;     % output is  xhat2 - x2
     0 0 -k]        % output is  u
d=[0;0];
n=32;
ic=[0;1;0;0];
[y,x]=dimpulse(phic,ic,hec,d,1,n);
e=y(:,1);
u=y(:,2);
t=-T:T:(n-2)*T;

plot(t,x(:,1),'o',t,e,'*',t,x(:,2),'x'),grid
axis([0 3 -2 2])
hold on
plot(t,x(:,1),'-',t,e,'-',t,x(:,2),'-')
us=u/4;
zohplot(t',us,'-')
ylabel('OUTPUTS')
xlabel('Time (sec)')
title('Fig.8.10  Time histories with prediction estimator, example 8.8')
text(2.1,-1.4,'--o--  X1')
text(2.1,-1.8,'--*--  X2 TILDE')
text(2.1,-1.6,'--x--  X2')
text(2.1,-1.2,'-----  U/4')
hold off

[dz,dp,dk]=ss2zp(phi-gam*k-lp*h,lp,k,0,1)
dz(1)=inf
