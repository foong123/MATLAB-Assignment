clc;
clear all;
format long;
f = @(x) 1-x+(x^2)-(x^3)+(x^4)-(x^5)+(x^6)-(x^7);
x = 0.3;
real = 1/(1+x)
estimate = f(x)