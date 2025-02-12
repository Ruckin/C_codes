function [M, C, G] = f_matmcg(q, qp, g, L, m)

M(1, 1) = (m(1) + m(2))*L(1)^2 + m(2)*L(2)^2 + 2*m(2)*L(1)*L(2)*cos(q(2));
M(1, 2) = m(2)*L(2)^2 + m(2)*L(1)*L(2)*cos(q(2));
M(2, 1) = M(1, 2);
M(2, 2) = m(2)*L(2)^2;

C(1, 1) = -m(2)*L(2)*L(1)*(sin(q(2)))*qp(2)*(2*qp(1) + qp(2));
C(2, 1) = m(2)*L(1)*L(2)*sin(q(2))*qp(1)^2;

G(1, 1) = -(m(1) + m(2))*g*L(1)*cos(q(1)) - m(2)*g*L(2)*cos(q(1) + q(2));
G(2, 1) = -m(2)*g*L(2)*cos(q(1) + q(2));

return