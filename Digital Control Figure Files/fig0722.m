%  Figure 7.22      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab 4.2 or 5.0

clear
clf
clear
w=logspace(-1,1);
L=length(w);

% s-plane 
 np=1;
dp=[1 1 0];
[mag,phase]=bode(np,dp,w);
phasem=phase+180;
for i=1:L
K(i)=1/mag(i);
end
r=rlocus(np,dp,K);
Wn=abs(r(:,1));
zeta=-real(r(:,1))./Wn;
plot(phasem,zeta,'-'),grid
 axis([0 80 0 1]);
title('Fig.7.22  Damping ratio versus Phase Margin')

ylabel('Damping ratio, zeta')
xlabel('Phase margin')
hold on

%              T = 0.2 sec
T = 0.2;
 [num den]=c2dm(np,dp,T,'z');
[mag,phase]=dbode(num,den,T,w);
phasem=phase+180;
for i=1:L
K(i)=1/mag(i);
end
r=rlocus(num,den,K);
s=log(r)/T;
Wn=abs(s(:,1));
zeta=-real(s(:,1))./Wn;
plot(phasem,zeta,'-.') 

%              T = 1 sec
T = 1;
 [num den]=c2dm(np,dp,T,'z');
[mag,phase]=dbode(num,den,T,w);
 
phasem=phase+180;
for i=1:L
K(i)=1/mag(i);
end
r=rlocus(num,den,K);
s=log(r)/T;
Wn=abs(s(:,1));
zeta=-real(s(:,1))./Wn;
 zeta=zeta(1:42);
phasem=phasem(1:42);
 plot(phasem,zeta,':') 
hold off
