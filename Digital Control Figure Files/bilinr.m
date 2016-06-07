function  [F,G,H,J] = BILINR(A,B,C,D,T)
%  [f,g,h,j] = bilinr(a,b,c,d,t)
%  THIS FUNCTION COMPUTES THE DISCRETE EQUIVALENT TO A GIVEN CONTINUOUS
%  SYSTEM BY THE BILINEAR OR TRAPEZOID RULE WITH SAMPLING PERIOD t.
[n,m] = size(A);
I = eye(n);
r = sqrt(T);
P = inv(I - A*(T/2));
F = (I + A*(T/2))*P;
G = r*P*B;
H = r*C*P;
J = r*H*B/2 + D;
