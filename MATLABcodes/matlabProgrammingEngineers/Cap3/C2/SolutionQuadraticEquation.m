%%  FREDERICO CASARA ANTONIAZZI
%   CODE IMPLEMENTED FOR SOLVING THE QUADRATIC EQUATION
%   FOURTH CODE IN PROGRAMMING WITH MATLAB OF CHAPMAN SECOND EDITION

%% INITIAL DEFINITIONS:

clear
close all
clc

format short

%% PURPOSE OF THE CODE:

% THIS PROGRAM SOLVES THE ROOTS OF A QUADRATIC EQUATION OF THE FORM 
% a*x**2 + b*x + c = 0. IT CALCULATES THE ANSWERS REGARDLESS OF THE TYPE OF
% ROOTS THAT THE EQUATION POSSESSES.

% VARIABLES:
%   a            -> COEFFICIENT OF X² TERM OF EQUATION
%   b            -> COEFFICIENT OF X¹ TERM OF EQUATION
%   c            -> COENSTANT TERM OF EQUATION
%   discriminant -> DISCRIMINANT OF THE EQUATION
%   imag_part    -> IMAG PART OF EQUATION (FOR COMPLEX ROOTS)
%   real_part    -> REAL PART OF EQUATION (FOR COMPLEX ROOTS)
%   x1           -> FIRST SOLUTION OF EQUATION (FOR REAL ROOTS)
%   x2           -> SECOND SOLUTION OF EQUATION (FOR REAL ROOTS)

%% MAIN CODE:

disp('THIS PROGRAM SOLVES FOR THE ROOTS OF A QUADRATIC EQUATION OF THE FORM:');
disp('a*x² + b*x + c = 0');

% ASKING FOR THE COEFFICIENTS:
a = input('ENTER THE COEFFICIENT A: ');
b = input('ENTER THE COEFFICIENT B: ');
c = input('ENTER THE COEFFICIENT C: ');

% CALCULATING THE DISCRIMINANT:
discriminant = b^2 - 4*a*c;

% SOLVING FOR THE ROOTS:
if discriminant > 0 % ALWAYS WILL BE TWO REAL ROOTS:

    x1 = ((- b + sqrt(discriminant))/(2*a));
    x2 = ((- b - sqrt(discriminant))/(2*a));
    disp('THIS EQUATION HAS TWO REAL ROOTS DIFERENTS:');
    fprintf('X_1 = %f \n', x1);
    fprintf('X_2 = %f \n', x2);

    elseif discriminant == 0 % ALWAYS WILL BE ONE REAL ROOTS:

        x1 = ((- b)/(2*a));
        disp('THIS EQUATION HAS REAL ROOTS EQUALS:');
        fprintf('X_{1,2} = %f \n', x1);

else % IMAGINARY ROOTS

    real_part = ((- b)/(2*a));
    imag_part = (sqrt(abs(discriminant))/(2*a));
    disp('THIS EQUATION HAS TWO COMPLEX ROOTS:');
    fprintf('X_1 = %f +i%f \n', real_part, imag_part);
    fprintf('X_2 = %f -i%f \n', real_part, imag_part);

end

pause(10)
clc
