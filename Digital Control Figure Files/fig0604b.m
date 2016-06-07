%  Figure 6.4b     Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab 4.2 or 5.0
%
%  computes the discrete equivalent 
%  of the third order Butterworth  system with bandwidth 1
%  rad/s using sample period 1.0  and Bilinear,
%  bilinear  prewarped at wp = 1, forward, and backward 
%  rules.  The results are plotted in magnitude and phase
%  against normalized frequency wT. Calls functions forwd,
%  backwd, and bilinr.

clear
clf
a = [-2 -2 -1;1 0 0;0 1 0];
b = [1 0 0]';
c = [0 0 1];
d = 0;
w = 0:.05:2.5;
T= 1;
[magc phc] = bode(a,b,c,d,1,w);
[ff,gf,hf,jf] = forwd(a,b,c,d,T);
[fb,gb,hb,jb] = backwd(a,b,c,d,T);
[fbi,gbi,hbi,jbi] = bilinr(a,b,c,d,T);
warp = (2/T)*tan(T/2);
awarp = warp*a;
bwarp = b * warp;
[fp,gp,hp,jp] = bilinr(awarp,bwarp,c,d,T);
if exist('ssselect')==2,	% If Control Toolbox 3.0+ 
  [magf phf] = dbode(ff,gf,hf,jf,1,1,w*T);
else				% else Control Toolbox 2.0 
  [magf phf] = dbode(ff,gf,hf,jf,1,w*T);
end
if exist('ssselect')==2,	% If Control Toolbox 3.0+ 
  [magb phb] = dbode(fb,gb,hb,jb,1,1,w*T);
else				% else Control Toolbox 2.0 
  [magb phb] = dbode(fb,gb,hb,jb,1,w*T);
end
if exist('ssselect')==2,	% If Control Toolbox 3.0+ 
  [magwarp phwarp] = dbode(fp,gp,hp,jp,1,1,w*T);
else				% else Control Toolbox 2.0 
  [magwarp phwarp] = dbode(fp,gp,hp,jp,1,w*T);
end
if exist('ssselect')==2,	% If Control Toolbox 3.0+ 
  [magbi phbi] = dbode(fbi,gbi,hbi,jbi,1,1,w*T);
else				% else Control Toolbox 2.0 
  [magbi phbi] = dbode(fbi,gbi,hbi,jbi,1,w*T);
end
subplot(2,1,1), plot(w,magc), axis([0 2.5 0 1.2]) , 
hold on
plot(w,magbi,'o',w,magwarp,'+',w,magb,'*',w,magf,'x');
grid,title('Fig. 6.4b  Magnitude and phase of discrete equivalents, T=1'), 
hold off
subplot(2,1,2) , plot(w,phc), axis([0 2.5 -250 0]), 
hold on
plot(w,phbi,'o',w,phwarp,'+',w,phb,'*',w,phf,'x')
grid,title('bilinr = o,warp = +, backwd = *, forwd = x')
xlabel('normalized frequency w/wp')
hold off
