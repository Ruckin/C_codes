%
% FREDERICO ANTONIAZZI - 07/06/2024(dd/mm/aaaa)
% CODE FOR IMPLEMENTATION OF TIME-MARCHING OF LINEAR TIME-VARIANT 
% STATE-SPACE SYSTEM
% THIS IS JUST AN EXAMPLE FOR APLICATTION
%

function [A, B, C, D] = timv(t)

A = [-.1*sin(t) 0; 0 -.7*cos(t)];
B = [.2*sin(t); 0];
C = [1 -1];
D = -.05*cos(t);
