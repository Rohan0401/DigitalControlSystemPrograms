%  Figure 6.9b      Digital Control of Dynamic Systems, 3e
%                  Franklin, Powell, Workman
%                  Addison-Wesley, Publishing Company, 1998
% Matlab 4.2 or 5.0
%
% computes Fig. 6.9(b)  which compares
% the zero-order-hold, the triangle hold, and the
% zero-pole equivalents for the third order Butterworth
% filter with unity (rad) bandwidth and sample period T =2.
% The respones are
% plotted against the normalized frequency  The function
% calls tri.m, zoheq.m,  and zp.m. 

clear
clf
a = [-2 -2 -1;1 0 0;0 1 0];
b = [1 0 0]';
c = [0 0 1];
d = 0;
T=2;
[fzoh,gzoh,hzoh,jzoh] = zoheq(a,b,c,d,T);
[ft,gt,ht,jt] = tri(a,b,c,d,T);
[fzp,gzp,hzp,jzp]= zp(a,b,c,d,T);
wn = 0:.05:2.5;
w = wn;
[magc phc] = bode(a,b,c,d,1,w);
if exist('ssselect')==2,	% If Control Toolbox 3.0+ 
  [magzoh phzoh] = dbode(fzoh,gzoh,hzoh,jzoh,1,1,w*T);
else				% else Control Toolbox 2.0 
  [magzoh phzoh] = dbode(fzoh,gzoh,hzoh,jzoh,1,w*T);
end
if exist('ssselect')==2,	% If Control Toolbox 3.0+ 
  [magzp phzp] = dbode(fzp,gzp,hzp,jzp,1,1,w*T);
else				% else Control Toolbox 2.0 
  [magzp phzp] = dbode(fzp,gzp,hzp,jzp,1,w*T);
end
if exist('ssselect')==2,	% If Control Toolbox 3.0+ 
  [magtri phtri] = dbode(ft,gt,ht,jt,1,1,w*T);
else				% else Control Toolbox 2.0 
  [magtri phtri] = dbode(ft,gt,ht,jt,1,w*T);
end

subplot(2,1,1),plot(wn,magc) ,grid 
hold on
plot(wn,magzoh,'o',wn,magzp,'+',wn,magtri,'x')
title('Fig. 6.9b  (zoh = o, zero-pole = + ,triangle = x)')
hold off
subplot(2,1,2), plot(wn,phc),grid, 
hold on
plot(wn,phzoh,'o',wn,phzp,'+',wn,phtri,'x')
xlabel('normalized frequency w/wp')
hold off
