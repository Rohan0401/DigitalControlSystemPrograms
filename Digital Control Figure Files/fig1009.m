%  Figure 10.9      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0
%  fig109 is a function to compute Fig. 10.9 
% to explore limit cycles as a function of dither level d.
% coefficient values and quantization level for the second
%  order difference equation x(k+2)+a1 x(k+1)+a2 x(k)
%  are for the fig, a1 = -1.7829 ( poles at 20 degrees),
% a2 = 0.9, q = 1, and x0 = [2 0]'.

clf
clear
x10=2; 
d=.4;
a1 = -1.7829;
a2 = .9;
q = .1;
n = 128;
j = 1:128;
x0 = [x10 0]';
x1 = zeros(1,n);
x2 = zeros(1,n);
x1(1,1) = x0(1);  % initial value of the state variable x1
x2(1,1) = x0(2);
dither = d;   % amplitude of dither
for k = 1:n;
x1q = quant(a1*(x1(k) + dither),q);
x2q = quant(a2*(x2(k)+ dither),q);
dither = -dither ;
  x1(k+1) =  -x1q - x2q;
  x2(k+1) = x1(k);
yqd(k) = x1(k);
end
for k = 1:n;
x1q = quant(a1*(x1(k) ),q);
x2q = quant(a2*(x2(k)),q);
% dither = -dither ;
  x1(k+1) =  -x1q - x2q;
  x2(k+1) = x1(k);
yq(k) = x1(k);
end
for k = 1:n;
x1q = a1*x1(k) ;
x2q = a2*x2(k);
  x1(k+1) =  -x1q - x2q;
  x2(k+1) = x1(k);
y(k) = x1(k);
end

subplot(2,1,1), plot(j,y,'-',j,yq,'-') , grid
title('q=0 and q=0.1 showing Limit cycle (no dither)')
subplot(2,1,2), plot(j,y,'-',j,yqd,'-.'), grid
title('q=0 and q=0.1 showing reduced limit cycle from dither=4q')
xlabel('Fig. 10.9  Limit cycle and dither in a second order system')

