close all
clear
clc

% format long
format short

x0 = [2 0];
simTime = [0 10];

[t, y] = ode45('nonlinear_02', simTime, x0);

plot(t, y, 'LineWidth', 1.5)
grid on
title('Pendulum Simulation')
legend('\theta[rad]', '\omega[rad/s]')
xlabel('t[s]')
ylabel('\theta, \omega')

% figure
% plot(y(1), y(2))
% grid on
% title('Phase Plane')
% xlabel('\theta')
% ylabel('\omega')
