%  Figure 7.8      Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab 4.2 or 5.0
%  Frequency response of continuous antenna design

clear
clf
np=1;
dp=[1 1 0 ];
w=logspace(-1, 1);
[mag ph]=bode(np,dp,w);
figure(1)
subplot(2,1,1) ,loglog(w,mag), grid, 
title('Fig.7.8 Bode plot of the continuous design for the antenna control')
ylabel('Magnitude')
subplot(2,1,2) ,semilogx(w,ph), grid, 
ylabel('Phase, degrees')
figure(2)
margin(np,dp)
grid

