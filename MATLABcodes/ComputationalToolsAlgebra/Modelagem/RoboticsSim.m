close all
clear
clc

% format short
format long

x0 = [.1 .1 0 0];
simTime = [0 10];

[t, y] = ode23('nonlinear_08', simTime, x0);

figure
plot(t, y(:, 1), t, y(:, 3), 'LineWidth', 1.5)
grid on
title('Robotics Simulation')
legend('\theta_{1}', '\omega_{1}')
xlabel('t[s]')
ylabel('\theta_{1}[rad], \omega_{1}[rad/s]')

figure
plot(t, y(:, 2), t, y(:, 4), 'LineWidth', 1.5)
grid on
title('Robotics Simulation')
legend('\theta_{2}', '\omega_{2}')
xlabel('t[s]')
ylabel('\theta_{2}[rad], \omega_{2}[rad/s]')
