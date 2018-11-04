% Name: Foong Pak Chuen
% Student ID: 016823
% Email: kecy6fpc@nottingham.edu.my

function Incident_Angle = Angle(x1,y1,x2,y2)
    Incident_Angle = abs(atan((x2-x1)./(y2-y1)));
end