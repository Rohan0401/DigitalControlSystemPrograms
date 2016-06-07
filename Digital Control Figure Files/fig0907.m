%  Figure 9.7     Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0

clear
clf
y = [0.2 0.5 1.1 1.2 1.1 1.3 1.1 1.2 2.0 1.2 2.2 4.0]';
t = 1:12;
H=[ones(12,1) t' (t.*t)'];
xhat=inv(H'*H)*H'*y;
yhat = H*xhat;
t2=12:24;
H2=[ones(13,1) t2' (t2.*t2)'];
yhat2 = H2*xhat;
plot(t',yhat,'-',t',y,'o',t2',yhat2,'--'),grid
title('Fig. 9.7 Sales fit and prediction, Example 9.7')
ylabel('Sales (1000 $)')
xlabel('Months')

sigv = .7
sigv2 = sigv^2
P = inv(H'*H)*sigv2

rmsao = sqrt(P(1,1))
rmsa1 = sqrt(P(2,2))
rmsa2 = sqrt(P(3,3))
