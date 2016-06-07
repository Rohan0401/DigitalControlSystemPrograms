%  Figure 8.33      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
%     response using a prediction estimator
%     with STATE COMMAND structure for sinusoidal  command input
%     modified by gff, june, 1997
% Matlab v4.2 or v5.0

clear
clf
f=[0 1;
0 0];
g=[0;1000];
H=[1 0];
T=1/2000;
[phi,gam]=c2d(f,g,T);

Wn=1000; %  rad/sec, desired freq for 2 msec tr
Z=.6;    % desired root damping
p1=roots([1 2*Z*Wn Wn^2]);
z1=exp(p1*T);

K=acker(phi,gam,z1)

% sinusoidal  input

Wor=5000;    % rpm
Wo=Wor/60*2*pi;     % rad/sec

Fd=[0 1;-Wo^2 0];
% compute the discrete virtual input
phir=expm(Fd*T);
Hr=[1 0];

% form the augmented plant

gamw=[ gam;0 ;0];
phiw=[phi gam*Hr ; 0*phi phir];

Hw=[H 0 0];   % output is error

% place estimator poles
Wn=1000; %  rad/sec, desired freq 
Z=.9;    % desired root damping
p2=roots([1 2*Z*Wn Wn^2]);
p3=1.2*p2;
z2=exp(p2*T);
z3=exp(p3*T);
zd2=[z2;z3];
lt=acker(phiw',Hw',zd2);
Lw=lt'
Lx=Lw(1:2);
Lr=Lw(3:4);

% form phi for state plus estimated state

 A=phi-gam*K-Lx*H;
 
phic=[phi  -gam*K -gam*Hr; 
      Lx*H A 0*gam*Hr;
      Lr*H -Lr*H phir];
gamc=[0;0; -Lx;-Lr];
Hc=[-H 0 0 0 0];
Jc=1;
x0=zeros(6,1); % no initial conditions this time
n=81;  % duration
m=20;   % command time
j=0:n-1;
r=[ sin(Wo*T*j)']; 



% output error 
[y,x]=dlsim(phic,gamc,Hc,Jc,r);

t=0:T*1000:(n-1)*T*1000;

plot(t,y,'o'),grid         % y', track following quality
axis([0 30 -1 1.5])
hold on
plot(t,r,'-')  % plot  input
% plot(t,x(:,7),'+')  % plot w bar and u

ylabel('OUTPUTS')
xlabel('Time (msec)')
title('Fig. 8.33  Sinusoidal  command following, Example 8.20')
text(10.1,-.4,'o  o  o  o    e, with command following')
text(10.1,-.6,'-------------    r (reference)')
% text(10.1,-.75,'+  +  +  +   w bar (disturbance estimate)')
% text(10.1,-.9,'                 y`, without disturbance following')
% text(10.1,-.87,'. . . . . . . .')


hold off

