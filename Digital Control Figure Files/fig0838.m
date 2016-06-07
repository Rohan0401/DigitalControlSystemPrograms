%  Figure 8.38      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
%     effect of actuator delay with disturbance
%     response using classical fb, no delay
%     response using classical fb, with delay
%     response using a prediction estimator
% Matlab v4.2 or v5.0

clear
clf

%     one cycle delay on actuator

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
gk=gam*k;
phic=[phi-gk];    
    
z=eig(phic);
zcl = z'           % check CL roots
hec=[-k];        % output is  u

% compute impulse response to disturbance w
d=0;
n=31;

b=gam*40;        % Input value of w impulse
[y,x]=dimpulse(phic,b,hec,d,1,n);
u=y(:);
t=0:T:(n-1)*T;

subplot(2,2,1)
plot(t,x(:,1),'o'),grid
axis([0 3 -4 4])
hold on
plot(t,x(:,1),'-')
zohplot(t',u/4,'-')
hold off
ylabel('OUTPUTS')
xlabel('Time (sec)')
title('Fig. 8.38(a) Ideal case (w/o delay, K=9.3)')
text(1.55,-2.5,'---o----  Y')
text(1.55,-1.5,'---------  U/4')

% now add delay on actuator
Phi=[phi gam;0 0];
Gam=[0;1];
H=[1 0];

% desired poles same, plus a pole at z=0
zd3=[.4;0];
K=acker(Phi,Gam,zd3)

% find estimator gain, Lp
zd4=[.2;0];
lt=acker(Phi',H',zd4);
Lp=lt'

% form combined system
Gk=Gam*K;
Lph=Lp*H; 
Phic=[Phi -Gk;
     Lph Phi-Gk-Lph];
z=eig(Phic);
zcl = z'           % check CL roots
Hec=[0 0 0 1];        % output is  Ud

% compute impuse response to disturbance, w
D=0;
Gnb=[b;0];
B=[Gnb;[0;0]];
[y,x]=dimpulse(Phic,B,Hec,D,1,n);

subplot(2,2,3)
plot(t,x(:,1),'o'),grid
axis([0 3 -4 4])
hold on
plot(t,x(:,1),'-')
zohplot(t',x(:,2)/4,'-')
hold off
ylabel('OUTPUTS')
xlabel('Time (sec)')
title('(c) Pred. estimator w/delay, K=9.3')
text(1.55,-2.5,'---o----  Y')
text(1.55,-1.5,'---------  Ud/4')

% By trial and error, find a k that cuts overshoot.

k=4
gk4=Gam*[k 0];
phic4=[Phi-gk4];    
    
z=eig(phic4);
zcl = z'           % check CL roots
hec=[0 1];        % output is  Ud

% compute impulse response
[y,x]=dimpulse(phic4,Gnb,hec,d,1,n);

subplot(2,2,2)
plot(t,x(:,1),'o'),grid
axis([0 3 -4 4])
hold on
plot(t,x(:,1),'-')
zohplot(t',x(:,2)/4,'-')
hold off
ylabel('OUTPUTS')
xlabel('Time (sec)')
title('(b) Classical FB w/delay, K=4')
text(1.55,-2.5,'---o----  Y')
text(1.55,-1.5,'---------  Ud/4')

% Now do current estimator

% find estimator gain, Lc
zd4=[.2;0];
ltc=place(Phi',(H*Phi)',zd4);
Lc=ltc'

% form combined system 
Gk=Gam*K;
Lchp=Lc*H*Phi; 
Phic=[Phi -Gk;
     Lchp Phi-Gk-Lchp];
z=eig(Phic);
zcl = z'           % check CL roots
Hec=[0 0 0 1];        % output is  Ud

% compute impulse response to disturbance, w
D=0;
Gnb=[b;0];
B=[Gnb;Lc*H*Gnb];
[y,x]=dimpulse(Phic,B,Hec,D,1,n);

subplot(2,2,4)
plot(t,x(:,1),'o'),grid
axis([0 3 -4 4])
hold on
plot(t,x(:,1),'-')
zohplot(t',x(:,2)/4,'-')
hold off
ylabel('OUTPUTS')
xlabel('Time (sec)')
title('(d) Cur. estimator w/delay, K=9.3')
text(1.55,-2.5,'---o----  Y')
text(1.55,-1.5,'---------  Ud/4')