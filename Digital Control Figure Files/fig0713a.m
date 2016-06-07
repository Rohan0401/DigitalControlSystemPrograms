%  Figure 7.13a    Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab  v5.0
% script to generate Figure 7.13(a)  Rootlocus

clear
clf
 np = [1.0000    0.9672];
 dp=conv([1 -1],[1 -.9048]);
 npc=conv(np,[1 -.88]);
dpc=conv(dp,[1 .5]);
zgrid('new')
rlocus(npc,dpc)
 axis('square')
axis([-1.4 1 -1.2 1.2])
kp=.0484;
kc=13;
k=kp*kc;
 r=rlocus(npc,dpc,k); 
plot(real(r),imag(r),'*',real(r),imag(r),'*')
 title('Figure 7.13a  Rootlocus for compensated Antenna Design')
hold off
