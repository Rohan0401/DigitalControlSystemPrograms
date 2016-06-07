%  Figure 10.4       Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0
% a function to construct fig 10.4 using the functions 
%   qwc.m and qrms.m.

clear
clf
B = zeros(2,10);
b = 1;
c = 1;
d = 0;
a = 0;
for k = 0:9
B(1,k+1) = qwc(a,b,c,d);
B(2,k+1) = qrms(a,b,c,d);
a = (k+1)/10;
end
k = 0:.1:.9;
v = [0 1.0 0 11];

plot(k,B(1,:),'x',k,B(2,:),'o'),grid
axis(v);
title('Fig. 10.4 Error bound and rms estimate for first order system')
xlabel('alpha')
ylabel('normalized quantization error')
