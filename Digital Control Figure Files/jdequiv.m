function [Qd11,Qd22,Qd21] = jdequiv(F,G,T,Qc1,Qc2)
%JDEQUIV.M   Computes discrete equivalent of continuous cost
ZG=zeros(size(G));
ZF=zeros(size(F));
[n,m]=size(G);
Zm=zeros(m);
ME=[-F' ZG Qc1 ZG;
-G' Zm ZG' Qc2;
ZF ZG F G;
ZG' Zm ZG' Zm];
phi=expm(ME*T);
phi12=phi(1:n+m,n+m+1:2*(n+m));
phi22=phi(n+m+1:2*(n+m),n+m+1:2*(n+m));
QD=phi22'*phi12;
Qd11=QD(1:n,1:n);
Qd22=QD(n+1:n+m,n+1:n+m);
Qd21=QD(n+1:n+m,1:n);
