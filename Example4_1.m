clc;
clear all;
format long;
dy = @(x,y)-1.2.*y + 7*exp(-0.3.*x);
h = 0.5;
x_end = 2.5;
y(1) = 3;
x(1) = 0;
N = x_end/h;
exact_y = @(x) (70/9)*exp(-0.3.*x) - (43/9) * exp(-1.2.*x);
for i = 1:N
    x(i+1) = x(i) + h;
    y(i+1) = y(i) + (dy(x(i),y(i))*h);
    True_solution = exact_y(x(i+1));
end
