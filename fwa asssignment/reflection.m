% Name: Foong Pak Chuen
% Student ID: 016823
% Email: kecy6fpc@nottingham.edu.my

%##############################################################
clear;
clc;
close all;
format long;
%##############################################################

%##############################################################
%Define Variables
c = 3e8;  %Speed of light
f = 2.4e9; %Operation frequency
Epsilon_wall = 3; %Relative permittivity of wall
Epsilon_air = 1; %Relative permittivity of wall
wavelength = c/f;
Beta = (2*pi)/wavelength;
reflection_order = 3; %Reflection order
steps = 0.1;    %Steps size
figure_counter = 2; %Figure counter
%##############################################################

%##############################################################
%Transmitter coordinates
xs = 0;
ys = 4;
zs = 0;

%Receiver coordinates
px = 10;
qx = 22;
xr = 10:steps:22;
yr = 3;
zr = 0;
array_size = size(xr,2);

%Walls y-coordinates
upper_wall_height = 6;
lower_wall_height = 0;

%Image coordinate
image = [];
image(1,1:2) = ys;
%##############################################################

%##############################################################
%Line of Sight

r = distance(xs,ys,zs,xr,yr,zr); %Distance between tx and rx
E = (1./r).*(exp(-1i*Beta*r))*(wavelength/(4.*pi));
P = 20*log10(abs(E));

figure(1);
plot(xr,P,'r');
title('Line of Sight Path Gain');
Graph_settings();
%##############################################################

%##############################################################
for k = 2:reflection_order+1
    
    %Clear array
    reflected_ray_Sum = zeros(1,array_size);
    
    %Top and bottom reflection
    for top_bottom = 1:2
        
        %Get the y-coordinate of the image
        if rem(k,2) == 1
            %Top wall
            if top_bottom==1
                image(k, top_bottom) = upper_wall_height + (upper_wall_height - image(k-1,top_bottom));
            else
                image(k, top_bottom) = lower_wall_height - (image(k-1,top_bottom) - lower_wall_height);
            end
        else
            %Bottom wall
            if top_bottom==1
                image(k, top_bottom) = lower_wall_height - (image(k-1,top_bottom) - lower_wall_height);
            else
                image(k, top_bottom) = upper_wall_height + (upper_wall_height - image(k-1,top_bottom));
            end
        end
        
        %Line equation (y = mx + c)
        m=0;
        c=0;
        x_rpoint=0;
        y_rpoint=0;
        
        %Gradient of the line equation
        m= (image(k,top_bottom)-yr)./(xs-xr);
        
        %y-intercept of the line equation
        c= yr - m.*xr;
        
        if any(image(k, top_bottom)) > 0
            x_rpoint= (upper_wall_height-c)./m;
        else 
            x_rpoint= (lower_wall_height-c)./m;
        end
        y_rpoint= (m.*x_rpoint)+c;
        
        %Hypothenuse 
        hypo = sqrt((x_rpoint-xr).^2+(y_rpoint-yr).^2);
        
        %Incident angle
        angle = Angle(xs,(image(k, top_bottom)),xr,yr);
        
        %Reflection coefficient
        coefficient = Coeff(angle,Epsilon_wall,Epsilon_air);
        
        %Distance from rx to image
        r = distance(xs,image(k,top_bottom),zs,xr,yr,zr);

        %Reflected rays magnitude
        reflected_ray = 1./r.*(exp(-1i.*Beta.*r)).*coefficient.^(k-1)*(wavelength/(4.*pi));

        %Sum all reflections of the same order
        reflected_ray_Sum = reflected_ray_Sum + reflected_ray;
          
    end
    
    E = E + reflected_ray_Sum;
    P = 20*log10(abs(E));
    figure(figure_counter); %Add new window for new reflection
    plot(xr,P); 
    Number_of_order = figure_counter - 1;  %Set the number of order of reflection of the current plot
    title(['Number of Order Reflection : ',num2str(Number_of_order)]);
    Graph_settings();
    figure_counter = figure_counter + 1;
    
end
%#############################################################