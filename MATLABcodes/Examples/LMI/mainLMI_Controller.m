%% ELE216 - MULTIVARIABLE CONTROL:
%  FREDERICO 25/11/2024
%  CODE FOR CALCULATING THE H2 AND Hoo CONTROLLERS USING LMI'S.

%% CLEANING AND STARTING:

clc;
clear;
close all;

format short;

%% INPUT OF USER:

while(true)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF MENU CONSTRUCTION:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    disp('1 - Hoo Controler');
    disp('2 - H2 Controller');
    typeController = input('Enters the Controller type:');
    A = input('Enters the A matrix of the system:');
    B = input('Enters the B matrix of the system:');
    C = input('Enters the C matrix of the system:');
    clc;

    if typeController == 1

        disp('The Hoo Controller project method was selected.');
        D = input('Enters the D matrix of the system:');
        gamma = input('Please enters the max value for the Hoo norm of the system:');
        clc;

        Controller = HooControlProject(A, B, C, D, gamma);

    elseif typeController == 2

        disp('The H2 Controller project method was selected.');
        Controller = H2ControlProject(A, B, C, D);

        if Controller == -1
            disp('Its not possible to find a Controller that satisfies the constrains.');
        else
            disp('The project was succecefull.');
        end

        if Controller == -1
            disp('Its not possible to find a Controller that satisfies the constrains.');
        else
            disp('The project was succecefull.');
        end
    end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END OF MENU CONSTRUCTION:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% START OF PLOTTING THE RESULT:
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

plottingFSFB(Controller);

end
