% Name: Foong Pak Chuen
% Student ID: 016823
% Email: kecy6fpc@nottingham.edu.my

clear;
clc;
close all;
format long;

%Define Variables

steps = 0.1; 
c = 3e8;  %Speed of light
f = 2.4e9; %Operation frequency
wavelength = c/f;
Beta = (2*pi*f)/wavelength; %Wave number
i = 1;

%   Assume all points are on same z plane
Tx = [0 4 2];       %Transmitter location
Rx_P = [10 3 10];     %Initial Receiver Location
Rx_Q = [22 3 0];     %Final Receiver Location

E = zeros(1,121);   %Preallocate E array

for x = Rx_P(1):steps:Rx_Q(1)
    
    r = distance(Tx,[x 3 z]); %Distance between Tx and Rx
    E(i) = (1/r)*(exp(-1i*Beta*r))*(wavelength/(4*pi));
    i=i+1;    %Increment of counter 1
 
end

x = Rx_P(3):steps:Rx_Q(3);
z = Rx_P(3):steps:Rx_Q(3);
y = 20*log10(abs(E));
surf(x,y,z,'-k');
% hold on;
% plot(10,y(1),'bx','MarkerSize',12);
% hold on;
% plot(22,y(length(y)),'rx','MarkerSize',12);
% 
% title('Line of Sight Path Gain');
% xlabel('Hallway Length/m');
% ylabel('Path Gain/dB');
% grid on;
% grid minor;