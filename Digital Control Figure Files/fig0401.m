%  Figure 4.1      Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab 4.2 or 5.0
% a function to compute and plot the first 9 Fibonacci numbers

clear
clf
y = zeros(1,9);
k = 3;
y(1) = 1;
y(2) = 1;
while k <= 9;
y(k) = y(k-1) + y(k-2);
k = k+1;
end
k1 = 0:8;
plot(k1,y,'o'),grid
title('FIG 4.1 PLOT OF THE FIRST 9 FIBONACCI NUMBERS')
xlabel('k')
ylabel('u(k)')

