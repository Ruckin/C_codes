%
% FREDERICO ANTONIAZZI - 07/06/2024(dd/mm/aaaa)
% CODE FOR IMPLEMENTATION OF A LINEAR MODEL TIME-VARIANT FOR A MISSILE
%

function [A, B, C, D] = missileTimeVarying(t)

% THRUST AS A FUNCTION OF TIME:
if t <= 20

    Th = 1.2717*e^005;

else

    Th = 0;

end

% INERTIA PROPERTIES:
m = 983.6716 - 29.4208*t - .5812*t^2 + .0338*t^3;
iy = 1000*(2.5475 - .0942*t + .0022*t^2);
ix = iy/10;
xcg = 3.6356 - .0217*t - .0008*t^2;

% AERODYNAMIC AND PROPULSIVE PROPERTIES AS FUNCTIONS OF TIME:
Zw = -(246.44 + 21.9038*t - 1.5996*t^2 + .0244*t^3);
Mw = -(872.95 - 52.7448*t -.0006*t^2 + .0368*t^3);
Mq = -(3 + 1.39*t - .08*t^2)/10;
Lr = .0134 + .0029*t - .0001*t^2;
Lp = - .0672 - .0143*t + .0006*t^3;
Lv = - .1159 - .0317*t + .0015*t^2;
Zu = - 9.5383 - 2.592*t + .1209*t^2 - .0011*t^3;
Xw = 1.9067 + .5186*t - .0242*t^2 + .0002*t^3;
Md = 1e5*(1.3425 - 2.3946*t + .1278*t^2 - .0017*t^3);
Zd = -1e4*(2.0143 + 3.6649*t - .1854*t^2 + .0023*t^3);
Yv = Zw;
Nv = Mw;
Nr = Mq;
Np = Lp/10;
Xu = Th/400 + Zu/10;
ci = (iy - ix)/iy;

% STATE COEFFICIENT MATRICES:
A = [Xu/m 0 Xw/m 0 0 0; ...
     0 Yv/m 0 0 0 0; ...
     Zu/m 0 Zw/m 0 0 0; ...
     0 Lv/ix 0 Lp/ix 0 Lr/ix; ...
     0 0 Mw/iy 0 Mq/iy 0 ; ...
     0 Nv/iy 0 Np/iy 0 Nr/iy];
B = [0 0 0; Th/m 0 0; 0 Th/m 0; 0 0 1; 0 Th*xcg/iy 0; Th*xcg/iy 0 0];
C = eye(max(size(A)));
D = zeros(min(size(C)), min(size(B)));
