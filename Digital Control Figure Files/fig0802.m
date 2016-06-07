%  Figure 8.2       Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0

clear
clf
f=[0 1 0 0;
-.91 -.036 .91 .036
0 0 0 1
.091 .0036 -.091 -.0036];
g=[0;0;0;1];
h=[1 0 0 0];
T=.4;
[phi,gam]=c2d(f,g,T);
z=eig(phi);
zol = z'
zd1=[.9;.9;.9;.9];
zd = zd1'
k1=acker(phi,gam,zd1)
n=102;
b=[1;0;0;0];
y1=dimpulse(phi-gam*k1,b,h,0,1,n);
u1=dimpulse(phi-gam*k1,b,-k1,0,1,n);
t=-T:T:(n-2)*T;

subplot(2,1,1)
plot(t,y1,'--'),grid
axis([0 40 -12 2])
ylabel('d  and  u')
title('Fig. 8.2(a), all roots at z=0.9')
hold on
zohplot(t',u1,'-')
hold off

zd2=[.9+i*.05;.9-i*.05;.8+i*.4;.8-i*.4];
zd = zd2'
k2=acker(phi,gam,zd2)
n=102;
b=[1;0;0;0];
y2=dimpulse(phi-gam*k2,b,h,0,1,n);
u2=dimpulse(phi-gam*k2,b,-k2,0,1,n);
t=-T:T:(n-2)*T;

subplot(2,1,2)
plot(t,y2,'--'),grid
axis([0 40 -12 2])
ylabel('d  and  u')
xlabel('Time  (sec)')
title('Fig. 8.2(b), roots at z=0.9+-j0.05, 0.8+-j0.4')
text(15,-6,'------------- control, u')
text(15,-8,'              output, y')
text(15,-7.8,'.............')
hold on
zohplot(t',u2,'-')
hold off
