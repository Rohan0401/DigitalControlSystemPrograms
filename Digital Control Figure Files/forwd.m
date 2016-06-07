function  [F,G,H,J] = FWD(A,B,C,D,T)
%  [f,g,h,j] = bkwd(a,b,c,d,t)
%  THIS FUNCTION COMPUTES THE DISCRETE EQUIVALENT TO A GIVEN CONTINUOUS
%  SYSTEM BY THE FORWARD RECTANGULAR RULE WITH SAMPLING PERIOD T.
[n,m] = size(A);
I = eye(n);
F = (I + A*(T));
G = T*B;
H = C;
J =  D;

