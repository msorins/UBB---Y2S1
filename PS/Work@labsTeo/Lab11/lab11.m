x = [7 7 4 5 9 9 4 12 8 1 8 7 3 13 2 1 17 7 12 5 6 2 1 13 14 10 2 4 9 11 3 5 12 6 10 7];
sigma = 5;
m0 = 9;
alpha = 0.01;
tiptest = 'left';
ztest(x,m0,sigma,alpha,tiptest)

clc; clear all; close all;

% problema 2
x = [99.8 99.9 98.0 100.1 100.5 100.0 100.2; 2 5 3 4 2 2 2];
xnew=[];
for i = 1 : length(x)
    xnew = [xnew,x(1,i)*ones(1,x(2,i))];
end

% ask ratiu cum apelezi :))
%Ttest(xnew,0.01)