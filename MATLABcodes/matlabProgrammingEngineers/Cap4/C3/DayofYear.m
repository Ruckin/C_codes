%% FREDERICO CASARA ANTONIAZZI
%  CODE FOR CALCULATING THE DAY OF THE YEAR
%  ELEVENTH CODE IN PROGRAMMING WITH MATLAB OF CHAPMAN SECOND EDITION

%% INITIAL DEFINITIONS:

clear
close all
clc

format short
 
%% PURPOSE OF THE CODE:

% THIS PROGRAM CALCULATES THE DAY OF THE YEAR CORRESPONDING TO A SPECIFIED
% DATE

% VARIABLES:
% day         -> DAY (dd)
% day_of_year -> DAY OF THE YEAR SPECIFIED
% i           -> LOOP INDEX
% leap_day    -> DAY FOR LEAP YEAR
% month       -> MONTH (mm)
% year        -> YEAR (yyyy)

%% MAIN CODE:

month = input('ENTER THE CURRENT MONTH(1 - 12): ');
day   = input('ENTER THE CURRENT DAY(1 - 31): ');
year  = input('ENTER THE CURRENT year(yyyy): ');

if mod(year, 400) == 0

    leap_day = 1;

elseif mod(year, 100) == 0

    leap_day = 0;

elseif mod(year, 4) == 0

    leap_day = 1;

else

    leap_day = 0;

end

day_of_year = day;

for i = 1:month-1

    switch (i)
        case {1, 3, 5, 7, 8, 10, 12}
            day_of_year = day_of_year + 31;
        case {4, 6, 9, 11}
            day_of_year = day_of_year + 30;
        case 2
            day_of_year = day_of_year + 28 + leap_day;
    end
end

fprintf('THE DATE %2d/%2d/%4d IS DAY OF YEAR %4d.\n', month, day, year, day_of_year);
