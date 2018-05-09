clc;
clear all;
format long;
dy = @(x,y)-1.2.*y + 7*exp(-0.3.*x);
h = 0.5;
x_end = 2;
y(1) = 3;
x(1) = 0;
N = x_end/2;
for i = 1:N
    x(i+1) = x(i) + h
    K1 = dy(x(i),y(i));
    K2 = dy(x(i)+h,y(i)+K1*h);
    y(i+1) = y(i) + 1/2*h*(K1+K2)
end
