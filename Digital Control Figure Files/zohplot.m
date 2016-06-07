function zohplot(xord,yord,plotchar)
%        function zohplot(xord,yord,plotchar)
%
% zohplot.m  Plots the zero-order hold of two columns of data.  If
%            yord is a matrix then it plots each column of yord vs
%            the vector xord.  xord and yord must have the same
%            row dimension.
%
%            xord = data in the x coordinate
%            yord = data in the y coordinate
%            plotchar = the line or point-type as in plot(x,y,'plotchar')
%
% Written 2/24/87 by Daniel Abramovitch.
%
% modified last 3/18/87  FRH
%

[xlen,xwid] = size(xord);
xlen = xlen-1;
%
%  if xlen==0, then assume data was provided in row rather than
%  column format and transpose input.  these variables are local,
%  so the change will not affect the users format.
%
if xlen==0
   xord=xord';
   [xlen,xwid] = size(xord);
   xlen = xlen-1;
   yord=yord';
end
[ylen,ywid] = size(yord);
ylen = ylen-1;
if xlen~=ylen
   disp('--ERROR-- xord and yord must have same number of rows')
   return
end
bigx=zeros(2*xlen,1);              % Fill these with zero;
bigy=zeros(2*ylen,ywid);
txlm1 = 2*xlen-1;
txl   = 2*xlen;
xlp1  = xlen+1;
bigx(1:2:txlm1) = xord(1:xlen);
bigx(2:2:txl)   = xord(2:xlp1);
bigy(1:2:txlm1,:) = yord(1:xlen,:);
bigy(2:2:txl,:)   = yord(1:xlen,:);
if(nargin <= 2)
  plot(bigx,bigy);
else
  plot(bigx,bigy,plotchar);
end
%
