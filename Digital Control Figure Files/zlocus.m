function z = zlocus(gz,gp,dz,dp,kp,k)
% ZLOCUS.M
% computes and plots root locus in z-plane with unit circle
% given zeros and poles of G(z) and D(z) and kp of G(z).
% requires a vector (k) of points to be plotted.
dgz = [gz;dz];
dgp = [gp;dp];
[num,den] = zp2tf(dgz,dgp,kp);
z = rlocus(num,den,k);
axis([-1 1 -1 1])
axis('square')
t=0:.1:6.3;
plot(sin(t),cos(t),'-',real(z),imag(z),'.');
grid
hold
plot(dp,0,'x')
plot(gp(1),0,'x')
plot(gp(2),0,'x')
plot(dz,0,'o')
plot(gz(1),0,'o')
hold
pause
