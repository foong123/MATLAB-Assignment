clc;
clear all;
close all;
format long;
f = @(x) 0.2 + (25*x) - (200*x^2) + (675*x^3) - (900*x^4) + (400*x^5);  %Change here for a different function
b = 0.8;   % Upper limit of the function
a = 0;     % Lower limit of the function

% Single Simpson's 1/3 rule
% answer = (b-a) * ((f(a) + (4*f((b-a)/2)) + f(b))/6)

% For a specific subinterval where n must be an even positive number (Composite Simpson's 1/3 Rule)
%{
n = 8;              % Number of subinterval
h = (b-a)/n;        % Average width
p = 0;              % initializing x_p where p is the starting point
for i = a:h:b       % for loop starting a to b with increment of h
    p = p+1;        % for x_p to x_n with increase of 1 
    x(p) = i;      
    y(p) = 0.2 + (25*i) - (200*i^2) + (675*i^3) - (900*i^4) + (400*i^5);     % Change for a different function       
end
L = length (x);     % Find the max value of x_p ( max size of dimension of x)
x
y
SumOdd = sum(y(3:2:L-1))     % Summation of odd points represent the middle term
SumEven =sum(y(2:2:L-1))     % Summation of even points to adjacent points
answer = (h/3)* (y(1) + 4*SumEven + 2*SumOdd + + y(L));
fprintf('Answer = %.16f\n',answer);
%}

% For subinterval ranging from 2 to 100 (Composite Simpson's 1/3 Rule)
% Where the subinterval n must be an even positive number

for n = 2:2:100        % Number of subinterval from 2 to 100
    h = (b-a)/n;       % Average width
    p = 0;             % initializing x_p where p is the starting point
    for i = a:h:b      % for loop starting a to b with increment of h
        p = p+1;       % for x_p to x_n with increase of 1 
        x(p) = i;      
        y(p) = 0.2 + (25*i) - (200*i^2) + (675*i^3) - (900*i^4) + (400*i^5);    % Change for a different function. 
    end
    L = length (x);       % Find the max value of x_p ( max size of dimension of x)
    x;
    y;
    SumOdd = sum(y(3:2:L-1));     % Summation of odd points represent the middle term
    SumEven =sum(y(2:2:L-1));     % Summation of even points to adjacent points
    answer = (h/3)* (y(1) + 4*SumEven + 2*SumOdd + + y(L));
    fprintf('Answer = %.16f\n',answer);
end
 




