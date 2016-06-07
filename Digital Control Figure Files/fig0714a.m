%  Figure 7.14a     Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab  v5.0

clear
clf
 np = [1.0000    0.9672];
dp =  [1.0000   -1.9048    0.9048];
 dpc=conv(dp,[1 .8]);
npc=conv(np,[1 -.8]);
zgrid('new')
k=0:.002:5;
r=rlocus(npc,dpc,k);
plot(real(r),imag(r),'r-',real(r),imag(r),'r-')
pzmap(npc,dpc)
 axis('square')
axis([-1.4 1 -1.2 1.2])
kp=.0484;
kc=9;
ko=kp*kc;
 rc=rlocus(npc,dpc,ko); 
plot(real(rc),imag(rc),'*',real(rc),imag(rc),'*')

title(' Figure 7.14(a)  Rootlocus for Compensated Antenna Design')
