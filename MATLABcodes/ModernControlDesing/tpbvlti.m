%
% FREDERICO ANTONIAZZI - 08/06/2024
% CODE FOR TIME-MARCHING SOLUTION OF THE TWO POINTS BOUNDARY-VALUE PROBLEM
% RESULTING FROM THE TERMINAL-TIME WEIGHTED, OPTIMAL REGULATOR.
%

function [u, x, t] = tpbvlti(A, B, Q, R, V, t0, tfinal, x0)

[w, ~] = damp(A);
mw = max(w);

if mw == 0

    dt = (tfinal - t0)/20;

else

    dt = 1/max(w);

end

t = t0:dt:tfinal;
n = size(t, 2);

x(1, :) = x0';
u_1(1, :) = 0*x0';

for i = 1:n - 1

    M = matricc(A, B, Q, R, V, t(i), tfinal);

    Ac = A - B\R*B'*M;

    [ad, ~] = c2d(Ac, B, dt);

    x(i + 1, :) = x(i, :)*ad';

    u_1(i + 1, :) = -x(i + 1, :)*M*B\R;

end

u = u_1;
