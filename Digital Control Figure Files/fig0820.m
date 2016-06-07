%  Figure 8.20      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0
%   example response using OUTPUT ERROR command
%   with the reduce-order estimator,
%   Uses transfer functions

clear
clf
f=[0 1;
0 0];
g=[0;1];
h=[1 0];
T=.1;
[phi,gam]=c2d(f,g,T);
z=eig(phi);
zol = z';
[gz,gp,kp]=ss2zp(phi,gam,h,0,1);
dz=.819;                          % D(z) zero
dp=.238;                        % D(z) pole
p=[gp;dp]; % poles
z=[gz;dz]; % zeros
[nud,ded] = zp2tf(z,p,kp);  % kp = plant gain
kd=27.5;                      % kd = D(z) gain
r=rlocus(nud,ded,kd);
[nu,de] = zp2tf(z,r',kp*kd);  % c.l. y transfer function
n = 31;
y=dstep(nu,de,n);
zu=[dz;gp];
[nu,de] = zp2tf(zu,r',kd);  % c.l. u transfer function
u=dstep(nu,de,n);
zv=[zu;0];
pv=[r';1];
[nu,de]= zp2tf(zv,pv,kd*T);  % c.l. v transfer function
v=dstep(nu,de,n);
t=0:T:(n-1)*T;

plot(t,y,'o',t,v,'x'),grid
axis([0 3 -5 5]);
hold on
plot(t,y,'-',t,v,'-')
us=u/10;
zohplot(t',us,'-')
hold off
ylabel('OUTPUTS')
xlabel('Time (sec)')
title('Fig. 8.20 output command for reduced-order estimator, Example 8.14')
text(2.1,-3.25,'--o---  X1')
text(2.1,-3.75,'--x---  X2')
text(2.1,-2.75,'------  U/10')
