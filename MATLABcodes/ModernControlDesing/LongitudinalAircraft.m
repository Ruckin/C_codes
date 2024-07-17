%
% CODE FOR TESTING DIFFERENT FUNCTIONS, IMPULSE RESPONSE AND STEP RESPONSE,
% APPLIED TO A LINEAR LONGITUDINAL AIRCRAFT MODEL.
%
% FREDERICO ANTONIAZZI - 06/06/2024(dd/mm/aaaa)
%
%

%% CLEANING AND PREPARATION:

clc;
clear;
close all;

format short;

t0 = 0;       % INITIAL SIMULATION TIME
dt = .5;      % SIMULATION STEP
tfinal = 250; % FINAL SIMULATION TIME

%% MAIN CODE:

% CHANGING THE AIRSPEED:
V_air = tf(-.005*conv([1 -70], [1 .5]), [conv([1 .005 .006], [1 1 1.4])]);

% CHANGING THE ANGLE OF ATTACK:
alpha = tf(-.02*conv([1 80], [0 .0065 .0006]), [conv([1 .005 .006], [1 1 1.4])]);

% CHANGING THE PITCH ANGLE:
theta = tf(-1.4*conv([1 .02], [1 .4]), [conv([1 .005 .006], [1 1 1.4])]);

%% SIMULATION OF THE INPULSE RESPONSE FOR THE PITCH ANGLE:

[theta_impulse, t] = impulseresponse(theta.Numerator{1, :}, theta.Denominator{1, :}, t0, dt, tfinal);

figure;
plot(t, theta_impulse);
grid on;
xlabel('Time / s');
title('Impulse Response Longitudinal Aircraft');

%% SIMULATION OF THE STEP RESPONSE FOR THE PITCH ANGLE:

[theta_step, ~] = stepresponse(theta.Numerator{1, :}, theta.Denominator{1, :}, t0, dt, tfinal);

figure;
plot(t, theta_step);
grid on;
xlabel('Time / s');
title('Step Response Longitudinal Aircraft');

%% SIMULATION OF THE TIME RESPONSE FOR THE PITCH ANGLE:

t = 0:.1:20;
u = .01*t.*sin(1.3*t);

theta_response = response(theta.Numerator{1, :}, theta.Denominator{1, :}, t, u);

figure;
plot(t, theta_response);
grid on;
xlabel('Time / s');
title('Time Response Longitudinal Aircraft');

%% CALCULATING THE TIME SOLUTION FOR STATE-SPACE REPRESENTATION OF THE LONGITUDINAL AIRCRAFT MODEL:

A = [.4158 1.025 -.00267 -.0001106 -.08021 0; -5.5 -.8302 -.06549 -.0039 -5.115 .809; ...
     0 0 0 1 0 0; -1040 -78.35 -34.83 -.6214 -856.6 -631; ...
     0 0 0 0 -75 0; 0 0 0 0 0 -100];

B = [0 0; 0 0; 0 0; 0 0; 75 0; 0 100];

C = [-1491 -146.43 -40.2 -.9412 -1285 -564.66; 0 1 0 0 0 0];

D = zeros(min(size(C)), min(size(B)));

x0 = [.1 0 0 0 0 0]';

t = 0:6.6667e-3:5;
u = [-.05*sin(10*t); .05*sin(12*t)]';

[y2, x2] = march(A, B, C, D, x0, t, u, 'zoh');

figure;
plot(t, y2(:, 1));
grid on;
xlabel('Time / s');
title('Time Response Longitudinal Aircraft');
legend('Zero order holder');
