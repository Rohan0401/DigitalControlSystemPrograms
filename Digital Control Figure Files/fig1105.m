%  Figure 11.5     Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0

clear
clf
F=[0 1;0 0];
G=[0;1];
Qc1=[1 0;0 0];
Qc2=.05; % yields s-plane roots at s=-1.5+-j1.5; Wb=3r/s
K=lqr(F,G,Qc1,Qc2);
Fcl=F-G*K;
e=eig(Fcl)
Rwpsd=1;     % an arbitrary value, but results are scaled to
%              continuous, so no matter.
C=G*Rwpsd*G'; 
X=lyap(Fcl,C) %Continuous covariance
rmsc1=sqrt(X(1,1));
Ws=[6 8 11 15 21 30 42 60 80 115 160 225 300];
Wb=abs(e(1))*1.4                    % approximate bandwidth
for j=1:13,
	T=2*pi/Ws(j);
	[phi,gam,K] = dclqr(F,G,Qc1,Qc2,T);
	phic = phi - gam*K;
	Cd=disrw(F,G,T,Rwpsd);
	X=dlyap(phic,Cd);
	rmsd1(j)=sqrt(X(1,1))/rmsc1;
end

semilogx(Ws/Wb,rmsd1),grid
axis([1 100 1 3])
title('Fig. 11.5  ')
xlabel('SAMPLING MULTIPLE,  Ws/Wb')
ylabel('DISCRETE/CONTINUOUS  RMS ')
