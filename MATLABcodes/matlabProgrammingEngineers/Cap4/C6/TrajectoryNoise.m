%% FREDERICO CASARA ANTONIAZZI
%  CODE FOR CALCULATE THE TRAJECTORY OF A OBJECT WITH NOISE IN THE
%  MEASUREMENT
%  ELEVENTH CODE IN PROGRAMMING WITH MATLAB OF CHAPMAN SECOND EDITION

%% INITIAL DEFINITIONS:

clear
close all
clc

format short
 
%% PURPOSE OF THE CODE:

%  TO PERFORM A LEAST-SQUARE FIT OF AN INPUT DATA SET TO A STRAINGHT LINE,
%  AND PRINT OUT THE RESULTING SLOPE AND INTERCEPT VALUES. THE INPUT DATA
%  FOR THIS FIT COMS FROM A USER-SPECIFIED INPUT DATA FILE.

% VARIABLES:
% i        -> LOOP INDEX 
% n_points -> NUMBER IN INPUT [X Y] POINTS
% slope    -> SLOPE OF THE LINE
% sum_x    -> SUM OF ALL INPUT X VALUES
% sum_x2   -> SUM OF ALL INPUT X VALUES SQUARED
% sum_xy   -> SUM OF ALL INPUT X*Y VALUES
% sum_y    -> SUM OF ALL INPUT Y VALUES
% temp     -> VARIABLE TO READ USER INPUT
% x        -> ARRAY OF X VALUES
% x_bar    -> AVERAGE OF X VALUES
% y        -> ARRAY OF Y VALUES
% y_bar    -> AVERAGE Y VALUES
% y_int    -> Y-AXIS INTERCEPT OF THE LINE

%% MAIN CODE:

% THE TOTAL OF INPUT THAT WILL USER-SPECIFIED
n_points = input('ENTER THE NUMBER OF INPUTS [X Y] POINTS: ');

% READ THE INPUT DATA:
for i = 1:n_points

    temp = input('ENTER [X Y] PAIR: ');
    x(i) = temp(1);
    y(i) = temp(2);

end

% INITIALIZE THE STATISTICAL VARIABLES:
sum_x = 0;
sum_y = 0;
sum_xy = 0;
sum_x2 = 0;


% ACCUMULATE STATISTICS:
for i = 1:n_points

    sum_x = sum_x + x(i);
    sum_y = sum_y + y(i);
    sum_x2 = sum_x2 + x(i)^2;
    sum_xy = sum_xy + x(i)*y(i);

end

% NOW CALCULATE THE SLOPE AND INTERCEPT:
x_bar = sum_x /n_points;
y_bar = sum_y /n_points;

slope = (sum_xy - sum_x*y_bar)/(sum_x2 - sum_x*x_bar);

y_int = y_bar - slope*x_bar;

% TELL USER:
fprintf('SLOPE (m) = %8.3f\n', slope);
fprintf('INTERCEPT (b) = %8.3f\n', y_int);
fprintf('No. OF POINTS = %8d\n', n_points);

% PLOTTING THE DATA POINTS AS BLUE CIRCLES WITH NO CONNECTIONG LINES:
plot(x, y, 'bo');
hold on;


% CREATE THE FITTED LINE:
xmin = min(x);
xmax = max(x);
ymin = slope*xmin + y_int;
ymax = slope*xmax + y_int;

% PLOT A SOLID RED LINE WITH NO MARKERS:

plot([xmin xmax], [ymin ymax], 'r-', 'LineWidth', 2);
hold off;

% ADDING INFO TO GRAPH:
title('LEAST-SQUARES FIT');
xlabel('x');
ylabel('y');
legend('Input Data', 'Fitted Line');
grid on
