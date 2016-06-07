function fr = dzfr(z,p,ko,wl,wh,dt)
% DZFR.M   discrete z-plane freq response mag & phase
%  wl = exp of freq start point
[num,den]=zp2tf(z,p,ko);
w=logspace(wl,wh);
l=length(w);
one=ones(l,1);
zero=zeros(l,1);
th= w*dt;
th=th(th < pi);
lt=length(th);
if exist('ssselect')==2,	% If Control Toolbox 3.0+ 
  [mag,phase]=dbode(num,den,1,th);
else				% else Control Toolbox 2.0 
  [mag,phase]=dbode(num,den,th);
end
wp=th/dt;
subplot(211),loglog(wp,mag,'-',w,one,'-'),grid
ylabel('magnitude')
xlabel('frequency (rad/sec)')
phasem=phase+180;
subplot(212),semilogx(wp,phasem,'-',w,zero,'-'),grid
ylabel('phase margin')
xlabel('frequency (rad/sec)')
pause
f=wp';
fr=[f,mag,phasem];
