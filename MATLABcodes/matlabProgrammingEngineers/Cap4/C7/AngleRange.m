%% FREDERICO CASARA ANTONIAZZI
%  CODE FOR CALCULATE THE DISTANCE TRAVELED BY A BALL
%  CODE IN PROGRAMMING WITH MATLAB OF CHAPMAN SECOND EDITION

%% INITIAL DEFINITIONS:

clear
close all % MUST REMEMBER TO COMMENT THE CLOSE ALL COMMAND
clc

format short
% figure % IN THE CASE FOR MORE THAN ONE FIGURE
 
%% PURPOSE OF THE CODE:

%  TOHIS PROGRAM CALCULATES THE DISTANCE TRAVELED BY A BALL THROWN AT A
%  SPECIFIED ANGLE "theta" AND A SPECIFIED VELOCITY "v0" FROM A POINT ON
%  THE SURFACE OF THE EARTH, IGONORING AIR FRICTION AND THE EARTH'S
%  CURVATURE. IT CALCULATES THE ANGLE YIELDING MAXIMUM RANGE, AND ALSO
%  PLOTS SELECTED TRAJECTORIES.
%
% VARIABLES:
% i, j      -> LOOP INDEX
% conv      -> DEGREES TO RADIANS CONVERTION FACTOR 
% g         -> GRAVITY IN m/s²
% index     -> LOCATION OF MAXIMUM RANGE IN ARRAY
% maxangle  -> ANGLE THAT GIVES MAXIMUM RANGE (deg)
% maxrange  -> MAXIMUM RANGE (m)
% range     -> RANGE FOR A PARTICULAR ANGLE (m)
% time      -> TIME (s)
% theta     -> INITIAL ANGLE (deg)
% traj_time -> TOTAL TRAJECTORY TIME (s)
% v0        -> INITIAL VELOCITY (m/s)
% vX0       -> x-COMPONENT OF INITIAL VELOCITY (m/s)
% vY0       -> y-COMPONENT OF INITIAL VELOCITY (m/s)
% x         ->
% y         ->

%% MAIN CODE:

%
% CONTANTS:
%
v0   = input('ENTER THE INITIAL VELOCITY: '); % m/s
g    = -9.81;                                 % m/s²
% conv = pi/180;                                % ADIMENSIONAL

%
% CREATE AN ARRAY TO HOLD RANGES:
%
range = zeros(1, 91);

%
% CALCULATE MAXIMUM RANGE:
%
for i = 1:91

    theta = i - 1;

    vX0 = v0*cosd(theta);
    vY0 = v0*sind(theta);
%     vX0 = v0*cos(theta*conv);
%     vY0 = v0*sin(theta*conv);

    max_time = -2*vY0/g;

    range(i) = vX0*max_time;

end

%
% WRITE OUT TABLE OF RANGES:
%
fprintf('range VERSUS ANGLE theta:\n');
for i = 1:91

    theta = i - 1;
    fprintf('%2d %8.4f\n', theta, range(i));

end

%
% CALCULATE THE MAXIMUM RANGE AND ANGLE:
%
[maxrange, index] = max(range);
maxangle = index - 1;

fprintf('\nMAX RANGE IS %8.4f at %2d º\n', maxrange, maxangle);

%
% NOW PLOT THE TRAJECTORIES:
%
for i = 5:10:85

    % GET VELOCITIES AND MAX TIME FOR THIS ANGLE:
    theta = i - 1;
    
    vX0 = v0*cosd(theta);
    vY0 = v0*sind(theta);
%     vX0 = v0*cos(theta*conv);
%     vY0 = v0*sin(theta*conv);

    max_time = -2*vY0/g;

    % CALCULATE THE (x, y) POSITIONS
    x = zeros(1, 21);
    y = zeros(1, 21);

    for j = 1:21

        time = (j - 1)*max_time/20;

        x(j) = vX0*time;
        y(j) = vY0*time + 0.5*g*time^2;
    
    end

    plot(x, y, 'b');
    if i == 5

        hold on;

    end
end

%
% ADDING INFORMATION IN THE PLOT:
%
title('TRAJECTORY OF BALL vs INITIAL ANGLE \theta');
xlabel('x \rm\bf(meters)');
ylabel('y \rm\bf(meters)');
xlim('auto');
ylim([0 (2+maxrange*1/2)]);
grid on;

%
% NOW PLOT THE MAX RANGE TRAJECTORY:
%
vX0 = v0*cosd(maxangle);
vY0 = v0*sind(maxangle);
% vX0 = v0*cos(maxangle*conv);
% vY0 = v0*sin(maxangle*conv);


max_time = -2*vY0/g;

%
% CALCULATE THE (x, y) POSITIONS:
%

x = zeros(1, 21);
y = zeros(1, 21);

for j = 1:21

    time = (j - 1)*max_time/20;

    x(j) = vX0*time;
    y(j) = vY0*time + 0.5*g*time^2;
    
end

plot(x, y, 'r', 'LineWidth', 3);
hold off;
