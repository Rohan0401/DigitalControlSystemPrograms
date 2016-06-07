%  Figure 9.5       Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v5.0

clear
clf
f=[0 1 0 0;
-.91 -.036 .91 .036
0 0 0 1
.091 .0036 -.091 -.0036];
g=[0;0;0;1];
h=[1 0 0 0];
J=0;
T=.4;
[phi,gam]=c2d(f,g,T);
zgrid
r=1;
q=logspace(-3,9,100);
for i=1:100,
  Q=diag([q(i);0;0;0]);
  [k,s,e]=dlqr(phi,gam,Q,r);
  ev(:,i)=e;
  end

plot(real(ev(1,:)),imag(ev(1,:)))
hold on
axis([-1 1 -1 1])
axis('square')
plot(real(ev(2,:)),imag(ev(2,:)))
plot(real(ev(3,:)),imag(ev(3,:)))
plot(real(ev(4,:)),imag(ev(4,:)))
pzmap(phi,gam,h,J)
pcr=[.9;.9;.8;.8];
pci=[.08;-.08;.4;-.4];
for k=1:4,
 plot(pcr(k),pci(k),'g*')
end
title('Fig. 9.5  Locus of optimal roots for Example 9.5')
hold off