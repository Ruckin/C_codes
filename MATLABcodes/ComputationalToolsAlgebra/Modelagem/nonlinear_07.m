function dydt = nonlinear_07(t, y)

p = y(1);
q = y(2);
r = y(3);
phi = y(4);
theta = y(5);
psi = y(6);

Cx = .1;
Cy = .1;
Cz = .1;

dydt = [-.25*(Cx + q*r - 3*cos(theta)^2*cos(phi)*sin(phi));
        .210526*(-4*Cy + 4*p*r + 6*cos(phi)*sin(2*theta));
        .75*(Cz - p*q - 3*cos(theta)*sin(theta)*sin(phi));
        p + sec(theta)*sin(psi) + (cos(phi)*r + q*sin(phi))*tan(theta);
        cos(psi) + cos(phi)*q - r*sin(phi);
        sec(theta)*(cos(phi)*r + q*sin(phi)) + sin(psi)*tan(theta)];

return
