function feasibleVertices = constrains(points)

x1 = points(:, 1);
x2 = points(:, 2);

% FIRST COINSTRAIN:
const1 = x1 + 2*x2 - 2000;
H1 = const1 > 0;
points(H1, :) = const1;

x1 = points(:, 1);
x2 = points(:, 1);

% SECOND COINSTRAIN:
const2 = x1 + x2 - 1500;
H2 = const2 > 0;
points(H2, :) = const2;

x2 = points(:, 1);

% THRID COINSTRAIN:
const3 = x2 - 600;
H3 = const3 > 0;
points(H3, :) = const3;

feasibleVertices = points;

end