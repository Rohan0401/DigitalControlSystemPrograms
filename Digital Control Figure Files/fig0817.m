%  Figure 8.17      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0
%     response using a prediction estimator
%     with STATE COMMAND structure

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
zd2=[.4+i*.4;.4-i*.4];
zd = zd2'
lt=acker(phi',h',zd2);
lp=lt'
[Nx,Nu,Nbar]=refi(phi,gam,h,k)
gk=gam*k;
lph=lp*h; 
phic=[phi -gk;
     lph phi-gk-lph];
z=eig(phic);
zcl = z'
hec=[0 1 0 -1;     % output is  xhat2 - x2
     0 0 -k];        % output is  u
d=[0;Nbar];
n=31;
gnb=gam*Nbar;
B=[gnb;gnb];
[y,x]=dstep(phic,B,hec,d,1,n);
e=y(:,1);
u=y(:,2);
t=0:T:(n-1)*T;

plot(t,x(:,1),'o',t,e,'*',t,x(:,2),'x'),grid
axis([0 3 -5 5])
hold on
plot(t,x(:,1),'-',t,e,'-',t,x(:,2),'-')
us=u/5;
zohplot(t',us,'-')
hold off
ylabel('OUTPUTS')
xlabel('Time (sec)')
title('Fig. 8.17 Step response for Example 8.12')
text(2.1,-3.25,'--o---  X1')
text(2.1,-4.25,'--*---  X2 TILDE')
text(2.1,-3.75,'--x---  X2')
text(2.1,-2.75,'------  U/5')

