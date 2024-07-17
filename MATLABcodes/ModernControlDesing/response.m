%
% CODE FOR IMPLEMENTATION OF A FUNCTION FOR CALCULATING THE TIME RESPONSE
% OF A LINEAR TIME-INVARIANT DYNAMICAL SYSTEM TO A FINETE INPUT.
%
% FREDERICO ANTONIAZZI - 06/06/2024(dd/mm/aaaa)
%
%

%% MAIN FUNCTION CODE:

function y = response(num, den, t, u)

% STEP TIME FOR THE SIMULATION
dt = t(2) - t(1);

% SIZE OF THE TIME VECTOR
m = size(t, 2);

tfinal = t(m);

% CALCULATING THE CONVUUTION INTEGRAL:
y = zeros(size(t));
G = y;

% USING THE IMPULSE RESPONSE OF THE SYSTEM:
[g, T] = impulseresponse(num, den, t(1), dt, tfinal);

for i = 1:m

    y = y + dt*u(i)*[G(1:i - 1) g(1:m - i + 1)];

end
