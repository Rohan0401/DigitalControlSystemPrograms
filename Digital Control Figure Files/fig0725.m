%  Figure 7.25      Digital Control of Dynamic Systems, 3e 
%                   Franklin, Powell, Workman
%                   Addison-Wesley Publishing Company, 1998
% Matlab 4.2 or 5.0

clear
clf
w=logspace(1,4);
W1=200*(w<(200*pi)) +.01*(w>(200*pi));
loglog(w,W1)
grid

title('Fig. 7.25  Plot of example W1 function')
