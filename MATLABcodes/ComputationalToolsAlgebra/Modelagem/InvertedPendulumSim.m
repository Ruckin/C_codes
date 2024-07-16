close all
clear
clc

format long
% fomart short

x0 = [1. 0 1. 0];
simTime = [0 5];

[t, y] = ode45('nonlinear_06', simTime, x0);

figure
plot(t, y(:,1), t, y(:,2), 'LineWidth', 1.5)
grid on
title('Inverted Pendulum Simulation')
legend('\theta[rad]', '\omega[rad/s]')
xlabel('t[s]')
ylabel('\theta, \omega')

figure
plot(t, y(:,3), t, y(:,4), 'LineWidth', 1.5)
grid on
title('Inverted Pendulum Simulation')
legend('x[m]', 'v[m/s]')
xlabel('t[s]')
ylabel('\theta, \omega')
