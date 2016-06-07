%  Figure 11.13     Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0

clear
clf
to=clock;
% first do case without prefilter for normalization
F=[0  1  ;
   0  0  ];  % 1/s^2
G=[0;1];
n=length(G);  %system order for later dimensioning
H=[1 0 ];  % output is from plant
Qc1 =  [1  0 
        0  0 ];
Qc2=.05; % yields s-plane roots at s=-1.5+-j1.5; Wb=3r/s
Rv=1;
Rw=500;  % yields s-plane roots at s=-3.3+-j3.3; Wb=7r/s
K=lqr(F,G,Qc1,Qc2);
Fcl=F-G*K;
s=eig(Fcl)
Wb1=abs(s(2))*1.4    % approximate bandwidth
L=lqe(F,G,H,Rw,Rv);
Fe=F-L*H;
se=eig(Fe)
Rvpsd=1;     % an arbitrary value, but results are scaled to
%              continuous, so no matter.
Rwpsd=1; % will be used in place of Rvpsd for prefilter case
Fcle = [F  -G*K;L*H  F-G*K-L*H];
Ga=[zeros(n,1);L]; %measurement noise entering direct
C=Ga*Rvpsd*Ga'; 
X=lyap(Fcle,C); %Continuous covariance
rmsc=sqrt(X(1,1))  % Normalization factor for remainder
rmsd1=rmsc;  %keeps dimensions from screwing up
Wp=6;   %Wp/Wb = 2
F=[0  1  0;
   0  0  0
   Wp 0 -Wp];  % 1/s^2 with 1st order prefilter
G1=[0;0;Wp];
G=[0;1;0];
n=length(G);  %system order for later dimensioning
H=[0 0 1];  % output is from prefilter
Qc1 =  [1  0   0
        0  0   0
        0  0   0];
Qc2=.05; % yields s-plane roots at s=-1.5+-j1.5; Wb=3r/s
K=lqr(F,G,Qc1,Qc2);
Fcl=F-G*K;
s=eig(Fcl)
Wb1=abs(s(2))*1.4    % approximate bandwidth
L=lqe(F,G,H,Rw,Rv);
Fe=F-L*H;
se=eig(Fe);
Wp=6;
Ws1=[6  10  20 40 80 150 300 1800];
for j=1:8,
	i=j;
	T=2*pi/Ws1(j);
	[phi,gam]= c2d(F,G,T);
	z=exp(s*T);
	ze=exp(se*T);
	K = acker(phi,gam,z);
	Lt = acker(phi',H',ze);
	GK = gam*K;
	LH = Lt'*H;
	Cd1=disrw(F,G1,T,Rwpsd);
	Cd=[Cd1 zeros(size(F));zeros(size(F)) zeros(size(F))];
	phic = [phi  -GK;LH  phi-GK-LH];
	X=dlyap(phic,Cd);
	rmsd1(j)=abs(sqrt(X(1,1))/rmsc);  %normalize to
%                                       no prefilter

end
Wp=30;  % Wp/Wb = 10
F=[0  1  0;
   0  0  0
   Wp 0 -Wp];  % 1/s^2 with 1st order prefilter
G1=[0;0;Wp];
K=lqr(F,G,Qc1,Qc2);
Fcl=F-G*K;
s=eig(Fcl)
Wb2=abs(s(2))*1.4    % approximate bandwidth
L=lqe(F,G,H,Rw,Rv);
Fe=F-L*H;
se=eig(Fe)
Fcle = [F  -G*K;L*H  F-G*K-L*H];
Ga=[G1;zeros(n,1)]; %measurement noise entering before
%                     prefilter (as process noise).
C=Ga*Rvpsd*Ga'; 
X=lyap(Fcle,C); %Continuous covariance
rmsd2=rmsc;
Ws2=[ 15 30 60 120 240 500 1000 2400];
for j=1:8,
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
	Cd1=disrw(F,G1,T,Rwpsd);
	Cd=[Cd1 zeros(size(F));zeros(size(F)) zeros(size(F))];
	phic = [phi  -GK;LH  phi-GK-LH];
	X=dlyap(phic,Cd); 
	rmsd2(j)=abs(sqrt(X(1,1))/rmsc); %normalize to
