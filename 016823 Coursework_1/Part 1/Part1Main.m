clc;
format long;
a = 6;                                % Major Axis of ellipse
b = 3;                                % Minor Axis of ellipse
P = EllipsePer(a,b);                  % Sending the parameters of a and b to EllisePer function
I = Simpson38(P, 0, pi/2);            % Sending the parameters to Simpson38 function
P = 4*a*I                             % Calculates the perimeter of the from the calculated I