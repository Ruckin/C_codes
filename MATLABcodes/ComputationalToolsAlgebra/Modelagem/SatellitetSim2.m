close all
clear
clc

% format short
format long

x0 = [0 0 0 .1 .1 .1];
simTime = [0 10];

[t, y] = ode23('nonlinear_07', simTime, x0);

figure
plot(t, y(:,1), t, y(:, 2), t, y(:,3), 'LineWidth', 1.5)
grid on
title('Satellite Simulation')
legend('p', 'q', 'r')
xlabel('t[s]')
ylabel('p, q, r[rad/s]')

figure
plot(t, y(:,4), t, y(:,5), t, y(:,6), 'LineWidth', 1.5)
grid on
title('Satellite Simulation')
legend('\phi', '\theta', '\psi')
xlabel('t[s]')
ylabel('\phi, \theta, \psi[rad]')