%                                       no prefilter
end
Wp=15;
F=[0  1  0;
   0  0  0
   Wp 0 -Wp];  % 1/s^2 with 1st order prefilter
G1=[0;0;Wp];
K=lqr(F,G,Qc1,Qc2);
Fcl=F-G*K;
s=eig(Fcl)
Wb3=abs(s(2))*1.4    % approximate bandwidth
L=lqe(F,G,H,Rw,Rv);
Fe=F-L*H;
se=eig(Fe)
Fcle = [F  -G*K;L*H  F-G*K-L*H];
Ga=[G1;zeros(n,1)]; %measurement noise entering before
%                     prefilter (as process noise).
C=Ga*Rvpsd*Ga'; 
X=lyap(Fcle,C); %Continuous covariance
rmsc3=sqrt(X(1,1))
rmsd3=rmsc3;
Ws3=[ 10 20 40 80 200 400 1000 2100];
for j=1:8,
	i=j;
	T=2*pi/Ws3(j);
	[phi,gam]= c2d(F,G,T);
	z=exp(s*T);
	ze=exp(se*T);
	K = acker(phi,gam,z);
	Lt = acker(phi',H',ze);
	GK = gam*K;
	LH = Lt'*H;
	phic = [phi  -GK;LH  phi-GK-LH];
	Cd1=disrw(F,G1,T,Rwpsd);
	Cd=[Cd1 zeros(size(F));zeros(size(F)) zeros(size(F))];
	X=dlyap(phic,Cd);
	rmsd3(j)=abs(sqrt(X(1,1))/rmsc);
end
Wp=60;
F=[0  1  0;
   0  0  0
   Wp 0 -Wp];  % 1/s^2 with 1st order prefilter
G1=[0;0;Wp];
K=lqr(F,G,Qc1,Qc2);
Fcl=F-G*K;
s=eig(Fcl)
Wb4=abs(s(2))*1.4    % approximate bandwidth
L=lqe(F,G,H,Rw,Rv);
Fe=F-L*H;
se=eig(Fe)
Fcle = [F  -G*K;L*H  F-G*K-L*H];
Ga=[G1;zeros(n,1)]; %measurement noise entering before
%                     prefilter (as process noise).
C=Ga*Rvpsd*Ga'; 
X=lyap(Fcle,C); %Continuous covariance
rmsc4=sqrt(X(1,1))
rmsd4=rmsc4;
Ws4=[25 40 80 150 300 600 1200 2700];
for j=1:8,
	i=j;
	T=2*pi/Ws4(j);
	[phi,gam]= c2d(F,G,T);
	z=exp(s*T);
	ze=exp(se*T);
	K = acker(phi,gam,z);
	Lt = acker(phi',H',ze);
	GK = gam*K;
	LH = Lt'*H;
	Cd1=disrw(F,G1,T,Rwpsd);
	Cd=[Cd1 zeros(size(F));zeros(size(F)) zeros(size(F))];
	phic = [phi  -GK;LH  phi-GK-LH];
	X=dlyap(phic,Cd);
	rmsd4(j)=abs(sqrt(X(1,1))/rmsc);
end

semilogx(Ws4/Wb4,rmsd4,'o',Ws2/Wb2,rmsd2,'*',Ws3/Wb3,rmsd3,'+')
axis([1 1000 1 3])
grid
hold on
semilogx(Ws4/Wb4,rmsd4,'-',Ws2/Wb2,rmsd2,'-',Ws3/Wb3,rmsd3,'-')
semilogx(Ws1/Wb1,rmsd1,'x',Ws1/Wb1,rmsd1,'-')
title('Fig. 11.13  ')
xlabel('SAMPLING MULTIPLE,  Ws/Wb')
ylabel('DISCRETE/CONTINUOUS  RMS ')
text(30,2.7,'-o----o- Wp/Wb = 20 ')
text(30,2.5,'-*----*- Wp/Wb = 10 ')
text(30,2.3,'-+----+- Wp/Wb =  5 ')
text(30,2.1,'-x----x- Wp/Wb =  2 ')

hold off
