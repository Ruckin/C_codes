%% CODING THE VAN DER POL SYSTEM EQUATIONS:
%  FREDERICO ANTONIAZZI - 14/08/2024

function xdot = vanDerPol(t, x, epsilon)

x1 = x(2);
x2 = epsilon*(1 - x(1)^2)*x(2) - x(1);

xdot = [x1 x2]';