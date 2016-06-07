%  Figure 11.7     Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0

clear
clf
F=[0 1 0 0;
-.91 0 .91 0
0 0 0 1
.091 0 -.091 0]; % Resonance at 1 rad/sec, zeta=0
G=[0;0;0;1];
H=[1 0 0 0];
Qc1=[1  0 0  0
     0  0 0  0
     0  0 1  0
     0  0 0  0];
Qc2=10000; 
K=lqr(F,G,Qc1,Qc2);
Fcl=F-G*K;
s=eig(Fcl)
Wb1=abs(s(3))*1.4    % approximate bandwidth
Rwpsd=1;     % an arbitrary value, but results are scaled to
%              continuous, so no matter.
C=G*Rwpsd*G'; 
X=lyap(Fcl,C) %Continuous covariance
rmsc1=sqrt(X(1,1))
rmsd1=rmsc1; % precautionary to keep len(rmsd) < jmax
Ws=[ .5005 .6 .7  .8 .86 1.002 1.14 1.2 1.4 1.95 2.002 2.05 4  8 15];
for j=1:15,
	T=2*pi/Ws(j);
	[phi,gam]= c2d(F,G,T);
	z=exp(s*T);
	K = acker(phi,gam,z);
	phic = phi - gam*K;
	Cd=disrw(F,G,T,Rwpsd);
	X=dlyap(phic,Cd);
	rmsd1(j)=abs(sqrt(X(1,1))/rmsc1);
end
F=[0 1 0 0;
-.91 -.036 .91 .036
0 0 0 1
.091 .0036 -.091 -.0036]; % Resonance at 1 rad/sec, zeta=.02
K=lqr(F,G,Qc1,Qc2);
Fcl=F-G*K;
s=eig(Fcl)
Wb2=abs(s(3))*1.4    % approximate bandwidth
X=lyap(Fcl,C) %Continuous covariance
rmsc2=sqrt(X(1,1))
rmsd2=rmsc2;
for j=1:15,
	T=2*pi/Ws(j);
	[phi,gam]= c2d(F,G,T);
	z=exp(s*T);
	K = acker(phi,gam,z);
	phic = phi - gam*K;
	Cd=disrw(F,G,T,Rwpsd);
	X=dlyap(phic,Cd);
	rmsd2(j)=abs(sqrt(X(1,1))/rmsc2);
end

semilogx(Ws/Wb1,rmsd1,'o',Ws/Wb2,rmsd2,'*'),grid
axis([1 100 1 3])
hold on
semilogx(Ws/Wb1,rmsd1,'-',Ws/Wb2,rmsd2,'-')
title('Fig. 11.7  ')
xlabel('SAMPLING MULTIPLE,  Ws/Wb')
ylabel('DISCRETE/CONTINUOUS  RMS ')
text(25,2.05,'Plant damping')
text(20,1.85,'-o--o- zeta = 0')
text(20,1.65,'-*--*- zeta=0.02')

hold off
