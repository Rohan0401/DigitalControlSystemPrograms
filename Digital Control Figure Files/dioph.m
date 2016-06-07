function [r, s] = dioph(a,b,alpha);
% [r s] = dioph(a,b,alpha) solves the diophantine equation
% a*r + b*s = alpha for a full order controller with
%    integral control
[n,m] = size(a);
d = zeros(m,m);
for i = 1:m;
   d(i:m+i-2,2*i-1) = b';
end
for i = 1:m-1
   d(i:i+m-1,2*i) = a';
   d(2*m-1,2*i) = 1;
end
a1 = [a(2:m) a*0]';
a2 = [alpha(2:2*m-1)  -1]';
a3 = a2 - a1;
p = d\a3;
for i = 1:m
s(1,i) = p(2*i-1);
end
r = 0*s;
r(1,1) = 1
for i =1:m-1
r(1,i+1) = p(2*i);
end
