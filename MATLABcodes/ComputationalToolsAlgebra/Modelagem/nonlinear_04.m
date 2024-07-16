function xdot = nonlinear_04(t, x)

tau = .3;
Jm = 1.2;
Bm = .1;
Jl = .3;
Bl = .05;
Kr = .5;
g = 9.81;
M = 2;
L = 1;

J = Jm + (Jl/Kr^2);
B = Bm + (Bl/Kr^2);
C = (M*g*L)/Kr;

xdot = [x(2);
        tau/J - (B/J)*x(2)-(C/J)*sin(x(1)/Kr)];

xdot = xdot(:);

return