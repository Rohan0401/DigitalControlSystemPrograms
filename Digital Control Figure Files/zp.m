function [f,g,h,j] = zpeq(a,b,c,d,T);
%  [f,g,h,j] = zpeq(a,b,c,d,T) computes the zero-pole 
%  equivalent of the continuous system described by a,b,c,d
[z p kp] = ss2zp(a,b,c,d,1);
pd = exp(p*T);
[n n] = size(a);
[mz,nz] = size(z)

 if mz<n
      zd = zeros(n,1);
     for i = 1:mz
      zd(i) = exp(z(i)*T);
     end

     for i= mz+1:(n)
         zd(i) = -1;
     end
 else 
      zd=zeros(n,1)
       for i=1:n
         zd(i) =exp(z(i)*T)
       end
  end
[f,g,h,j] = zp2ss(zd ,pd,1);
kc = d + c*inv(-a)*b;
kd = j + h*inv(eye(n) - f)*g;
km = sqrt(kc/kd);
j = j*km*km;
g = g*km;
h = h*km;

