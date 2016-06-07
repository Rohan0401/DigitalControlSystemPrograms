function [f,g,h,j] = zoheq(a,b,c,d,T)
%   [F,G,H,J] = ZOHEQ(A,B,C,D,T) computes the
%   zero-order-hold equivalent of the continuous system
%   A,B,C,D, at the sampling period T.
[f g] = c2d(a,b,T);
h =c;
j = d;
