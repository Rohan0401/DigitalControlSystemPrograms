%  Figure 8.37      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
%     response using a prediction estimator
%     with STATE COMMAND structure
%     one cycle delay on actuator
% Matlab v4.2 or v5.0

clear
clf

% plant with no delay
f=-.3;
g=.3;
h=1;
T=.2;
[phi,gam]=c2d(f,g,T);
zd1=.4;
zd = zd1'
k=acker(phi,gam,zd1)   % feedback gain for system w/o delay

% form combined system with command input
[nx,nu,nbar]=refi(phi,gam,h,k)  
gk=gam*k;
phic=[phi-gk];    
    
z=eig(phic);
zcl = z'           % check CL roots
hec=[-k];        % output is  u

% compute step response
d=[nbar];     % need feedforward term to kill ss error
n=31;
gnb=gam*nbar;
b=[gnb];
[y,x]=dstep(phic,b,hec,d,1,n);
u=y(:);
t=0:T:(n-1)*T;

subplot(2,2,1)
plot(t,x(:,1),'o'),grid
axis([0 3 -4 4])
hold on
plot(t,x(:,1),'-')
zohplot(t',u/3,'-')
hold off
ylabel('OUTPUTS')
xlabel('Time (sec)')
title('Fig. 8.37(a) Ideal case (w/o delay, K=9.3)')
text(1.55,-2.5,'---o----  Y')
text(1.55,-1.5,'---------  U/3')

% now add delay on actuator
Phi=[phi gam;0 0];
Gam=[0;1];
H=[1 0];

% desired poles same, plus a pole at z=0
zd3=[.4;0];
K=acker(Phi,Gam,zd3)

% check observability
O=[H;H*Phi];   % observability matrix for prediction est
Detp = det(O)    % determinant should be nonzero for observability

% find estimator gain, Lp
zd4=[.2;0];
lt=acker(Phi',H',zd4);
Lp=lt'

% form combined system with command input
[Nx,Nu,Nbar]=refi(Phi,Gam,H,K)
Gk=Gam*K;
Lph=Lp*H; 
Phic=[Phi -Gk;
     Lph Phi-Gk-Lph];
z=eig(Phic);
zcl = z'           % check CL roots
Hec=[0 0 0 1];        % output is  Ud

% compute step response
D=[Nbar];
n=31;
Gnb=Gam*Nbar;
B=[Gnb;Gnb];
[y,x]=dstep(Phic,B,Hec,D,1,n);
u=y(:);
t=0:T:(n-1)*T;
subplot(2,2,3)
plot(t,x(:,1),'o'),grid
axis([0 3 -4 4])
hold on
plot(t,x(:,1),'-')
zohplot(t',x(:,2)/3,'-')
hold off
ylabel('OUTPUTS')
xlabel('Time (sec)')
title('(c) estimator w/delay, K=9.3')
text(1.55,-2.5,'---o----  Y')
text(1.55,-1.5,'---------  Ud/3')

% now do case with delay wo estimator using same feedback as (a)

gk3=Gam*[k 0];
phic3=[Phi-gk3];    
    
z=eig(phic3);
zcl = z'           % check CL roots
hec=[0 1];        % output is  Ud

% compute step response
d=[nbar];     % need feedforward term to kill ss error
n=31;
gnb=Gam*nbar;
b=[gnb];
[y,x]=dstep(phic3,b,hec,d,1,n);
u=y(:);
t=0:T:(n-1)*T;

subplot(2,2,2)
plot(t,x(:,1),'o'),grid
axis([0 3 -4 4])
hold on
plot(t,x(:,1),'-')
zohplot(t',x(:,2)/3,'-')
hold off
ylabel('OUTPUTS')
xlabel('Time (sec)')
title('(b) classical FB w/delay, K=9.3')
text(1.55,-2.5,'---o----  Y')
text(1.55,-1.5,'---------  Ud/3')

% By trial and error, find a k that cuts overshoot.

k=4
[nx,nu,nbar]=refi(phi,gam,h,k);  
gk4=Gam*[k 0];
phic4=[Phi-gk4];    
    
z=eig(phic4);
zcl = z'           % check CL roots
hec=[0 1];        % output is  Ud

% compute step response
d=[nbar];     % need feedforward term to kill ss error
n=31;
gnb=Gam*nbar;
b=[gnb];
[y,x]=dstep(phic4,b,hec,d,1,n);
u=y(:);
t=0:T:(n-1)*T;

subplot(2,2,4)
plot(t,x(:,1),'o'),grid
axis([0 3 -4 4])
hold on
plot(t,x(:,1),'-')
zohplot(t',x(:,2)/3,'-')
hold off
ylabel('OUTPUTS')
xlabel('Time (sec)')
title('(d) classical FB w/delay, K=4')
text(1.55,-2.5,'---o----  Y')
text(1.55,-1.5,'---------  Ud/3')