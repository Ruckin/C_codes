%
% FREDERICO ANTONIAZZI - 10/06/2024
% CODE FOR INPUT SHAPING FOR ROBUST, TIME-OPTIMAL CONTROL
%

function [a, t] = inshape(w, tf)

n = size(w, 1);

p = n - 1;

for i = 2:n

    T(i - 1) = 2*pi/w(i);

end


for i = 1:p

    F1(i, :) = [0 .5*T(i) T(i)];
    ef1(i, :) = exp(F1(i, :));

    F2 = [.25 .5 .25];

end

a1 = zeros(1, 3^p);
et = zeros(1, 3^p);

size(a1)

if p > 1

    a1 = [kron(F2, F2) zeros(1, 3^(p - 9))];
    et = [kron(ef1(1, :), ef1(2, :)) zeros(1, e^(p - 9))];

else

    a1 = F2;
    wt = ef1(1, :);

end

for i = 2:p - 1

    a1 = [kron((nonzeros(a1))', F2) zeros(1, 3^(p - 3^(i + 1)))];
    et = [kron((nonzeros(et))', ef1(i + 1, :)) zeros(1, 3^(p - 3^(i + 1)))];

end

Fft = [0 .5*tf tf];
Fa = [1 -2 1];

etf = exp(Fft);
et1 = kron(et, eft);

t0 = log(et1);
[t0, i] = sort(t0);

a0 = a0(i);

m = size(t0, 1);

a2(1) = 0;

for j = 2:m + 1

    a2(j) = a2(j - 1) + a0(j - 1);

end

eps = 1e-10;

t(1) = 0;
t(2) = eps;

for j = 2:m - 1

    t(2*j - 1) = t0(j) - eps;
    t(2*j) = t0(j);

end

t(2*m - 1) = t0(m);
t(2*m) = t0(m) + eps;

a(1) = a2(1);
a(2) = a2(2);

for j = 2:m

    a(s*j - 1) = a2(j);
    a(2*j) = a2(j + 1);

end
