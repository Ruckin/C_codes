function dx = pendulumCartModel(x, F, m, M, L, g, d, I)

dx(1) = x(2);
dx(2) = (m^2*L^2*g*cos(x(3))*sin(x(3)) + (I + m*L^2)*(m*L*sin(x(3))*x(2)^2) + (I + m*L^2)*F)/((M + m)*(I + m*L^2) - m^2*L^2*cos(x(3))^2);
dx(3) = x(4);
dx(4) = (m*L*cos(x(3))*(F - d*x(2) - m*L*sin(x(3))*x(4)^2) + (M + m)*m*L*g*sin(x(3)))/(m^2*L^2*(cos(x(3))^2 - (M + m)*(I + m*L^2)));