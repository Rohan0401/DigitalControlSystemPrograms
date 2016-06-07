%  Figure 8.25      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0
%     response without integral control, full state feedback
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

zd2=[.8+i*.25;.8-i*.25];
zd = zd2'
k=acker(phi,gam,zd2)
[Nx,Nu,Nbar]=refi(phi,gam,h,k);
gk=gam*k;
phic=[phi-gk];
z=eig(phic);
zcl = z'
hec= -k ;       % output is  u
d=[Nbar 0];
n=61;
m=20;
% step command at t=0; disturbance step,w, of 5 at n=20
w=[zeros(m,1);5*ones(n-m,1)];
input=[ones(n,1) w];
gnb=gam*Nbar;
B=[gnb gam];
[y,x]=dlsim(phic,B,hec,d,input);
u=y(:,1);
t=0:T:(n-1)*T;

plot(t,x(:,1),'o',t,x(:,2),'x'),grid
axis([0 6 -3 3])
hold on
plot(t,x(:,1),'-',t,x(:,2),'-')
zohplot(t',w/2,'-.')
us=u/5;
zohplot(t',us,'-')
hold off
ylabel('OUTPUTS')
xlabel('Time  (sec)')
title('Fig. 8.25  Response with no integral control, Example 8.16')
text(4.1,-2.57,'--o---  X1')
text(4.1,-2.9,'--x---  X2')
text(4.1,-2.23,'------  U/5')
text(4.1,-1.8,'_._._._  w/2')
