%  Figure 10.5      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0
% a function to construct fig 10.5 using the functions 
%   qwc.m and qrms.m for a second order system with poles
% at radius r for various angles, theta.

clear
clf
r=.9;
B = zeros(3,16);
b = [1 1]';
c = [1 0];
d = 0;
a = [0 1;-r*r 0];
for k = 0:15;
theta = (k * pi)/18;
a(1,1) = 2*r*cos(theta);
K = 1/(c*((eye(2) - a)\b));
b1 = b*K;
B(1,k+1) = qwc(a,b1,c,d);
B(2,k+1) = qrms(a,b1,c,d);
B(3,k+1) = c*(inv(eye(2) - a)*b1) + d;
end
k =  0:10:150;
plot(k,B(1,:),'x',k,B(2,:),'o',k,B(3,:),'+')
grid
title('Fig. 10.5  2nd order Bound x, steady state + and rms error o')
xlabel('alpha')
ylabel('normalized quantization error')
