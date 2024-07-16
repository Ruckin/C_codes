close all
clear
clc

format long
% format short

x0 = [.1 0];
simTime = [0 10];

[t, y] = ode45('nonlinear_04', simTime, x0);

plot(t, y, 'LineWidth', 1.5)
grid on
title('Pendulum Simulation')
legend('\theta[rad]', '\omega[rad/s]')
xlabel('t[s]')
ylabel('\theta, \omega')
