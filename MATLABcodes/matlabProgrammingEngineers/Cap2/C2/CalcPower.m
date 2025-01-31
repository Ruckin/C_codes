%%  FREDERICO CASARA ANTONIAZZI
%   CODE IMPLEMENTED FOR CALCULATING THE POWER OF A RESISTANCE LOAD
%   SECOND CODE IN PROGRAMMING WITH MATLAB OF CHAPMAN SECOND EDITION

%% INITIAL DEFINITIONS:

clear
close all
clc

format short

%% PURPOSE OF THE CODE:

% TO CALCULETE AND PLOT THE POWER SUPPLIED TO A LOAD AS A FUNCTION OF THE
% LOAD RESISTANCE

% VARIABLES:
%   amps  -> CURRENT FLOW TO LOAD (A)
%   pl    -> POWER SUPPLIED TO LOAD (W)
%   rl    -> LOAD RESISTANCE (omega)
%   rs    -> INTERNAL RESISTANCE OS THE POWER SOURCE (omega)
%   volts -> VOLTAGE OF THE POWER SOURCE (V)

%% MAIN CODE:

% DECLARING THE VARIABLES:
volts = 120; % VOLTAGE OF THE SOURCE
rs = 50;     % INTERNAL RESISTANCE OF THE SOURCE

rl = 1:1:100; % ARRAY OF VALUES FOR THE RESISTANCE LOAD

% CALCULATING THE CURRENT FOR EACH RESISTANCE:

amps = volts./(rs + rl);

% CALCULATING THE POWER SUPPLIED TO THE LOAD:

pl = (amps.^2).*rl;

% PLOTTING THE RESULTS:

plot(rl, pl);
title('PLOT OF POWER VERSUS LOAD RESISTANCE');
xlabel('LEAD RESISTANCE ($\Omega$)', 'interpreter','latex')
ylabel('POWER (W)');
grid on;
