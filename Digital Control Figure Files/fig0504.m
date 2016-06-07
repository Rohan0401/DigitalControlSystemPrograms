%  Figure 5.4     Digital Control of Dynamic Systems, 3e
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
subplot(2,1,1),plot(w,mag)
axis(v);
grid
title('SPECTRUM OF A SIGNAL')
text(.5,1.6,'|R|')
xlabel('Fig. 5.4(a)')
w1 = w - 2*pi;
subplot(2,1,2),plot(w,mag,'.')
hold on
subplot(2,1,2),plot(w1,mag,'.')
w2 = w + 2*pi;
subplot(2,1,2), plot(w2,mag,'.')
title('SPECTRUM OF THE SAMPLED SIGNAL AND ITS COMPONENTS')
text(.5, 1.6,'|R*|')
grid
xlabel('Fig. 5.4(b)')
x = [2.5 2.5];
y = [0 .75];
subplot(2,1,2), plot(x,y)
text(2.4,1.,'w1')
[a,b,c,d] = tf2ss(num,den);
phi = expm(a);
w = -10:.1:10;
[dmag dph] = dbode(phi,b,c,d,1,1,w);
subplot(2,1,2), plot(w,dmag)
hold off
