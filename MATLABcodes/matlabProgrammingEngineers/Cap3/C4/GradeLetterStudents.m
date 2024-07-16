%%  FREDERICO CASARA ANTONIAZZI
%   CODE IMPLEMENTED FOR USING LETTERS FOR GRADE STUDENTS
%   SIXTH CODE IN PROGRAMMING WITH MATLAB OF CHAPMAN SECOND EDITION

%% INITIAL DEFINITIONS:

clear
close all
clc

format short

%% PURPOSE OF THE CODE:

% THIS PROGRAM ATRIBUTTE A LETTER WITH RESPECT THE GRADE THE STUDENT
% RECIVED IN THE TEST

% VARIABLES:
%   GRADE  -> GRADE OF THE STUDENT
%   LETTER -> RESULTING LETTER FOR THE GRADE OF THE STUDENT

%% MAIN CODE FOR SOLUTION 1:

% ASKING FOR THE COEFFICIENTS:
grade = input('ENTER THE GRADE OF THE STUDENT: ');
clc

disp('FIRST SOLUTION!');

% CALCULATING THE FUNCTION USING THE SIGNS OF x AND y:
if grade > 95 % FIRST CONDITION:

    letter = 'A';

elseif grade > 86 % SECOND CONDITION:

        letter = 'B';

elseif grade > 76 % TRHID CONDITION:

    letter = 'C';

elseif grade > 66 % FOURTH CONDITION:

    letter = 'D';

else

    letter = 'F';

end

% WRITTNG THE ANSWER TO THE USER:
disp(['THE LETTER CORRESPONDING IS: ', letter]);

%% MAIN CODE FOR SOLUTION 2:

disp('SECOND SOLUTION!');

% CALCULATING THE FUNCTION USING THE SIGNS OF x AND y:
if grade > 95 % FIRST CONDITION:

    letter = 'A';

else
    if grade > 86 % SECOND CONDITION:

        letter = 'B';

    else
        if grade > 76 % TRHID CONDITION:

            letter = 'C';

        else
            if grade > 66 % FOURTH CONDITION:

                letter = 'D';

            else

                letter = 'F';

            end
        end
    end
end

% WRITTNG THE ANSWER TO THE USER:
disp(['THE LETTER CORRESPONDING IS: ', letter]);

pause(5)
clc
