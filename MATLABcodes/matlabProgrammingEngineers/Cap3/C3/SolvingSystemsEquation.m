%%  FREDERICO CASARA ANTONIAZZI
%   CODE IMPLEMENTED FOR SOLVING f(x, y) FOR A x AND y SPECIFIED BY THE USER
%   FIFTH CODE IN PROGRAMMING WITH MATLAB OF CHAPMAN SECOND EDITION

%% INITIAL DEFINITIONS:

clear
close all
clc

format short

%% PURPOSE OF THE CODE:

% THIS PROGRAM SOLVES THE FUNCTION f(x, y) FOR A USER-SPECIFIED x, AND y
% WHERE f(x, y) IS DEFINED AS:

%             ----                       ----
%   f(x, y) = | x + y   , X >= 0 AND y >= 0 |  
%             | x + y²  , X >= 0 AND y <  0 |
%             | x² + y  , X <  0 AND y >= 0 |
%             | x² + y² , X <  0 AND y <  0 |
%             ----                       ----

% VARIABLES:
%   x   -> FIRST INDEPENDENT VARIABLE
%   y   -> SECOND INDEPENDENT VARIABLE
%   fun -> RESULTING FUNCTION

%% MAIN CODE:

% ASKING FOR THE COEFFICIENTS:
x = input('ENTER THE COEFFICIENT X: ');
y = input('ENTER THE COEFFICIENT Y: ');

% CALCULATING THE FUNCTION USING THE SIGNS OF x AND y:
if x >= 0 && y >= 0 % FIRST CONDITION:

    fun = x + y;

elseif x >= 0 && y < 0 % SECOND CONDITION:

        fun = x + y^2;

elseif x < 0 && y >= 0 % TRHID CONDITION:

    fun = x^2 + y;

else

    fun = x^2 + y^2;

end

% WRITTNG THE ANSWER TO THE USER:
disp(['THE VALUE OF THE FUNCTION IS: ', num2str(fun)]);

pause(5)
clc
