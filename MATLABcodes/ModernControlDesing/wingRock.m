%
% FREDERICO ANTONIAZZI - 07/06/2024(dd/mm/aaaa)
% CODE FOR IMPLEMENTATION OF NONLINEAR STATE EQUATIONS FOR THE WING-ROCK
% PHENOMENON WITH A FIRST ORDER AILERON
%

function xdot = wingRock(~, x)

a = [-.05686 .03254 .0734 -.3597 1.4681];
constant = .354;

% ROLLING 
w = -constant*a(1);

% AILERON ACTUATOR TIME CONSTANT:
k = 1/.0495;

% LINEAR AERODYNAMIC COEFFICIENTS:
lbet = -.02822;
lr = .1517;
np = -.0629;
nbet = 1.3214;
nr = -.2491;
ldelt = 1;

% NONLINEAR INERTIAL AND AERODYNAMIC COEFFICIENTS:
u(1) = constant*a(2) - .001;
u(2) = constant*a(4);
b(1) = constant*a(3);
b(2) = constant*a(5);

% DESIRED AILERON DEFLECTION AS THE INPUT:
f = 0;

% NONLINEAR STATE EQUATIONS:
xdot(1, 1) = x(2);
xdot(2, 1) = -w*x(1) + u(1)*x(2) + b(1)*x(2)^3 + u(2)*x(2)*x(1)^2 + ...
              b(2)*x(1)*x(2)^2 + ldelt*x(3) + lbet*x(4) - lr*x(5);
xdot(3, 1) = -k*x(3) + k*f;
xdot(4, 1) = x(5);
xdot(5, 1) = -nbet*x(4) + nr*x(5) - np*x(2);

