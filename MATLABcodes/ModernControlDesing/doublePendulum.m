%
% FREDERICO ANTONIAZZI - 07/06/2024(dd/mm/aaaa)
% CODE FOR IMPLEMENTATION OF NONLINEAR DOUBLE PENDULUM SYSTEM
%

function xp = doublePendulum(t, x)

% x = [theta1 theta2 theta1dot theta2dot];

m1 = 1;
m2 = 2;
l1 = 1;
l2 = 2;
g = 9.81;

u = .01*sin(5*t);

xp(1, 1) = x(3);
xp(2, 1) = x(4);

x21 = x(2) - x(1);

xp(3, 1) = (m2*l1*x(3)^2*sin(x21)*cos(x21) + m2*l2*x(4)^2*sin(x21) ...
            + m2*g*sin(x(2))*cos(x21) - (m1 + m2)*g*sin(x(1)))/ ...
            ((m1 + m2)*l1 - m2*l1*cos(x21)^2);
xp(4, 1) = -(g*sin(x(2)) + l1*x(3)^2*sin(x21) + l1*xp(3)*cos(x21))/l2 + ...
             u/(m2*l2^2);
