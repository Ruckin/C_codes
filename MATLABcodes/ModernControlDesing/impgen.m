%
% FREDERICO ANTONIAZZI - 07/06/2024(dd/mm/aaaa)
% CODE FOR IMPLEMENTATION OF TIME-MARCHING SOLUTION OF LINEAR
% TIME-INVARIANT STATE-SPACE EQUATION
%

function [y, x] = impgen(A, B, C, D, x0, t, c)

n = size(t, 2);
dt = t(2) - t(1);

[ad, bd, ~, ~] = c2dm(A, B, C, D, dt, 'zoh');

Bd = ad*bd;

u = ones(n, 1)*c';

x = ltitr(ad, Bd, u, x0);

y = x*C' + u*D';
