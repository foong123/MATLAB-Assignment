clc;
clear all;
format long;
dy = @(y) -3.*y;
h = 0.2;
x_end = 3.4;
y(1) = 3;
x(1) = 0;
N = x_end/h;
for i = 1:N
    x(i+1) = x(i) + h;
    y(i+1) = y(i) + (dy(y(i))*h);
    plot(x,y,'ro--');
    grid on
    axis([0 3.5 -10 10])
end

hold on
h = 0.7;
y1(1) = 3;
x1(1) = 0;

for i = 1:N
    x1(i+1) = x1(i) + h;
    y1(i+1) = y1(i) + (dy(y1(i))*h);
    plot(x1,y1,'*r--');
end