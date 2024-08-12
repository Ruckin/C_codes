%% MAIN CODE FOR IMPLEMENTATION AND TEST OF RUNGE-KUTTA SOLVER:
%  FREDERICO ANTONIAZZI - 12/08/2024
%

%% CLEANING AND PREPARING THE WORKSPACE

clc;
clear;
close all;

format short;

%% CREATING THE VARIABLES NEEDED:

tf = 10;       % 10 SECONDS OF SIMULATION
dt = tf/10000; % TIME INTERVAL

% CONSTANTS FOR LORENZ ATTRACTOR FROM 1963:
sigma = 10;
beta = 8/3;
rho = 28;

% INITIAL CONDITIONS FOR LORENZ:
y0 = [-8 8 27]';

%% SIMULATING THE DYNAMICAL SYSTEM:

xin = y0;
X = xin;

for i = 1:dt:tf
    
    time = i*dt;
    yout = rk4_step(@(t, y)lorenzAttractor(t, y, sigma, beta, rho), dt, time, xin);
    X = [X yout];
    xin = yout;

end

%% VERIFICATON OF THE RESULTS:

plot3(X(1, :), X(2, :), X(3, :), 'k', 'LineWidth', 3);
hold on;
view(20, 40);

% COMPARING WITH THE BUILD-IN MATLAB RK4 ADAPTIVE STEP
[t, z] = ode45(@(t, z)lorenzAttractor(t, z, sigma, beta, rho), 0:dt:tf, y0);
plot3(z(:, 1), z(:, 2), z(:, 3), 'r', 'LineWidth', 3);
hold off;
xlabel('x');
ylabel('y');
zlabel('z');
title('Comparing the Rk4 methods');
legend('Fixed Step', 'Adaptive Step');
grid on;
