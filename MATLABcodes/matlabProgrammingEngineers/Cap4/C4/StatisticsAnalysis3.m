%% FREDERICO CASARA ANTONIAZZI
%  CODE FOR STATISTICAL ANALYSIS
%  ELEVENTH CODE IN PROGRAMMING WITH MATLAB OF CHAPMAN SECOND EDITION

%% INITIAL DEFINITIONS:

clear
close all
clc

format short
 
%% PURPOSE OF THE CODE:

% THIS PROGRAM CALCULATES MEAN AND THE STANDART DEVIATION OF AN INPUT DATA
% SET WHERE EACH INPUT CAN BE A VALUE POSITIVE, NEGATIVE OR ZERO

% VARIABLES:
% i       -> LOOP INDEX
% n       -> THE NUMBER OF INPUT SAMPLES
% std_dev -> STANDART DEVIATION VARIABLE
% sem_x   -> SUM OF THE INPUT VALUES
% sum_x2  -> SUM OF THE SQUARES OF INPUT VALUES
% x       -> A INPUT DATA VALUE
% x_bar   -> THE AVERAGE OF THE INPUT SAMPLES

%% MAIN CODE:

sum_x = 0;
sum_x2 = 0;

n = input('ENTER THE NUMBER OF SAMPLES: ');

if n < 2

    disp('AT LEAST 2 VALUES MUST BE ENTERED!'); % CHECKING FOR INSUFFICIENT DATA

else
    for i = 1:n

        x = input('ENTER THE VALUES: ');

        sum_x = sum_x + x;    % ADDING ALL THE VALUES OF EACH SAMPLE TOGETHER
        sum_x2 = sum_x + x^2; % ADDING ALL THE SQUARES OF EACH SAMPLE TOGETHER

    end

    x_bar = sum_x/n;                                  % CALCULATING THE MEAN
    std_dev = sqrt((n*sum_x2 - sum_x^2)/(n*(n - 1))); % CALCULATING THE STANDART DEVIATION

    fprintf('THE NUMBER OF SAMPLES ENTERED WAS: %f\n', n);
    fprintf('THE MEAN OF THE DATA ENTERED WAS: %f\n', x_bar);
    fprintf('THE STANDART DEVIATION OF THE DATA ENTERED WAS: %f\n', std_dev);

end



