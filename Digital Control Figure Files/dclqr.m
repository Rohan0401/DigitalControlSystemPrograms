function [phi,gam,K] = dclqr(F,G,Qc1,Qc2,T)
%DCLQR.M  Computes discrete feedback gain, K, given
%         continuous cost, also computes phi and gamma
[phi,gam]=c2d(F,G,T)
[Qd11,Qd22,Qd21] = jdequiv(F,G,T,Qc1,Qc2);
QQ=inv(Qd22)*Qd21
Q=Qd11-Qd21'*QQ;
phip=phi-gam*QQ;
Kp=dlqr(phip,gam,Q,Qd22);
K=Kp + QQ;
