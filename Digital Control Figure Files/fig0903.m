%  Figure 9.3     Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0

clear
clf
F=[0 1;0 0];
G=[0;1];
H=[1 0];
T=.1;
[Phi,Gam]=c2d(F,G,T);
Gam1=[0;1];
Q1=[1 0;0 0];
Q2=.01;
S=Q1;
for k=1:50
	M = S - S*Gam*inv(Q2+Gam'*S*Gam)*Gam'*S;
	K=inv(Q2+Gam'*S*Gam)*Gam'*S*Phi;
	Ktheta1(51-k)=K(1);
	Kthetad1(51-k)=K(2);
	S=Phi'*M*Phi + Q1;
end
Ktheta1(51)=0;
Kthetad1(51)=0;
Q2=.1;
S=Q1;
for k=1:50
	M = S - S*Gam*inv(Q2+Gam'*S*Gam)*Gam'*S;
	K=inv(Q2+Gam'*S*Gam)*Gam'*S*Phi;
	Ktheta2(51-k)=K(1);
	Kthetad2(51-k)=K(2);
	S=Phi'*M*Phi + Q1;
end
Ktheta2(51)=0;
Kthetad2(51)=0;
Q2=1;
S=Q1;
for k=1:50
	M = S - S*Gam*inv(Q2+Gam'*S*Gam)*Gam'*S;
	K=inv(Q2+Gam'*S*Gam)*Gam'*S*Phi;
	Ktheta3(51-k)=K(1);
	Kthetad3(51-k)=K(2);
	S=Phi'*M*Phi + Q1;
end
Ktheta3(51)=0;
Kthetad3(51)=0;
n=0:50;
subplot(2,1,1)
plot(n,Ktheta1,'-',n,Ktheta2,'--',n,Ktheta3,'-.'),grid
ylabel('K theta')
xlabel('k')
title('Fig. 9.3  Example of Control gains vs. time')
text(10.2,1.3,'Q2 = 1.0')
text(10.2,3.3,'Q2 = 0.1')
text(10.2,8.5,'Q2 = 0.01')

subplot(2,1,2)
plot(n,Kthetad1,'-',n,Kthetad2,'--',n,Kthetad3,'-.'),grid
axis([0 50 0 5])
ylabel('K theta dot')
xlabel('k')
text(10.2,1.6,'Q2 = 1.0')
text(10.2,2.7,'Q2 = 0.1')
text(10.2,4.3,'Q2 = 0.01')
