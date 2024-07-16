function xdot = nonlinear_06(t, x)

g = 9.81;
L = .25;
m = .25;
u = 1;
M = .5;

aux1 = (-(u*cos(x(1))-g*(M + m)*sin(x(1)) + ...
        L*m*cos(x(1))*sin(x(1))*x(2)^2))/(L*(m + M - m*cos(x(1))^2));

aux2 = (-2*u + g*m*sin(2*x(1)) -2*m*L*sin(x(1))*x(2)^2)/ ...
        (-m -2*M +m*cos(2*x(1)));

xdot = [x(2);
        aux1;
        x(4);
        aux2];

return
