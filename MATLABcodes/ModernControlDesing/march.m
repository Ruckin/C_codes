%
% TIME MARCHING SOLUTION OF LINEAR, TIME-INVARIANT STATE-SPACE EQUATIONS
% USING THE DIGITAL APPROXIMATION
%
% FREDERICO ANTONIAZZI - 06/06/2024(dd/mm/aaaa)
%
%

%% MAIN FUNCTION CODE:

function [y, X] = march(A, B, C, D, x0, t, u, method)

n = size(t, 2);
dt = t(2) - t(1);

[ad, bd, ~, ~] = c2dm(A, B, C, D, dt, method);

X = ltitr(ad, bd, u, x0);

y = X*C' + u*D';
