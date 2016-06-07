%  Figure 7.4      Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab 4.2 or 5.0

clear
clf
np=1;
dp=[1 1 0];
rlocus(np,dp)
K=1;
hold on
r=rlocus(np,dp,K);
axis([-1.2 0.2 -1 1])
plot(real(r),imag(r),'*')
% axis('square')
 title(' Figure 7.04  Rootlocus for compensated antenna model')
hold off


