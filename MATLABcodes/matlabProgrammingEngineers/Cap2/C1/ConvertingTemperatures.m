%%  FREDERICO CASARA ANTONIAZZI
%   CODE IMPLEMENTED FOR TEMPERATURE CONVERTION
%   FIRST CODE IN PROGRAMMING WITH MATLAB OF CHAPMAN SECOND EDITION

%% INITIAL DEFINITIONS:

clear
close all
clc

format short

%% PURPOSE OF THE CODE:

% TO CONVERT AN INPUT TEMPERATURE FROM DEGREES FAHRENHEIT TO AN OUTPUT
% TEMPEARTURE IN KELVIN.
% VARIABLES:
%   temp_F -> TEMPERATURE IN DEGREES FAHRENHEIT
%   temp_K -> TEMPERATURE IN KELVIN

%% MAIN CODE:

% ASKING FOR THE INPUT TEMPERATURE:
temp_F = input('ENTER THE TEMPERATURE IN DEGREES FAHRENHEIT: ');

% CONVERTING THE INPUT TEMPERATURE TO KELVIN:
temp_K = (5/9)*(temp_F - 32) + 273.15;

% PROMPTING THE RESULT:
fprintf('%6.2f ºF = %6.2f K\n', temp_F, temp_K);
