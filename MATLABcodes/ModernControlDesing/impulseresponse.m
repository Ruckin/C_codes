%
% CODE FOR IMPLEMENTATION OF A FUNCTION FOR CALCULATING THE TIME RESPONSE
% OF A LINEAR TIME-INVARIANT DYNAMICAL SYSTEM TO A FINETE IMPULSE INPUT.
%
% FREDERICO ANTONIAZZI - 06/06/2024(dd/mm/aaaa)
%
%

%% MAIN FUNCTION CODE:

function [y, t] = impulseresponse(num, den, t0, dt, tfinal)

% FIND A PARTIAL FRACTION EXPANSION OF num/den
[r, p, k] = residue(num, den);

% K IS JUST CONSIDERED WHEN THE ORDER OF THE NUMERATOR IS EQUAL TO THE
% ORDER OF THE DENOMINATOR

% CALCULATE THE TIME POINTS FOR IMPULSE RESPONSE
t = t0:dt:tfinal;

% FIND THE MULTIPLICITY OF EACH POLE
for j = 1:size(p)

    n = 1;

    for i = 1:size(p)

        if p(j) == p(i)

            if i ~= j

                n = n + 1;

            end
        end
    end

    mult(:, j) = n;

end

% CALCULATE THE IMPULSE RESPONSE BY INVERSE LAPLACE TRANSFORM
y = zeros(size(t));

j = 1;
while j <= size(p, 1)

    for i = 1:mult(:, j)
        y = y + r(j + i - 1)*((t - t0).^(i - 1)).*exp(p(j)*(t - t0))/factorial(i - 1);
    end
    j = j + 1;
end
