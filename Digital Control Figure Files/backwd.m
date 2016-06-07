function  [F,G,H,J] = BKWD(A,B,C,D,T)
%  [f,g,h,j] = fwd(a,b,c,d,t)
%  THIS FUNCTION COMPUTES THE DISCRETE EQUIVALENT TO A GIVEN CONTINUOUS
%  SYSTEM BY THE BACKWARD RECTANGULAR RULE WITH SAMPLING PERIOD T.
[n,m] = size(A);
I = eye(n);
P = inv(I - A*(T));
F = P;
G = T*P*B;
H = C*P;
J = C*G + D;

