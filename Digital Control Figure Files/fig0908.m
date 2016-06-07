%  Figure 9.8     Digital Control of Dynamic Systems, 3e 
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
Rv=.1;
Rvi=1/Rv;
Rw=.1;
M=[1 0;0 1];
for k=1:41
	P=M - M*H'*H*M/(H*M*H' + Rv);
	L=P*H'*Rvi;
	Ltheta1(k)=L(1);
	Lthetad1(k)=L(2);
	M=Phi*P*Phi' + Gam1*Rw*Gam1';
end
Rw=.01;
M=[1 0;0 1];
for k=1:41
	P=M - M*H'*H*M/(H*M*H' + Rv);
	L=P*H'*Rvi;
	Ltheta2(k)=L(1);
	Lthetad2(k)=L(2);
	M=Phi*P*Phi' + Gam1*Rw*Gam1';
end
Rw=.001;
M=[1 0;0 1];
for k=1:41
	P=M - M*H'*H*M/(H*M*H' + Rv);
	L=P*H'*Rvi;
	Ltheta3(k)=L(1);
	Lthetad3(k)=L(2);
	M=Phi*P*Phi' + Gam1*Rw*Gam1';
end
n=0:40;
subplot(2,1,1)
plot(n,Ltheta1,'-',n,Ltheta2,'--',n,Ltheta3,'-.'),grid
ylabel('L theta')
xlabel('k')
title('Fig. 9.8 Example of Estimator gains vs. time')
text(30,.4,'Rw = 0.1')
text(30,.26,'Rw = 0.01')
text(30,.06,'Rw = 0.001')

subplot(2,1,2)
plot(n,Lthetad1,'-',n,Lthetad2,'--',n,Lthetad3,'-.'),grid
axis([0 40 0 1.2])
ylabel('L theta dot')
xlabel('k')
text(30,.85,'Rw = 0.1')
text(30,.35,'Rw = 0.01')
text(30,.15,'Rw = 0.001')