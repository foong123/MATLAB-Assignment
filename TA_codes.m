clear;
close all;
clc;
f = 2.4e9;
c = 3e8;
K = 0;
L = 0.125;
Beta = (2*pi*f)/c;
tx = 0;
ty = 4;
tz = 2;
rx = 10:0.1:22;
ry = 3;
rz = 2;
r = sqrt(((rx-tx).^2)+((ry-ty).^2)+((rz-tz).^2));
E = (1./r).*(exp(-1i*Beta*r)).*(L/(4.*pi));
P = 20*log10(abs(E));


plot(rx,P,'r-');
title('Line of Sight Graph');
grid on;
grid minor;
