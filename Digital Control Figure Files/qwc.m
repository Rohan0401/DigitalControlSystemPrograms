function kwc = qwc(a,b,c,d)
% kwc = qwc(a,b,c,d) is a function to compute the Bertram Worst
% Case bound for quantization errors in an otherwise linear digital
% system with state description matrices from the point of
% quantization a,b,c,d. The bound is y-max <= kwc*q/2.

x = b;
kwc = abs(d);
while norm(x,1) > .00005;
     y = c*x;
     kwc= kwc + abs(y);
     x = a*x;
end
