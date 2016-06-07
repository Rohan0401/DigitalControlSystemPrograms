%  Figure 8.31      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
%     response using a prediction estimator
%     with STATE COMMAND structure for sinusoidal output disturbance
% Matlab v4.2 or v5.0

clear
clf
f=[0 1;
0 0];
g=[0;1];
H=[1 0];
T=.1;
[phi,gam]=c2d(f,g,T);

zd1=[.8+i*.25;.8-i*.25];
k1=acker(phi,gam,zd1)

% sinusoidal disturbance

Wor=15;    % rpm
Wo=Wor/60*2*pi;     % rad/sec

Fd=[0 1;-Wo^2 0];
oscc=eig(Fd)     % check continuous roots
[phid,gamd]=c2d(Fd,[0;0],T);
oscd=eig(phid)   % compute discrete roots for comparison later

% form the augmented plant

Gd=[0 0;0 0];
Fw=[f Gd;[0 0;0 0] Fd];
Gw=[0;1;0;0];
Hw=[H 1 0];

[phiw,gamw]=c2d(Fw,Gw,T);

% place estimator poles
zd2=[.8+i*.2;.8-i*.2;.95+i*.05;.95-i*.05];
zd = zd2';
lt=acker(phiw',Hw',zd2);
lp=lt'

[Nx,Nu,Nbar]=refi(phi,gam,H,k1);
k=[k1 0 0];     % only feedback undisturbed part of state 

% form phi for state plus estimated state

gk=gamw*k;
lph=lp*Hw; 
phic=[phiw  -gk;
     lph phiw-gamw*k-lph];
z=eig(phic);
zcl = z'

n=101;  % duration
m=50;   % command time

% step command at t=5; 
r=[zeros(m,1);ones(n-m,1)];

gnb=gamw*Nbar;

d=0;
ic=[0 0 .3 0 0 0 0 0];  % only initial condition is for sinusoid
B=[gnb ;gnb];
Hc=[Hw 0 0 0 0];
[y,x]=dlsim(phic,B,Hc,d,r,ic);

t=0:T:(n-1)*T;

plot(t,x(:,1),'o'),grid
axis([0 10 -3 3])
hold on
plot(t,x(:,1),'-',t,x(:,3),'-')
plot(t,x(:,7),'+',t,y,'.')

hold off
ylabel('OUTPUTS')
xlabel('Time (sec)')
title('Fig. 8.31  Sinusoidal output disturbance rejection, Example 8.19')
text(4.1,-2.23,'---o---  X1, output y')
text(4.1,-2.57,'--------  w, disturbance')
text(4.1,-2.9,'+ + +  w bar, disturbance estimate')
text(4.1,-1.9,'          X1+w, measured output, y`')
text(4.1,-1.8,'. . . . .')

