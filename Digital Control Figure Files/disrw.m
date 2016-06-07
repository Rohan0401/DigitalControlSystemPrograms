function [Cd]=disrw(F,G,T,Rwpsd)
%computes discrete equivalent of continuous noise
ZF=zeros(size(F));
[n,m]=size(G);
ME=[-F G*Rwpsd*G';
ZF F'];
phi=expm(ME*T);
phi12=phi(1:n,n+1:2*n);
phi22=phi(n+1:2*n,n+1:2*n);
Cd=phi22'*phi12;
