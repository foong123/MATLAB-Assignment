clc;
clear all;
close all;
f = @(x) 0.2 + (25*x) - (200*x^2) + (675*x^3) - (900*x^4) + (400*x^5);  %Change here for a different function
b = 0.8;   % Upper limit of the function
a = 0;     % Lower limit of the function
%{
   Simpson's 3/8 Rule 
   I = (3h/8) * (f(a) + 3f(x_2) + 3f(x_3) + f(b))
%}
% Single Simpson's 3/8 Rule
% answer = 3*((b-a)/3)/8 * (f(a) + 3*f((b-a)/3) + 3*f(2*(b-a)/3) + f(b))

 
%{ 
   Composite Simpson's 3/8 Rule 
   I = 3h/8 * ((f(a) + 3*[sum(f(x_i)) for i = 2,5,8,...] + 3*[sum(f(x_j)) for j = 3,6,9,...]
       + 2*[sum[f(x_k)] for k = 4,7,10...])
%}
 
% For a specific subinterval where n must be divisible by 3(Composite Simpson's 1/3 Rule)
%{
n = 6;              % Number of subinterval
h = (b-a)/n;        % Average height of the trapezium
p = 0;              % initializing x_p where p is the starting point
for i = a:h:b       % for loop starting a to b with increment of h
    p = p+1;        % for x_p to x_n with increase of 1 
    x(p) = i;      
    y(p) = 0.2 + (25*i) - (200*i^2) + (675*i^3) - (900*i^4) + (400*i^5);    % Change for a different function       
end
L = length (x);     % Find the max value of x_p ( max size of dimension of x)
x;
y;
SumWeighti = sum(y(2:3:L-1));     % Summation of points for i = 2,5,8,...
SumWeightj = sum(y(3:3:L-1));     % Summation of points for j = 3,6,9,...
SumWeightk = sum(y(4:3:L-1));     % Summation of weightage of 2 (adjacent points) for k = 4,7,10,...
answer = ((3*h)/8) * (y(1) + 3*SumWeighti + 3*SumWeightj + 2*SumWeightk + y(L));
fprintf('Answer = %.16f\n',answer);
%}

% For subinterval ranging from 3 to 100 (Composite Simpson's 1/3 Rule)
%{
for n = 3:3:100;       % Number of subintervals from 3 to 100
    h = (b-a)/n;       % Average width
    p = 0;             % initializing x_p where p is the starting point
    for i = a:h:b      % for loop starting a to b with increment of h
        p = p+1;       % for x_p to x_n with increase of 1 
        x(p) = i;      
        y(p) = 0.2 + (25*i) -(200*i^2) + (675*i^3) - (900*i^4) + (400*i^5);    % Change for a different function. 
    end
    L = length (x);      % Find the max value of x_p ( max size of dimension of x)
    x;
    y;
    SumWeighti = sum(y(2:3:L-1))     % Summation of points for i = 2,5,8,...
    SumWeightj = sum(y(3:3:L-1))    % Summation of points for j = 3,6,9,...
    SumWeightk = sum(y(4:3:L-1))     % Summation of weightage of 2 (adjacent points) for k = 4,7,10,...
    answer = ((3*h)/8) * (y(1) + 3*SumWeighti + 3*SumWeightj + 2*SumWeightk + y(L));
    fprintf('Answer = %.16f\n',answer);
 end
%}



