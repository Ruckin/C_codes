function xdot = nonlinear_05(t, x)

omega = 1;
d = 1;
cktr1 = 0;
ckrt2 = 1;

k = omega^2*d^3;

aux1 = -(k/x(1)^2) + cktr1 + x(1)*x(4)^2;
aux2 = (ckrt2/x(1)^2) - (2*x(1)*x(2)*x(4))/x(1)^2;

xdot = [x(2);
        aux1;
        x(4);
        aux2];

return