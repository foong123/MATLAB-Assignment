function [I] = Simpson38(Fun,a,b)
    format long;
    n = 3;                            % Initial number of subintervals
    PercentageDifference = 1;         % Declare and initialize percentage difference
    h = (b-a)/(n);                    % Width  
    x = a:h:b;                        % Setting x into arrays starting at 0 to pi/2 with increment of h  
    y = Fun(x);
    L = length(y);                    % Getting the max dimension of y
    SumWeighti = sum(y(2:3:L-1));     % Summation of points for i = 2,5,8,...
    SumWeightj = sum(y(3:3:L-1));     % Summation of points for j = 3,6,9,...
    SumWeightk = sum(y(4:3:L-1));     % Summation of weightage of 2 (adjacent points) for k = 4,7,10,...
    previous = ((3*h)/8) * (y(1) + 3*SumWeighti + 3*SumWeightj + 2*SumWeightk + y(L));   % First iteration
    
    while (PercentageDifference > 0.1)
        n = n*2;                        %For next iteration
        h = (b-a)/(n);                  
        x = a:h:b;
        y = Fun(x);
        L = length(y);
        SumWeighti = sum(y(2:3:L-1));     % Summation of points for i = 2,5,8,...
        SumWeightj = sum(y(3:3:L-1));     % Summation of points for j = 3,6,9,...
        SumWeightk = sum(y(4:3:L-1));     % Summation of weightage of 2 (adjacent points) for k = 4,7,10,...
        answer = ((3*h)/8) * (y(1) + 3*SumWeighti + 3*SumWeightj + 2*SumWeightk + y(L));
        PercentageDifference = (abs(previous - answer)/previous)*100;      % Calculates the percentage difference
        previous = answer;                % Update the prevoius value
    end
    I = previous;                         % Returns the final output
end