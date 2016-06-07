%  Figure 8.8       Digital Control of Dynamic Systems, 3e 
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
zd1=[.8+i*.25;.8-i*.25];
zd = zd1'
k=acker(phi,gam,zd1)
pbb=phi(2,2);
pab=phi(1,2);
zd2=.5
lr=(1-zd2)/T
n=17;
%y=dimpulse(phi-gam*k,ic,h,0,1,n);
%u=dimpulse(phi-gam*k,ic,k,0,1,n);
x2=dimpulse(pbb-lr*pab,1,1,0,1,n);
t=-T:T:(n-2)*T;

plot(t,x2,'*')
axis([0 1.5 -2 2])
hold on
grid
plot(t,x2,'-')
hold off
ylabel('ESTIMATE ERROR,  X2')
xlabel('Time (sec)')
title('Fig. 8.8  Time history of reduced-order estimate error')
