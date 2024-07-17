%
% FREDERICO ANTONIAZZI - 08/06/2024
% CODE FOR SOLVING THE MATRIX FORM OF THE RICATTI EQUATION.
% GIVING THE RESULT IN THE FORM OF TERMINAL-TIME WEIGHTED OPTIMAL CONTROL
% FOR LINEAR, TIME-INVARIANT SYSTEMS.
%

function M = matricc(A, B, Q, R, V, t, tfinal)

% HAMILTONIAN MATRIX
H = [A - B\R*B'; -Q -A'];

n = size(A, 1);

FE = expm2(H*(t - tfinal))*[eye(n); V];

F = FE(1:n, :);
E = FE(n + 1:2*n, :);

M = E\F;