clear
clf
a = -2;
b = 2;
c = 1;
d = 0;
w = 0:.05:2.5;
T=.1; % Try various sample times
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
subplot(2,1,1), plot(w,magc), 
hold on
plot(w,magbi,'o',w,magwarp,'+',w,magb,'*',w,magf,'x');
grid,title('Magnitude and phase of discrete equivalents'), 
hold off
subplot(2,1,2) , plot(w,phc), 
hold on
plot(w,phbi,'o',w,phwarp,'+',w,phb,'*',w,phf,'x')
grid,title('bilinr = o,warp = +, backwd = *, forwd = x')
xlabel('normalized frequency w/wp')
hold off
