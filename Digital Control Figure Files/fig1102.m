%  Figure 11.2     Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0

clear
clf
F=[0 1;
0 0];
G=[0;1];
H=[1 0];
i=sqrt(-1);
wb=3;
s=.5*wb*[-1+i;-1-i]

T=.5
[phi,gam]=c2d(F,G,T);
zd = exp(s*T)
K=acker(phi,gam,zd);
phic= phi-gam*K;
Nx=[1;0];
Tf=3.5;
n=Tf/T+1;
[u,x]=dstep(phic,gam*K*Nx,-K,K*Nx,1,n);
t=0:T:Tf;
wt=t*wb;
subplot(2,2,1)
plot(wt,x(:,1),'o',wt,x(:,2),'x'),grid
axis([0 3*wb -.4 1.2])
hold on
us=u/4;
zohplot(wt',us,'-')
                   % now fill in between samples
dtc=T/5;
[phi,gam]=c2d(F,G,dtc);
tc=0:dtc:Tf;
le=length(tc);
ut=ones(5,1)*u';
uc=ut(:);
uc=uc(1:le);
[yc,xc]=dlsim(phi,gam,H,0,uc);
wtc=wb*tc;
plot(wtc,xc(:,1),'-',wtc,xc(:,2),'-')
ylabel('OUTPUTS')
xlabel('Wb*t  (rad)')
title('11.2 (a)   Ws/Wb = 4')
text(5.1,.7,'--o--  X1')
text(5.1,.5,'--x--  X2')
text(5.1,.3,'-----  U/4')
hold off

T=.25 %                        2nd plot & T
[phi,gam]=c2d(F,G,T);
zd = exp(s*T)
K=acker(phi,gam,zd);
phic= phi-gam*K;
n=Tf/T+1;
[u,x]=dstep(phic,gam*K*Nx,-K,K*Nx,1,n);
t=0:T:Tf;
wt=t*wb;
subplot(2,2,2)
plot(wt,x(:,1),'o',wt,x(:,2),'x'),grid
axis([0 3*wb -.4 1.2])
hold on
us=u/4;
zohplot(wt',us,'-')
                   % now fill in between samples
dtc=T/5;
[phi,gam]=c2d(F,G,dtc);
tc=0:dtc:Tf;
le=length(tc);
ut=ones(5,1)*u';
uc=ut(:);
uc=uc(1:le);
[yc,xc]=dlsim(phi,gam,H,0,uc);
wtc=wb*tc;
plot(wtc,xc(:,1),'-',wtc,xc(:,2),'-')
hold off
ylabel('OUTPUTS')
xlabel('Wb*t  (rad)')
title('11.2 (b)   Ws/Wb = 8')
text(5.1,.7,'--o--  X1')
text(5.1,.5,'--x--  X2')
text(5.1,.3,'-----  U/4')
axis
hold off

T=.1 %                        3rd plot & T
[phi,gam]=c2d(F,G,T);
zd = exp(s*T)
K=acker(phi,gam,zd);
phic= phi-gam*K;
n=Tf/T+1;
[u,x]=dstep(phic,gam*K*Nx,-K,K*Nx,1,n);
t=0:T:Tf;
wt=t*wb;
subplot(2,2,3)
plot(wt,x(:,1),'o',wt,x(:,2),'x'),grid
axis([0 3*wb -.4 1.2])
hold on
us=u/4;
zohplot(wt',us,'-')
                   % now fill in between samples
dtc=T/5;
[phi,gam]=c2d(F,G,dtc);
tc=0:dtc:Tf;
le=length(tc);
ut=ones(5,1)*u';
uc=ut(:);
uc=uc(1:le);
[yc,xc]=dlsim(phi,gam,H,0,uc);
wtc=wb*tc;
plot(wtc,xc(:,1),'-',wtc,xc(:,2),'-')
hold off
ylabel('OUTPUTS')
xlabel('Wb*t  (rad)')
title('11.2 (c)   Ws/Wb = 20')
text(5.1,.7,'--o--  X1')
text(5.1,.5,'--x--  X2')
text(5.1,.3,'-----  U/4')
axis
hold off

T=.05 %                        4th plot & T
[phi,gam]=c2d(F,G,T);
zd = exp(s*T)
K=acker(phi,gam,zd);
phic= phi-gam*K;
n=Tf/T+1;
[u,x]=dstep(phic,gam*K*Nx,-K,K*Nx,1,n);
t=0:T:Tf;
wt=t*wb;
subplot(2,2,4)
plot(wt,x(:,1),'o',wt,x(:,2),'x'),grid
axis([0 3*wb -.4 1.2])
hold on
us=u/4;
zohplot(wt',us,'-')
                   % now fill in between samples
dtc=T/5;
[phi,gam]=c2d(F,G,dtc);
tc=0:dtc:Tf;
le=length(tc);
ut=ones(5,1)*u';
uc=ut(:);
uc=uc(1:le);
[yc,xc]=dlsim(phi,gam,H,0,uc);
wtc=wb*tc;
plot(wtc,xc(:,1),'-',wtc,xc(:,2),'-')
hold off
ylabel('OUTPUTS')
xlabel('Wb*t  (rad)')
title('11.2 (d)   Ws/Wb = 40')
text(5.1,.7,'--o--  X1')
text(5.1,.5,'--x--  X2')
text(5.1,.3,'-----  U/4')


