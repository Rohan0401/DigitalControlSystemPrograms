%  Figure 9.6     Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0

clear
clf
F=[0 1;0 0];
G=[0;1];
T=1;
Qc1=[1 0;0 0];
Qc2=[10000 1 .5 .2 .1 .05 .02 .01];
% First find the s-plane roots for a continuous optimization
for j=1:8,
	K=lqr(F,G,Qc1,Qc2(j));
	e=eig(F-G*K);
	s(1,j)=e(1);
	s(2,j)=e(2);
end

plot(real(s(1,:)),imag(s(1,:)),'*b')
axis([-3 0 -3 3])
hold on
plot(real(s(2,:)),imag(s(2,:)),'*b')
plot(real(s(1,:)),imag(s(1,:)),'-b')
plot(real(s(2,:)),imag(s(2,:)),'-b')
zero = [0 0];
x=[-4 0];
plot(x,zero,'-w')
grid
title('Fig. 9.6')
xlabel('Real s')
ylabel('Imag s')
% Now convert continuous cost to equivalent discrete cost
% and do discrete optimization
for j=1:8,
	[K,s,e]=lqrd(F,G,Qc1,Qc2(j),T);
	z(1,j)=e(1);
	z(2,j)=e(2);
end
% convert roots to s-plane for comparison
s=log(z)/T;
plot(real(s(1,:)),imag(s(1,:)),'oy',real(s(2,:)),imag(s(2,:)),'oy')
text(-2.8,.1,'o  o  o  emulation design')
text(-2.8,.5,'*--*--*  continuous design')
hold off
