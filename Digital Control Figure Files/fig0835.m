%  Figure 8.35      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
%     response using a prediction estimator
%     with STATE COMMAND structure
%     one cycle delay on sensor
% Matlab v4.2 or v5.0

clear
clf

% plant with no delay
f=[0 1;
0 0];
g=[0;1];
h=[1 0];
T=.1;
[phi,gam]=c2d(f,g,T);
zd1=[.8+i*.25;.8-i*.25];
zd = zd1'
k=acker(phi,gam,zd1)   % feedback gain for system w/o delay

% now add delay on sensor
Phi=[phi [0;0];[h 0]];
Gam=[gam;0];
H=[0 0 1];

% desired poles same, plus a pole at z=0
zd2=[.8+i*.25;.8-i*.25;0];
zd = zd2'
K=acker(Phi,Gam,zd2)

% check observability
O=[H;H*Phi;H*Phi*Phi];   % observability matrix for prediction est
Detp = det(O)    % determinant should be nonzero for observability
Oc=O*Phi;        % observability matrix for current est
Detc = det(Oc)

% find estimator gain, Lp, with same poles plus pole at z=0
zd3=[.4+i*.4;.4-i*.4;0];
zd = zd3'
lt=acker(Phi',H',zd3);
lp=lt'
lc=place(Phi',(H*Phi)',zd3)'

% form combined system with command input
[Nx,Nu,Nbar]=refi(Phi,Gam,H,K)
gk=Gam*K;
lph=lp*H; 
phic=[Phi -gk;
     lph Phi-gk-lph];
z=eig(phic);
zcl = z'           % check CL roots
hec=[0 0 0 -K];        % output is  u

% compute step response
d=[Nbar];
n=31;
gnb=Gam*Nbar;
B=[gnb;gnb];
[y,x]=dstep(phic,B,hec,d,1,n);
u=y(:);
t=0:T:(n-1)*T;

plot(t,x(:,1),'o',t,x(:,3),'*',t,x(:,2),'x'),grid
axis([0 3 -5 5])
hold on
plot(t,x(:,1),'-',t,x(:,3),'-',t,x(:,2),'-')
us=u/5;
zohplot(t',us,'-')
hold off
ylabel('OUTPUTS')
xlabel('Time (sec)')
title('Fig. 8.35 Step response for Example 8.21')
text(2.1,-3.25,'--o---  X1   (y)')
text(2.1,-4.25,'--*---  X3   (yd)')
text(2.1,-3.75,'--x---  X2')
text(2.1,-2.75,'------  U/5')

