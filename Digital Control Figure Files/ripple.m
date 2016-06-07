
function [y,u,time] = ripple(np,dp,nc,dc,T,n)
%   [y u time] = ripple(np,dp,nc,dc,T,n)
% Function "ripple" computes the output of a sampled-data system for each
% sample time, t, and for n points between each sample time (to show the "ripple")
% for a step input. This response is output in the vector y along
%  with an appropriate time vector.  The output and the control/20 
% are plotted with input gain to make zero steady-state error.
% The sampled-data system is:
%
%           +             |----|   u(k)  |---|   |----|
%      ref----O-----/  ---|D(z)|---/  ---|ZOH|---|G(s)|------/  ---- y
%             |-     T    |----|    T    |---|   |----|   |   T/n
%             |___________________________________________|
%
% where,
%
% 
% discrete controller   : D(z) = nc/dc
% continuous plant      : G(s) = np/dp
% sample time           : T
% iterations/sample time: n
% output with ripple    : y


% D.R. Meldrum; November 15, 1987, G. Franklin 12/95
ref=ones(30,1);
% make time vector for plotting:
numsteps =length(ref) * T;
timestep = T/n;
time = (0:timestep:numsteps)';
% time = time(1:(numsteps/timestep));
t = 0:T:numsteps;
% convert nc, dc to state space:
[az,bz,cz,dz] = tf2ss(nc,dc);

% convert np, dp to state space:
[as,bs,csz,dsz] = tf2ss(np,dp);

% convert as,bs to discrete time, at the fast rate:
[asz,bsz] = c2d(as,bs,timestep);



% initialize states and outputs:
   [r,c] = size(az);
   xz  = zeros(r,1);
   [ns,ns]=size(asz);
   xsz=zeros(ns,1);
    yf   = csz * xsz;

% compute the dc gain 
[npd dpd]=ss2tf(asz,bsz,csz,dsz);
nol=conv(npd,nc);
dol=conv(dpd,dc);
dcl=dol+nol;
N=polyval(dcl,1)/polyval(nol,1);
ref=N*ref;  
   uz = cz*xz + dz*(ref(1)-yf);
   y    = [];
   u    = [];
   yy = [];
   y = [y;yf];
   yy = [yy;yf];
   u = [u;uz];
% determine output y including the ripple between sample times:

for k = 1:length(ref)

   for j = 1:n
      xsz = asz * xsz + bsz * uz;
      yelement = csz * xsz + dsz * uz;
      y = [y;yelement];
   end


  xz = az * xz + bz * (ref(k) - yf);
   yf = y((k-1)*n+n+1);
   yy = [yy;yf];
  uz = cz * xz + dz * (ref(k) - yf);
  u = [u;uz];
end
%  axis([0 20 -1.5 1.5])
  zohplot(t',u/20,'-')
  hold on
plot(time,y)
plot(t',yy,'*')
xlabel(' time')
ylabel(' y(t)     and     u(t)/20')
hold off

