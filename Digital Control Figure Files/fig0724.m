%  Figure 7.24      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab 4.2 or 5.0

clear
clf
w=logspace(-2 ,2);
w1=[200*ones(size(w(1:10))) 0.1*ones(size(w(11:50)))];
loglog(w,w1)
title('Fig. 7.24 Plot of frequency content of typical command input')
ylabel('Magnitude of R')
xlabel('w')
