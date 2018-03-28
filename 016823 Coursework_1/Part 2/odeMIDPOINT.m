function [x,y] = odeMIDPOINT(ODE,a,b,h,yINI)
format long;
x = a:h:b;
y = length(x);
y(1) = yINI;

% Midpoint Calculation
for i = 1:(b-a)/h                        
    K_1 = ODE(x(1),y(i));
    K_2 = ODE(x(i) + (0.5.*(h)), y(i) + (0.5.*K_1.*h));
    y(i+1) = y(i) + K_2.*h;
    
x = x;
y = y;
end


