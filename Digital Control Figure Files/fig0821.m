%  Figure 8.21      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0

clear
clf
clear
Wrz=1000;  %  resonant freq in Hz
zeta=.05;
Wr=Wrz*2*pi;  % rads/sec

nump=1;
denp=[1 2*zeta*Wr Wr^2 0 0];
[A,B,C,D]=tf2ss(nump,denp);  % SS system description
Ws=6000;  
T=1/Ws;
[phi,gm]=c2d(A,B,T);
gam=gm*1e8;
h=C;
J=D;

%    Find controller gain
Wn=200;    % desired freq for tr = 10 msec
Z=.6;    % desired root damping
p1=roots([1 2*Z*Wn Wn^2]);
z1=exp(p1*T);

Wn=Wr;    % desired  freq
Z=.06;    % desired  damping
p1=roots([1 2*Z*Wn Wn^2]);
z2=exp(p1*T);
p=[z1;z2];  % desired control root locations

k=acker(phi,gam,p);

%        Find estimator gain
Wn=400;    % desired  freq
Z=.7;    % desired  damping
p1=roots([1 2*Z*Wn Wn^2]);
z1=exp(p1*T);

Wn=2*Wr;    % desired  freq
Z=.7;    % desired root damping
p1=roots([1 2*Z*Wn Wn^2]);
z2=exp(p1*T);

p=[z1;z2];  % desired estimator root locations
lp=place(phi',h',p)';

[Nx,Nu,Nbar]=refi(phi,gam,h,k);
gk=gam*k;
lph=lp*h; 
phic=[phi -gk;
     lph phi-gk-lph];
z=eig(phic);

hc=[h 0 0 0 0];  

n=301;
gnb=gam*Nbar;
B1=[gnb;gnb];
B2=[[0;0;0;0];-lp];
[y1,x]=dstep(phic,B1,hc,J,1,n);
[y2,x]=dstep(phic,B2,hc,J,1,n);
t=0:T:(n-1)*T;


% Classical design to find lead compensator
% First do continuous design

numd=[1 40];      % x 5 below desired crossover, 200 r/s
dend=[1 1000];    % x 5 above desired crossover
%num=conv(nump,numd);
%den=conv(denp,dend);
K=8000
%bode(num*10e8*K,den)  .... iterate on K until crossover OK
%[numcl,dencl]=feedback(num*10e8*K,den,1,1);
%damp(dencl)
%step(numcl,dencl,t)

[numdd,dendd]=c2dm(K*numd,dend,T,'matched');
[numpd,denpd]=c2dm(10e8*nump,denp,T,'zoh');
[z,p,kk]=tf2zp(numdd,dendd)   % compensation
nu=conv(numdd,numpd);
de=conv(dendd,denpd);
[numcld,dencld]=feedback(nu,de,1,1);
y3=dstep(numcld,dencld,n);

plot(t*1000,y1,'-',t*1000,y2,'o',t*1000,y3,'.'),grid
axis([0 50 0 2.5])
title('Fig. 8.21  Disk head response, Example 8.15')
xlabel('Time (msec)')
ylabel('output')
text(15,2.3,'------------  state command structure')
text(15,2.1,'ooooooooo  output error command')
text(15,1.9,'                classical design')
text(15,1.92,'..............')      





