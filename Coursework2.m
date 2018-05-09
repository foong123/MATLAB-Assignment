%Coursework_2
%Foong Pak Chuen
%Student ID: 016823
%Email: kecy6fpc@nottingham.edu.my


function [] = Coursework2()
clc;
close all;
format short;

a = 1;
b = 3;

N = 2;
V1 = Answer(a,b,N)
figure(1)
plot_surf(V1,N);
figure(2);
plot_quiver(V1,N);

N = 10;
V1 = Answer(a,b,N);
figure(3)
plot_surf(V1,N);
figure(4);
plot_quiver(V1,N)

function [V1] = Answer(a,b,N)
d = a/N;
matrixsize = (b/d)+1;
V_a = 1;
V_b = -1;
tolerance = 1;
V1_previous = zeros(matrixsize);
V1_previous(1,:) = V_b;
V1_previous(matrixsize,:) = V_b;
V1_previous(:,matrixsize) = V_b;
V1_previous(:,1) = V_b;
V1_previous(N+1:((2*N)+1), N+1:((2*N)+1)) = V_a;
V1_now = V1_previous;
while tolerance > 10^-8
    for i = 2:1:matrixsize-1
        for j = 2:1:matrixsize-1
            if(V1_now(i,j) ~= 1)
                V1_now(i,j) = 0.25*(V1_previous(i+1,j) + V1_previous(i-1,j) + V1_previous(i,j - 1) + V1_previous(i,j+1));
            end
        end
    end
        tolerance = max(max(abs(V1_now-V1_previous)));
        V1_previous = V1_now;
end
V1 = V1_previous;

function plot_surf(V1,N)
surf(V1,'FaceColor','flat','EdgeColor','k','Marker','x','MarkerEdgeColor','k')
c = colorbar('location','eastoutside','fontsize',12,'Ticks',[-1,1],'TickLabels',{'Low','High'});
c.Label.String = 'Electric Field Intensity';
colormap('jet');
xlabel('X','fontSize',12);
ylabel('Y','fontSize',12);
zlabel('Voltage/V','fontSize',12);
title(['Electric Potential N = ',num2str(N)],'fontsize',12);

function plot_quiver(V1,N)
[FX,FY] = gradient(-V1);
quiver(FX,FY);
xlabel('X','fontSize',12);
ylabel('Y','fontSize',12);
zlabel('Voltage/V','fontSize',12);
title(['Electric Potential N = ',num2str(N)],'fontsize',12);
grid on;
grid minor;