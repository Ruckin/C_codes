function xdot = nonlinear_02(t, x)

g = 9.81;
L = .25;
m = .2;
u = 0;
k = .1; % THE BOOK HAS SOME ERROR

xdot = [x(2);
        -(g/L)*sin(x(1)) - (k/m)*x(2) + u/(m*L^2)];

return