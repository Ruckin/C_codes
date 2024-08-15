%% CODE LEVEL 1 S-FUNCTION INVETTED PENDULUM SIMULATION IN SIMULINK:

function [sys, x0, str, ts] = pendulum_sfunction(t, x, u, flag, x10, x20)

% DEFINITION OF THE OPERATION OF THE S-FUNCTION BLOCK:
switch flag

    % CREATION OF THE BLOCK AND ITS PROPERTIES: SETUP
    case 0

        str = [];
        ts = [0 0];
        
        s = simsizes;
                s.NumContStates = 2;
                s.NumDiscStates = 0;
                s.NumOutputs = 1;
                s.NumInputs = 1;
                s.DirFeedthrough = 0;
                s.NumSampleTimes = 1;
        sys = simsizes(s);
        x0 = [x10 x20]';

    % SIMULATION OF THE CONTINUOUS SYSTEM: DERIVATIVES
    case 1

        sys = pendulum(t, x, u);

    % ITS THE OUTPUT OF THE SYSTEM: OUTPUTS
    case 3

        sys = x(1);

    % OTHER TYPES OF CONDITIONS AND SIMULATIONS:
    case {2 4 9}

        % 2 -> UPDATE
        % 4 -> OUTPUTS UPTADE NEXTTIMEHIT
        % 9 -> TERMINATE

        sys = [];

    % ERROR HANDLER:
    otherwise

        error(['unhandled flag = ', num2str(flag)]);

end
