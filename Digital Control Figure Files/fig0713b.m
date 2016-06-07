%  Figure 7.13b    Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab 4.2 or 5.0

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
k=13;
dz=.88;
dp=-.5;
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
ylabel('OUTPUT,  Y  and  CONTROL,  U/10')
xlabel('TIME   (SEC)')
title('Fig. 7.13(b)  Step Response of Compensated Antenna')
grid
hold on
zu=[dz;gp];
[nu,de]=zp2tf(zu,r,k);
u=dstep(nu,de,n);   % control output at samples)
us=u/10;       % scaled control output at samples)
zohplot(t',us,'-')
                   % now fill in between samples
[nc,dc] = zp2tf(gcz,gcp,kc);  
dtc=dt/5;
tc=0:dtc:tm;
le=length(tc);
ut=ones(5,1)*u';
uc=ut(:);
uc=uc(1:le);
yc=lsim(nc,dc,uc,tc);
plot(tc,yc)
 hold off
