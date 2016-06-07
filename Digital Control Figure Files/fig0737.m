%  Figure 7.37      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0
% Step response of direct design

clear
clf
dt=1;     %  sample period
tm=20;     %  problem time duration
                  %  Continuous Plant
kc = .1;
gcp = [0;-.1];
gcz =inf;
                  %  Discrete Plant
kp=.0484;
gz=[-.9672;inf];
gp=[1;.9048];
               %   compensation
k=13.068;
dz=[.9048;.07932];
dp=[-.9672;.41802];
z=[gz;dz];
p=[gp;dp];
[nud,ded] = zp2tf(z,p,kp);  % kp = plant gain
r=rlocus(nud,ded,k); % k = D(z) gain
[nu,de] = zp2tf(z,r,kp*k);  % c.l. transfer function
n=tm/dt + 1;
y=dstep(nu,de,n);    %  output at sample times
t=0:dt:tm;
axis([0 tm -1.4 1.4])
plot(t,y,'*')
ylabel('OUTPUT,  Y  and  CONTROL,  U/20')
xlabel('TIME   (SEC)')
title('Fig. 7.37 Step response of direct design')
grid
hold on
zu=[dz;gp];
[nu,de]=zp2tf(zu,r,k);
u=dstep(nu,de,n);   % control output at samples)
us=u/20;       % scaled control output at samples)
zohplot(t',us,'-');
                   % now fill in between samples
[nc,dc] = zp2tf(gcz,gcp,kc);  
dtc=dt/5;
tc=0:dtc:tm;
le=length(tc);
ut=ones(5,1)*u';
uc=ut(:);
uc=uc(1:le);
yc=lsim(nc,dc,uc,tc);
plot(tc,yc);
hold off

