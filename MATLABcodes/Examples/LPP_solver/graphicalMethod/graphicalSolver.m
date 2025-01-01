clc;
clear;
close all;

format short;

%% INPUTS:

cost_coefficients = [3 5];         % COEFFICIENTS OF THE COST FUNCTION
A_coefficients = [1 2; 1 1; 0 1];  % COEFFICIENTS FOR THE CONSTRAINS IN EACH STATE
b_coefficients = [2000 1500 600]'; % INEQUALITY VALUE

%% CALCULATING THE CURVES:
t = 0:1:max(b_coefficients);

% PARAMETRIC EQUATIONS FOR THE CONSTRAINS:
constrain_1 = (b_coefficients(1, 1) - A_coefficients(1, 1).*t)./A_coefficients(1, 2);
constrain_2 = (b_coefficients(2, 1) - A_coefficients(2, 1).*t)./A_coefficients(2, 2);
constrain_3 = (b_coefficients(3, 1) - A_coefficients(3, 1).*t)./A_coefficients(3, 2);

%% PLOTTING THE GRAPH:

% CONSTRAIN FOR POSITIVO SOLUTIONS ONLY:
constrain_1 = max(0, constrain_1);
constrain_2 = max(0, constrain_2);
constrain_3 = max(0, constrain_3);

plot(t, constrain_1, 'r', t, constrain_2, 'k', t, constrain_3, 'b');
grid on;
xlabel('x_{1}');
ylabel('x_{2}');
title('Graphical LPP Solver');

%% FINDING THE EDGES OF THE GRAPH:

cx1 = find(t == 0); % EDGES IN X1 AXIS

% EDGES IN X2 AXIS
c1 = find(constrain_1 == 0);
c2 = find(constrain_2 == 0);
c3 = find(constrain_3 == 0);

Line1 = [t(:, [c1 cx1]); constrain_1(:, [c1 cx1])]';
Line2 = [t(:, [c2 cx1]); constrain_2(:, [c2 cx1])]';
Line3 = [t(:, [c3 cx1]); constrain_3(:, [c3 cx1])]';

points = unique([Line1; Line2; Line3], 'rows');

%% FINDING THE INTERSECTIONS BETWEEN THE CONSTRAINS:

count = 2;
intersections = zeros(size(A_coefficients, 1) + 1, size(cost_coefficients, 2));

for i = 1:size(A_coefficients, 1)

    hg1 = A_coefficients(i, :);
    b1 = b_coefficients(i, :);

    for j  = i + 1:size(A_coefficients, 1)

        hg2 = A_coefficients(j, :);
        b2 = b_coefficients(j, :);
        
        HG = [hg1; hg2];
        B = [b1; b2];

        intersections(count, :) = (HG\B)';
        count = count + 1;

    end
end

vertices = [intersections; points];
vertices = unique(vertices, 'rows');

%% FINDING THE FEASIBLE REGION:

feasibleVertices = constrains(vertices);
feasibleVertices = unique(feasibleVertices, 'rows');

%% COMPUTING THE OBJECTIVE FUNCTION:

Fx = zeros();

for i = 1:size(feasibleVertices, 1)

    Fx(i, :) = sum(feasibleVertices(i, :).*cost_coefficients);

end

Vert_FNS = [feasibleVertices Fx];

[maxValue, maxIndex] = max(Fx);

%% VERIFICATION:

hold on;
plot(feasibleVertices(maxIndex, 1), feasibleVertices(maxIndex, 2), 'ro', 'LineWidth', 2);
hold off;
legend('x_{1} + 2x_{2} < 2000', 'x_{1} + x_{2} < 1500', 'x_{2} < 600', 'Optimal Solution');

% SAVING IN A TABLE:
optimalTable = array2table([feasibleVertices(maxIndex, :) maxValue]);
optimalTable.Properties.VariableNames(1:size(Vert_FNS, 2)) = {'x_{1}', 'x_{2}', 'Solution'};
disp('THE OPTIMAL SOLUTION IS:');
disp(optimalTable);
