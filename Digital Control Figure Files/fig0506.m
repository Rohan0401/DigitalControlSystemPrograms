%  Figure 5.6      Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab 4.2 or 5.0

clear
clf
num = [1];
den = [1 .8 1];
w = -6:.1:6;
[mag ph] = bode(num,den,w);
v = [-10 10 0 2];
mag1 = zeros(size(mag));
mag1(31:90) = mag(31:90);
subplot(2,1,1),plot(w,mag1)
axis(v);
grid
title('SPECTRUM OF A BANDLIMITED SIGNAL')
text(.5,1.6,'|R|')
xlabel('Fig. 5.6(a)                wT')
w1 = w - 2*pi;
subplot(2,1,2),plot(w,mag1)
axis(v);
hold on
subplot(2,1,2),plot(w1,mag1)
w2 = w + 2*pi;
subplot(2,1,2), plot(w2,mag1)
title('SPECTRUM OF A SAMPLED BANDLIMITED SIGNAL')
text(.5, 1.6,'|R*|')
grid
xlabel('Fig. 5.6(b)                wT')
x = [2.5 2.5];
y = [0 .75];
subplot(2,1,2), plot(x,y)
text(2.4,1.,'w1')
hold off
