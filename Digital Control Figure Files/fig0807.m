%  Figure 8.7       Digital Control of Dynamic Systems, 3e 
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

zd1=[.8+i*.25;.8-i*.25];
k=acker(phi,gam,zd1);
zd2=[.4+i*.4;.4-i*.4];
zd = zd2'
lt=acker(phi',h',zd2);
lp=lt';
lt=acker(phi',phi'*h',zd2);
lc=lt'

n=17;
ic=[0;1];
%y=dimpulse(phi-gam*k,ic,h,0,1,n);
%u=dimpulse(phi-gam*k,ic,k,0,1,n);
x1=dimpulse(phi-lc*h*phi,ic,h,0,1,n);
h2=[0 1];
x2=dimpulse(phi-lc*h*phi,ic,h2,0,1,n);
t=-T:T:(n-2)*T;

plot(t,x1,'o',t,x2,'*'),grid
axis([0 1.5 -2 2])
hold on
plot(t,x1,'-',t,x2,'-')
hold off
ylabel('ESTIMATE ERRORS, X1 and X2')
xlabel('Time (sec)')
title('Fig. 8.7  Time history of current estimator error')
text(1.1,-1.25,'--o--  X1')
text(1.1,-1.75,'--*--  X2')

