clc;
close all;
format long;
V_o = 500;                                  % Declaring and initializing constant and inital values
L = 15;
h = 0.005;
R = @(I) 500 + (250*(I^2));                 % Setting the R function
t = 0:h:0.1;                                % Setting the time start at 0 and ends at 0.1 with increment of 0.005s
ODE = @(t,I) ((V_o./L)-(R(I)./L).*I);       % Setting the ODE function
[t,I] = odeMIDPOINT(ODE,0,0.1,0.005,0);     % Passing the parameters to the odeMIDPOINT function
Answer = [t;I]

% Plotting the transient response of the current with varying R
plot(t,I,'-*');
title('Transient response of Current (I)');
xlabel('Time/s');
ylabel('Current/A');
grid on;