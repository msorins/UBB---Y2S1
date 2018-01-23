clear all; close all; clc;
x= [7 7 4 5 9 9 4 12 8 1 8 7 3 13 2 1 17 7 12 5 6 2 1 13 14 10 2 4 9 11 3 5 12 6 10 7];

alfa = 0.95;
xbar = mean(x);
sigma = 5;
n = length(x);
c = norminv(alfa/2,0,1)
left =  xbar + sigma/sqrt(n)*c;
right = xbar - sigma/sqrt(n)*c;
fprintf('media %f \n', xbar);
fprintf('intervalul est %f, %f\n', left, right);


%prob 2
clear all; close all; clc;
x = [99.8 99.9 98.0 100.1 100.5 100.0 100.2 ;2 5 3 4 2 2 2];
xnew = [];
alfa = 0.95;
for i = 1 : length(x)
  xnew=[xnew, x(1,i)*ones(1,x(2,i))];
  end
xbar = mean(xnew)
s = std(xnew);
n = length(xnew);
t = tinv(1-alfa/2, n-1);
left = xbar - s/sqrt(n)*t;
right = xbar + s/sqrt(n)*t;

fprintf('media %f \n', xbar);
fprintf('intervalul est %f, %f\n', left, right);

%prob 3
clear all; close all; clc;
x = [1.48 1.26 1.52 1.56 1.48 1.46 1.30 1.28 1.43 1.43 1.55 1.57 1.51 1.53 1.68 1.37 1.47 1.61 1.49 1.43 1.64 1.51 1.60 1.65 1.60 1.64 1.51 1.51 1.53 1.74];
n = length(x)
s = std(x)
alfa = 0.05
h1 = chi2inv(1-alfa/2, n-1)
h2 = chi2inv(alfa/2, n-1)
left = ((n-1)*s^2)/h1;
right = ((n-1)*s^2)/h2;
[left , s^2, right]
