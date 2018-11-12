% Name: Foong Pak Chuen
% Student ID: 016823
% Email: kecy6fpc@nottingham.edu.my

%All angle in degree

function reflection_coefficient = Coeff(angle,epsilon_wall,epsilon_air)

    reflection_coefficient = (cosd(angle)-sqrt(epsilon_wall/epsilon_air).*cosd(asind(sind(angle)./sqrt(epsilon_wall/epsilon_air)))) ./(cosd(angle)+sqrt(epsilon_wall/epsilon_air).*cosd(asind(sind(angle)./sqrt(epsilon_wall/epsilon_air))));
    
end
