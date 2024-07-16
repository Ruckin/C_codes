%% FREDERICO CASARA ANTONIAZZI
%  CODE FOR PLOT A LOW-PASS FILTER
%  EIGTH CODE IN PROGRAMMING WITH MATLAB OF CHAPMAN SECOND EDITION

%% INITIAL DEFINITIONS:

clear
close all
clc

format short

%% PURPOSE OF THE CODE:

% THIS PROGRAM PLOTS THE FREQUENCY RESPONSE OF A LOW-PASS FILTER.

% VARIABLES:
%   amp   -> AMPLITUDE RESPONSE
%   C     -> CAPACITANCE (F)
%   f     -> ANGLE FROM MICROPHONE AXIS (rad)
%   phase -> PHASE RESPONSE
%   R     -> RESISTANCE (\Omega)
%   res   -> Vo / Vi

%% MAIN CODE:

C = 1e-6; % 1 uF
R = 16e3; % 16 komhs

f = 1:2:1000; % ARRAY OF INPUT FREQUENCIES

% CALCULATIONG THE RESPONSE OF THE FILTER:
res = 1./(1 + 1i*2*pi*f*R*C);

% CALCULATING THE AMPLITUDE RESPONSE:
amp = abs(res);

% CALCULATING THE PHASE RESPONSE:
phase = angle(res);

% PLOTTING THE RESULT:
subplot(2, 1, 1);
loglog(f, amp);
title('AMPLITUDE RESPONSE');
xlabel('FREQUENCY (Hz)');
ylabel('OUTPUT/INPUT RATIO');
grid on;

subplot(2, 1, 2);
semilogx(f, phase);
title('PHASE RESPONSE');
xlabel('FREQUENCY (Hz)');
ylabel('OUTPUT-INPUT PHASE (rad)');
ylim([-2.2 0.1])
grid on;
