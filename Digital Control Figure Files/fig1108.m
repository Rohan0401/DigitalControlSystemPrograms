%  Figure 11.8     Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% (Non-colocated case)
% Matlab v4.2 or v5.0

clear
clf

F=[0 1 0 0;
-.91 0 .91 0
0 0 0 1
.091 0 -.091 0]; % Resonance at 1 rad/sec, zeta=0
G=[0;0;0;1];
H=[1 0 0 0];  % Non-colocated sensor and actuator
Ho=[1 0 0 0
    1 0 -1 0  % weights d - y
    0 1 0 0
    0 1 0 -1]; % weights ddot - ydot
Qc1bar=[1  0   0   0
        0  10  0   0
        0  0   1   0
        0  0   0  10];
Qc1=Ho'*Qc1bar*Ho;
Qc2=5000; 
Rv=1;
Rw=1;
K=lqr(F,G,Qc1,Qc2);
Fcl=F-G*K;
s=eig(Fcl)
Wb1=abs(s(3))*1.4    % approximate bandwidth
L=lqe(F,G,H,Rw,Rv);
Fe=F-L*H;
se=eig(Fe)
Rwpsd=1;     % an arbitrary value, but results are scaled to
%              continuous, so no matter.
Fcle = [F  -G*K;L*H  F-G*K-L*H];
Ga=[G;zeros(4,1)];
C=Ga*Rwpsd*Ga'; 
X=lyap(Fcle,C); %Continuous covariance
rmsc1=sqrt(X(1,1))
rmsd1=rmsc1;
Ws1=[ .5005 .59 .61 .67 .76 .8 .83 1.002 1.16 1.2 1.3   1.9 2  2.1  3 4 8 15];
for j=1:18,
	i=j;
	T=2*pi/Ws1(j);
	[phi,gam]= c2d(F,G,T);
	z=exp(s*T);
	ze=exp(se*T);
	K = acker(phi,gam,z);
	Lt = acker(phi',H',ze);
	GK = gam*K;
	LH = Lt'*H;
	phic = [phi  -GK;LH  phi-GK-LH];
	Cd1=disrw(F,G,T,Rwpsd);
	Cd=[Cd1 zeros(4,4);zeros(4,8)];
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
L=lqe(F,G,H,Rw,Rv);
Fe=F-L*H;
se=eig(Fe)
Fcle = [F  -G*K;L*H  F-G*K-L*H];
Ga=[G;zeros(4,1)];
C=Ga*Rwpsd*Ga'; 
X=lyap(Fcle,C); %Continuous covariance
rmsc2=sqrt(X(1,1))
rmsd2=rmsc2;
Ws2=[ .5005 .58 .62 .67 .76 .8 .83 1.002 1.16 1.2 1.4   1.9 2  2.1  3 4 8 15];
for j=1:18,
	i=j;
	T=2*pi/Ws2(j);
	[phi,gam]= c2d(F,G,T);
	z=exp(s*T);
	ze=exp(se*T);
	K = acker(phi,gam,z);
	Lt = acker(phi',H',ze);
	GK = gam*K;
	LH = Lt'*H;
	phic = [phi  -GK;LH  phi-GK-LH];
	Cd1=disrw(F,G,T,Rwpsd);
	Cd=[Cd1 zeros(4,4);zeros(4,8)];
	X=dlyap(phic,Cd);
	rmsd2(j)=abs(sqrt(X(1,1))/rmsc2);
end

semilogx(Ws1/Wb1,rmsd1,'o',Ws2/Wb2,rmsd2,'*'),grid
axis([1 100 1 10])
hold on
semilogx(Ws1/Wb1,rmsd1,'-',Ws2/Wb2,rmsd2,'-')
title('Fig. 11.8  ')
xlabel('SAMPLING MULTIPLE,  Ws/Wb')
ylabel('DISCRETE/CONTINUOUS  RMS ')
text(25,5.2,'Plant damping')
text(20,4.2,'-o--o- zeta= 0')
text(20,3.2,'-*--*- zeta=0.02')

hold off
