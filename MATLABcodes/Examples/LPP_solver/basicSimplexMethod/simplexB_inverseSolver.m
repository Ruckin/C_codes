%% SIMPLEX CALCULATION USING B^(-1) FORMULATION:

%% INITIALIZATION:

clc;
clear;
close all;

format short;

%% INPUTS:

cost_coefficients = [-1 3 -2];
A_coefficients = [3 -1 2; -2 4 0; -4 3 8];
b_coefficients = [7 12 10]';

%% GENERAL DEFINITIONS:

numberConstrains = size(A_coefficients, 1);
numberVariables = size(cost_coefficients, 2);

S = eye(size(A_coefficients, 1));

% MATRIX OF THE SYSTEM:
A = [A_coefficients S b_coefficients];

% COST OF THE SYSTEM:
Cost = [cost_coefficients zeros(1, numberConstrains + 1)];

%% FINDING START BV:

BV = [zeros(1,size(S, 2))];

for i = 1:size(S, 2)
    for j = 1:size(A, 2)
        if A(:, j) == S(:, i)

            BV(1, i) = j;

        end
    end
end

%% COMPUTE VALUE TABLE:

B = A(:, BV);

A = B\A;

zjcj = Cost(BV)*A - Cost;

%% ITERATION:

ratio = zeros(size(A_coefficients, 1), 1);
RUN = true;
while RUN
    if any(zjcj(:, 1:end-1) < 0)

        disp('Optimal Solution not found!');

        % FINDINF THE PIVOT COLUMN:
        [minValue, pvt_column] = min(zjcj(:, 1:end-1));

        % FINDING THE RATIO:
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

            % UPDATING THE BV:
            BV(pvt_row) = pvt_column;

            % UPDATE THE TABLE:
            B = A(:, BV);

            A = B\A;

            zjcj = Cost(BV)*A - Cost;

            BFS = zeros(1, size(A, 2));
            BFS(BV) = A(:, end);
            BFS(end) = sum(BFS.*Cost);

            % DISPLAYING THE NONE OPTIMAL SOLUTION:
            disp(BFS);
            disp(zjcj);

    else

        disp('Optimal Solution Found!');
        % DISPLAYING THE OPTIMAL SOLUTION:
        disp(BFS);
        disp(zjcj)
        RUN = false;

    end
end
