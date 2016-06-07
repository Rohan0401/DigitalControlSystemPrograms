%  Figure 8.26b     Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
%     response with integral control, full state feedback
%     with STATE COMMAND structure and zero to cancel integ pole
% Matlab v4.2 or v5.0

clf
clear
f=[0 1;
0 0];
g=[0;1];
h=[1 0];
T=.1;
[phi,gam]=c2d(f,g,T);

phia=[1 h;[0;0] phi];   % augment plant model with integral
gama=[0;gam];

zd2=[.8+i*.25;.8-i*.25;.9];
zd = zd2'         % put desired control poles on screen
ka=acker(phia,gama,zd2);
k=[ka(2) ka(3)];
[Nx,Nu,Nbar]=refi(phi,gam,h,k);
gk=gam*k;
phic=[1 h ;                  % closed-loop system matrix
       -gam*ka(1) phi-gk];
z=eig(phic);
zcl = z'       % put closed loop roots on screen to check

Nbarp=.75*Nbar;  %  modify Nbar so that zero is moved to z=.9
                 %  easiest is to use trial and error to move zero

gnb=gam*Nbarp;
B=[-1 0;gnb gam];

[num]=ss2zp(phic,B,[0 1 0],[0 0],1) % check that zero is at .9

n=61;
m=20;
% step command at t=0; disturbance, w, step of 5 at n
w=[zeros(m,1);5*ones(n-m,1)];
input=[ones(n,1) w];
hec= -ka;        % output is  u

d=[Nbarp 0];
[y,x]=dlsim(phic,B,hec,d,input);
u=y(:,1);
t=0:T:(n-1)*T;

plot(t,x(:,2),'o',t,x(:,3),'x'),grid
axis([0 6 -3 3])
hold on
plot(t,x(:,2),'-',t,x(:,3),'-')
zohplot(t',w/2,'-.')
us=u/5;
zohplot(t',us,'-')
hold off
ylabel('OUTPUTS')
xlabel('Time (sec)')
title('Fig. 8.26b Integral control with zero moved, Example 8.16')

text(4.1,-2.57,'--o---  X1')
text(4.1,-2.85,'--x---  X2')
text(4.1,-2.23,'------  U/5')
text(4.1,-1.8,'_._._._  w/2')