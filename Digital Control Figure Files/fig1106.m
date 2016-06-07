%  Figure 11.6     Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0

clear
clf
F=[0 1;0 0];
G=[0;1];
H=[1 0];
Qc1=[1 0;0 0];
Qc2=.05; % yields s-plane roots at s=-1.5+-j1.5 Wn=2r/s,Wb=3r/s;
K=lqr(F,G,Qc1,Qc2);
Fcl=F-G*K;
s=eig(Fcl);
Rv=1;
Rw=500; % yields s-plane roots at s=-3.3+-j3.3,Wn=4.6r/s
L=lqe(F,G,H,Rw,Rv);
Fe=F-L*H;
se=eig(Fe);
Fcle = [F  -G*K;L*H  F-G*K-L*H];
Ga=[G;zeros(2,1)];
Rwpsd=1;
Rqq8=[.0065 0;0 .0065];  % approximates 8 bit word size if
%   continuous vel noise is 2% of full scale.
Rqq7=[.026 0;0 .026];  % 7 bit quantization noise
Rqq9=[.0016 0;0 .0016];  % 9 bit quantization noise
C=Ga*Rwpsd*Ga'; 
X=lyap(Fcle,C) %Continuous covariance
rmsc1=sqrt(X(1,1));
rmsc2=sqrt(X(2,2))     % rms of continuous vel noise
Ws=[6 8 11 15 21 30 42 60 80 115 160 225 300];
Wb=abs(s(1))*1.4                    % approximate bandwidth
for j=1:13,
	T=2*pi/Ws(j);
	[phi,gam]= c2d(F,G,T);
	z=exp(s*T);
	ze=exp(se*T);
	K = acker(phi,gam,z);
	Lt = acker(phi',H',ze);
	GK = gam*K;
	LH = Lt'*H;
	phic = [phi  -GK;LH  phi-GK-LH];
	Cd1=disrw(F,G,T,Rwpsd);
	Cd=[Cd1 zeros(2,2);zeros(2,4)];
	Rq8=[zeros(2,4);zeros(2,2) Rqq8];
	Rq7=[zeros(2,4);zeros(2,2) Rqq7];
	Rq9=[zeros(2,4);zeros(2,2) Rqq9];
	Xw=dlyap(phic,Cd);
	Xq8=dlyap(phic,Rq8);
	Xq7=dlyap(phic,Rq7);
	Xq9=dlyap(phic,Rq9);
	X8=Xw+Xq8;
	X9=Xw+Xq9;
	X7=Xw+Xq7;
	rmsd(j)=sqrt(Xw(1,1))/rmsc1;
	rmsd8(j)=sqrt(X8(1,1))/rmsc1;
	rmsd7(j)=sqrt(X7(1,1))/rmsc1;
	rmsd9(j)=sqrt(X9(1,1))/rmsc1;
end

semilogx(Ws/Wb,rmsd,'-'),grid
axis([1 100 1 3])
hold on
semilogx(Ws/Wb,rmsd8,'-'),grid
semilogx(Ws/Wb,rmsd7,'-'),grid
semilogx(Ws/Wb,rmsd9,'-'),grid
semilogx(Ws/Wb,rmsd8,'*'),grid
semilogx(Ws/Wb,rmsd7,'o'),grid
semilogx(Ws/Wb,rmsd9,'x'),grid
title('Fig. 11.6  ')
xlabel('Sampling multiple,  Ws/Wb')
ylabel('Discrete/continuous  RMS ')
text(10,2.8,'--------- no quantization')
text(10,2.6,'-x--x--x-  9 bit word size')
text(10,2.4,'-*--*--*-  8 bit word size')
text(10,2.2,'-o--o--o-  7 bit word size')

hold off
