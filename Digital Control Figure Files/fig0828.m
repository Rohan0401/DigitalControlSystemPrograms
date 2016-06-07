%  Figure 8.28      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
%     response using a prediction estimator
%     with STATE COMMAND structure, bias estimation & rejection
% Matlab v4.2 or v5.0

clear
clf
f=[0 1;
0 0];
g=[0;1];
h1=[1 0];
T=.1;
[phi,gam]=c2d(f,g,T);
z=eig(phi);

zd1=[.8+i*.25;.8-i*.25];
zd = zd1'
k1=acker(phi,gam,zd1)
fw=[0 1 0;
0 0 1;0 0 0];
gw=[0;1;0];
h=[1 0 0];
[phiw,gamw]=c2d(fw,gw,T);
zd2=[.4+i*.4;.4-i*.4;.9];
zest=zd2'
lt=acker(phiw',h',zd2);
lp=lt'
[Nx,Nu,Nbar]=refi(phi,gam,h1,k1);
k=[k1 1];
gk=gam*k;
lph=lp*h; 
phic=[phi -gk;
     lp*h1 phiw-gamw*k-lph];
z=eig(phic);

n=61;
m=20;
% step command at t=0; disturbance, w, step of 5 at n
w=[zeros(m,1);5*ones(n-m,1)];
input=[ones(n,1) w];
gnb=gam*Nbar;
hec=[ 0 0 -k] ;       % output is  u
d=[Nbar 0];
B=[gnb gam;gamw*Nbar zeros(3,1)];
[y,x]=dlsim(phic,B,hec,d,input);
u=y(:,1);
t=0:T:(n-1)*T;

plot(t,x(:,1),'o',t,x(:,2),'x'),grid
axis([0 6 -3 3])
hold on
plot(t,x(:,1),'-',t,x(:,2),'-')
plot(t,x(:,5)/2,'+')
zohplot(t',w/2,'-.')
us=u/5;
zohplot(t',us,'-')
hold off
ylabel('OUTPUTS')
xlabel('Time (sec)')
title('Fig. 8.28  Bias estimation, Example 8.17')
text(4.1,-2.23,'--o---  X1')
text(4.1,-2.57,'--x---  X2')
text(4.1,-2.9,'+  +  +  W bar/2')
text(4.1,-1.9,'------  U/5')
text(4.1,-1.57,'_._._._  w/2')

