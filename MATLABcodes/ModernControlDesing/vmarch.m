%
% FREDERICO ANTONIAZZI - 07/06/2024(dd/mm/aaaa)
% CODE FOR IMPLEMENTATION OF TIME-MARCHING SOLUTION OF LINEAR
% TIME-VARIANT STATE-SPACE EQUATION
%

function [y, x] = vmarch(timeFunc, x0, t, u, method)

n = size(t, 2);
dt = t(2) - t(1);

x(1, :) = x0';

[A, B, C, D] = feval(timeFunc, t(1));

y(1, :) = x(1, :)*C' + u(1, :)*D';

for i = 1:n - 1

    [ad, bd, ~, ~] = c2dm(A, B, C, D, dt, method);

    x(i + 1, :) = x(i, :)*ad' + u(i, :)*bd';
    y(i + 1, :) = x(i + 1, :)*C' + u(i, :)*D';

end
