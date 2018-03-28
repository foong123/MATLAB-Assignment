clc;
clear all;
close all;
f = @(x) 0.2 + (25*x) - (200*x^2) + (675*x^3) - (900*x^4) + (400*x^5);  %Change here for a different function
b = 0.8;   % Upper limit of the function
a = 0;     % Lower limit of the function

% Single Trapezium
answer = (b-a) * ((f(a) + f(b))/2)

% For a specific interval(Composite Trapezoidal Rule)
%{
n = 10;             % Number of Interval
h = (b-a)/n;        % Average height of the trapezium
p = 0;              % initializing y_p where p is the starting point
for i = a:h:b       % for loop starting a to b with increment of h
    p = p+1;        % for y_p to y_n with increase of 1 
    x(p) = i;      
    y(p) = 0.2 + (25*i) - (200*i^2) + (675*i^3) - (900*i^4) + (400*i^5);    % Change for a different function. 
end
L = length (x);     % Find the max value of x_p ( max size of dimension of x)
x;
y;
answer = (h/2)* ((y(1) + y(L)) + 2*(sum(y) - y(1) - y(L)))  
%(sum(y) - y(1) - y(L)) is the summation of all the y(p) minus the first and the last term

fprintf('Answer = %.16f\n',answer);

%}

% For interval ranging from 2 to 10 (Composite Trapezoidal Rule)
%{
for n = 2:1:10;        % Number of intervals from 2 to 10
    h = (b-a)/n;       % Average height of the trapezium
    p = 0;             % initializing x_p where p is the starting point
    for i = a:h:b      % for loop starting a to b with increment of h
        p = p+1;       % for x_p to x_n with increase of 1 
        x(p) = i;      
        y(p) = 0.2 + (25*i) - (200*i^2) + (675*i^3) - (900*i^4) + (400*i^5);    % Change for a different function. 
    end
    L = length (x);        % Find the max value of x_p ( max size of dimension of x)
    x;
    y;
    answer = (h/2)* ((y(1) + y(L)) + 2*(sum(y) - y(1) - y(L)));
    %(sum(y) - y(1) - y(L)) is the summation of all the y(p) minus the first and the last term
  
    fprintf('Answer = %.16f\n',answer);
 end
%}


