close all
clear
clc

% format short
format long

x0 = [1 0 0 1];
simTime = [0 10];

[t, y] = ode45('nonlinear_05', simTime, x0);

figure
plot(t, y(:,1), t, y(:,3), 'LineWidth', 1.5)
grid on
title('Satellite Simulation')
legend('r', 'v')
xlabel('t[s]')
ylabel('\r, v[u. n]')

figure
plot(t, y(:,2), t, y(:,4), 'LineWidth', 1.5)
grid on
title('Satellite Simulation')
legend('\alpha', '\omega')
xlabel('t[s]')
ylabel('\alpha[rad], \omega[rad/s]')
