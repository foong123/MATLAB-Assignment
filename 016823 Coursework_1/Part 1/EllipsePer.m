function [P] = EllipsePer(a,b)
    format long;
    k = sqrt((a^2) - (b^2))/a;                          % Calculates the constant k
    P = @(theta) sqrt(1-(k.^2)*(sin(theta).^2));        % Creating the a function of P with respect to theta
end