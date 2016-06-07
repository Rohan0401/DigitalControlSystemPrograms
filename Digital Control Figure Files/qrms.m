function  krms =qrms(a,b,c,d)
% krms = qrms(a,b,c,d) is a function to compute the rms
%  error due to round-off error normalized by q/2. 
%  y-rms = krms*q/2.   Assumes  the white noise model with
%   var q^2/12.
q = b*b';
p = dlyap(a,q);
krms = sqrt((c*p*c'+d*d')/3); 
