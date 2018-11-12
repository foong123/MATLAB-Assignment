% Name: Foong Pak Chuen
% Student ID: 016823
% Email: kecy6fpc@nottingham.edu.my

%All angle in degree

function Incident_angle = Angle(x1,y1,x2,y2)

    Incident_angle = abs(atand((x2-x1)./(y2-y1)));
    
end