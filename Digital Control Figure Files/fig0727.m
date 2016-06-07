%  Figure 7.27      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab v4.2 or v5.0

clear
clf
w=logspace(-2,2);
W2=.01*(w<1) + 200*(w>1);
W2(24)=.1;
W2(25)=1;
W2(26)=10;
loglog(w,W2)
title('Fig.7.27 Plot of typical plant uncertainty')
