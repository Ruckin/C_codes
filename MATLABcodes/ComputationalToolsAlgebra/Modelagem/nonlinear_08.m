function xdot = nonlinear_08(t, x)

m = [1 1];
L = [2 2];
g = 9.81;
q = x(1:2);
qp = x(3:4);

controle = [cos(t); sin(t)];
[M, C, G] = f_matmcg(q, qp, g, L, m);

xdot = [qp;
        -M\(C + G) + M\controle];

return