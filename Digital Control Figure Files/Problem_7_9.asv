%  Problem 7.9      Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab 4.2 or 5.0
% Step response of the 5Hz controller

clear
clf
dt=.5;     %  sample period
tm=20;     %  problem time duration
                  %  Continuous Plant G(s)=0.1/(s(s+0.1)):
kc = .1;
gcp = [0;-.1];
gcz =inf;
                  %  Discrete Plant
kp=.0123;
gz=[-.9835;inf];
gp=[1;.9512];
               %   compensation
k=8.06;
dp=.6061;
dz=.9512;
z=[gz;dz];
p=[gp;dp];
[nud,ded] = zp2tf(z,p,kp);  % kp = plant gain
r=rlocus(nud,ded,k); % k = D(z) gain
[nu,de] = zp2tf(z,r,kp*k);  % c.l. transfer function
n=tm/dt + 1;
y=dstep(nu,de,n);    %  output at sample times
t=0:dt:tm;
plot(t,y,'*')
axis([0 tm -.4 1.4])
ylabel('OUTPUT,  Y  and  CONTROL,  U/10')
xlabel('TIME   (SEC)')
title('Fig. 7.06  Step response of the 5Hz controller')
grid
hold on
plot(t,y,'-')
zu=[dz;gp];
[nu,de]=zp2tf(zu,r,k);
u=dstep(nu,de,n);   % control output at samples)
us=u/10;       % scaled control output at samples)
zohplot(t',us,'-')
hold off
