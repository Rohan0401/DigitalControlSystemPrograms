%  Figure 7.15a     Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab  v5.0

clear
clf
np = [1.0000    0.9672];
 dp = [ 1.0000   -1.9048    0.9048];
 npc=conv(np,[1 -.88]);
dpc=conv(dp,[1 .5 0]);
zgrid('new')
axis('square')
axis([-1.2 1.2 -1.2 1.2])
k=0:.002:1;
K=[k 100];
r=rlocus(npc,dpc,K);
plot(real(r),imag(r),'b-',real(r),imag(r),'b-')
pzmap(npc,dpc)
kp=.0484;
kc=13;
ko=kp*kc;
 rc=rlocus(npc,dpc,ko); 
plot(real(rc),imag(rc),'*',real(rc),imag(rc),'*')

 title(' Fig.7.15(a) Rootlocus for compensated Antenna Design')
