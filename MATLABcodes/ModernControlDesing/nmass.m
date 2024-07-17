%
% FREDERICO ANTONIAZZI - 10/06/2024
% CODE FOR n MASSES CONNECTED WITH n-1 SPRINGS OF STIFFNESS k.
%

function [a, b, c, d] = nmass(n, k)

K = zeros(n);

K(1, :) = k*[1 -1 zeros(1, n - 2)];

K(n, :) = k*[zeros(1, n - 2) -1 1];

for i = 2:n - 1

    K(i, :) = k*[zeros(1, i - 2) -1 2 -1 zeros(1, n - i - 1)];

end

a = [zeros(n) eye(n); -K zeros(n)];
b = [zeros(1, n) 1 zeros(1, n - 1)];
c = [ones(1, n) zeros(1, n)]/n;
d = 0;
