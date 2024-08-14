%% MAIN CODE FOR USING RK4 CODE IN VAN DER POL EQUATION:
%  FREDERICO ANTONIAZZI - 12/08/2024
%

% USING THE KRYLOV-BOGULIOBOV METHOD FOR SMALL PERTURBATIONS THEORY APPLIED
% IN VAN DER POL SOLUTION TESTING.

%% CLEANING AND PREPARING THE WORKSPACE

clc;
clear;
close all;

format short;

%% CREATING THE VARIABLES NEEDED:

tf = 10;       % 10 SECONDS OF SIMULATION
dt = tf/10000; % TIME INTERVAL
t = 0:dt:tf;   % VECTOR TIME

% SMALL PERTURBATION VALUE:
epsilon = 1e-4;

% INITIAL CONDITIONS FOR LORENZ:
y0 = [0 0]';

%% SIMULATING THE DYNAMICAL SYSTEM:

xin = y0;
X = xin;

for i = 0:dt:tf
    
    time = i*dt;
    yout = rk4_step(@(t, y)vanDerPol(t, y, epsilon), dt, time, xin);
    X = [X yout];
    xin = yout;

end

%% VERIFICATON OF THE RESULTS:

plot(t, X(2, 1:end-1), 'k', 'LineWidth', 3);
hold on;

% COMPARING WITH THE BUILD-IN MATLAB RK4 ADAPTIVE STEP
[t, z] = ode45(@(t, z)vanDerPol(t, z, epsilon), 0:dt:tf, y0);
plot(t, z(:, 2), 'r', 'LineWidth', 3);
hold off;
xlabel('Time / [s]');
ylabel('y');
title('Simulation of Van Der Pol');
legend('Fixed Step', 'Adaptive Step');
grid on;

%% SOLVING THE PERTURBATION TEST:


