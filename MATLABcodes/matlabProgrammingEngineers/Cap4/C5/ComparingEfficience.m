%% FREDERICO CASARA ANTONIAZZI
%  CODE FOR CALCULATE THE TIME FOR CALCULATE THE SQUARES OF ALL INTEGERS
%  FROM 1 TO 10000
%  ELEVENTH CODE IN PROGRAMMING WITH MATLAB OF CHAPMAN SECOND EDITION

%% INITIAL DEFINITIONS:

clear
close all
clc

format short
 
%% PURPOSE OF THE CODE:

%  THIS PROGRAM HAS THE PORPUSE OF CALCULATE THE TIME FOR CALCULATE THE 
%  SQUARES OF ALL INTEGERS FROM 1 TO 10000

% VARIABLES:
% i j      -> LOOP INDEX 
% Time1    -> AVERAGE TIME IN THE FIRST METHOD
% Time2    -> AVERAGE TIME IN THE SECOND METHOD
% Time3    -> AVERAGE TIME IN THE FIRST METHOD
% Time4    -> AVERAGE TIME IN THE FIRST METHOD
% maxCount -> NUMBER OF TIMES TO LOOP CALCULATION
% square   -> ARRAY OF SQUARES

%% MAIN CODE:

% INITIAL VALUE OF INTEGERS:
integersArray = input('HOW MUCH INTEGERS WANT TO CALCULATE THE SQUARE: ');

% FIRST METHOD:

maxcount = 1;

tic;

for j = 1:maxcount

    clear square

    for i = 1:integersArray

        square(i) = i^2; % WITHOUT THE PRE-INITIALIZATION

    end
end

Time1 = (toc)/maxcount;

% SECOND METHOD:

% maxcount = 10;
% 
% tic;
% 
% for j = 1:maxcount
% 
%     clear square
%     square = zeros(1, integersArray); % PRE-INITIALIZE ARRAY
% 
%     for i = 1:integersArray
% 
%         square(i) = sqr(i);
% 
%     end
% end
% 
% Time2 = (toc)/maxcount;

% THRID METHOD:

maxcount = 100;

tic;

for j = 1:maxcount

    clear square
    square = zeros(1, integersArray); % PRE-INITIALIZE ARRAY

    for i = 1:integersArray

        square(i) = i^2;

    end
end

Time3 = (toc)/maxcount;

% FOURTH METHOD:

maxcount = 1000;

tic;

for j = 1:maxcount

    clear square

    i = 1:integersArray;

    square = i.^2;

end

Time4 = (toc)/maxcount;

%% DISPLAYING THE RESULTS:

fprintf('FIRST METHOD: %8.4f\n', Time1);  % UNITIALIZED ARRAY
% fprintf('SECOND METHOD: %8.4f\n', Time2); % INITIALIZED ARRAU noJIT
disp('THE SECOND METHOD NO MORE CAN BE DONE!')
fprintf('THRID METHOD: %8.4f\n', Time3);  % INITIALIZED ARRAY JIT
fprintf('FOURTH METHOD: %8.4f\n', Time4); % VETORIZED METHOD
