clc;
clear;
close all;

format short;

%% INPUTS:

cost_coefficients = [-1 3 -2];
A_coefficients = [3 -1 2; -2 4 0; -4 3 8];
b_coefficients = [7 12 10]';

%% GENERAL INFORMATION:

S = eye(size(A_coefficients, 1));          % HOW MANY DUMMY VARIABLES NEEDED
numVariables = size(cost_coefficients, 2); % NUMBER OF VARIABLES IN THE PROBLEM

%% BUILDING THE DEFAULT MATRIX:

A = [A_coefficients S b_coefficients];
Cost = [cost_coefficients zeros(1, size(A, 2) - size(cost_coefficients, 2))];

% THE DUMMY VARIABLES:
BV = numVariables + 1:size(A, 2) - 1;

%% CALCULATING THE Sj - Cj:

zjcj = Cost(BV)*A - Cost;

%% SIMPLEX METHOD CALCULATION:

ratio = zeros(size(A_coefficients, 1), 1);

RUN = true;
while RUN % WHILE LOOP FOR ITERATION IN THE SIMPLEX CALCULATION

    if any(zjcj < 0) % CHECKING IF THE SOLUTION SATISFIES ALL THE RESTRICTIONS
        disp('Optimal solution not found.');

        % FINDING THE NEW PIVOT COLUMN:
        [minValue, pvt_column] = min(zjcj(1:end - 1));

        % FINDING THE LEAVING VARIABLE:
        if all(A(:, pvt_column) < 0)

            % TEST FOR WHEN ALL THE VALUES ARE LESS THEN ZERO IN THE COLUMN
            disp('LPP is unbounded.');

        else

            for i = 1:size(A(:, pvt_column), 1)
                if A(i, pvt_column) > 0

                    ratio(i, :) = A(i, end)./A(i, pvt_column);

                else

                    ratio(i, :) = Inf;

                end
            end

            % FINDING THE NEW MINIMAL RATIO(PIVOT ROW):
            [minRatio, pvt_row] = min(ratio);

        end

        % FINDING THE NEW PIVOT KEY(VALUE):
        pvt_key = A(pvt_row, pvt_column);

        % UPDATING THE MATRIX:
        A(pvt_row, :) = A(pvt_row, :)./pvt_key;
        for i = 1:size(A, 1)
            if i ~= pvt_row

                A(i, :) = A(i, :) - A(i, pvt_column).*A(pvt_row, :);

            end

            % UPDATING THE Zj - Cj:
            zjcj = zjcj - zjcj(pvt_column).*A(pvt_row, :);

        end

        BFS = zeros(1, size(A, 2));
        BFS(BV) = A(:, end);
        BFS(end) = sum(BFS.*Cost);
        disp(zjcj);

    else

        disp('Optimal solution found.');
        disp(zjcj);
        RUN = false;

    end
end
