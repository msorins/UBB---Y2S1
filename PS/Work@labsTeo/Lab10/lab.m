x1=[22.4,21.7,24.5,23.4,21.6,23.3,22.4,21.6,24.8,20.0];
x2=[17.7,14.8,19.6,19.6,12.1,14.8,15.4,12.6,14.0,12.2];
alfa = 0.95
m1 =mean(x1)
m2=mean(x2)
m = m1-m2
sig1 = var(x1);
sig2 = var(x2);
n1 = length(x1);
n2 =length(x2);
na = n1+n2-2;
rad1 = sqrt(1/n1+1/n2);
sp = sqrt(((n1-1)*sig1+(n2-1)*sig2)/rad1);
ta = tinv(1-alfa/2,na);
left = m-ta*sp*rad1;
right = m+ta*sp*rad1;
[left m right];



rad2=sqrt(sig1/n1+sig2/n2);
c=sig1/n1/(sig1/n1+sig2/n2);
n = 1/(c^2/(n1-1)+(1-c)^2/(n2-1));
tb=tinv(1-alfa/2,n);
left = m-tb*rad2;
right = m+tb*rad2;
[left m right];



raport = sig1/sig2;
f1=finv(1-alfa/2,n1-1,n2-1);
f2=finv(alfa/2,n1-1,n2-1);

left = 1/f1*raport
right = 1/f2*raport
[left raport right]