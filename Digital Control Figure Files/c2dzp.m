function [zd,pd,kd] = c2dzp(z,p,ko,dt)
% C2DZP.M continuous (w/ZOH) pole-zero to discrete pole-zero 
[a,b,c,d]=zp2ss(z,p,ko);
[phi,gam]=c2d(a,b,dt);
[zd,pd,kd]=ss2zp(phi,gam,c,d,1);
