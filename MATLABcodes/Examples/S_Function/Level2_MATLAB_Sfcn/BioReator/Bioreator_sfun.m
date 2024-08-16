%% FREDERICO CASARA ANTONIAZZI - 06/03/2024
%  CODIGO PARA A IMPLEMENTACAO DE S-FUNCTION LEVEL 2 PARA A SIMULACAO DE UM
%  BIOREATRO COM DOIS ESTADOS, BASEADO EM VIDEO AULA DE TURIX DYNAMICS.

function Bioreator_sfun(block)

setup(block);

%endfunction

function setup(block)

% Register number of ports
block.NumInputPorts  = 1;
block.NumOutputPorts = 1;

% Setup port properties to be inherited or dynamic
block.SetPreCompInpPortInfoToDynamic;
block.SetPreCompOutPortInfoToDynamic;

% Override input port properties
block.InputPort(1).Dimensions        = 2;
block.InputPort(1).DatatypeID        = 0;  % double
block.InputPort(1).Complexity        = 'Real';
block.InputPort(1).DirectFeedthrough = true;

% Override output port properties
block.OutputPort(1).Dimensions  = 2;

% Register parameters
block.NumDialogPrms = 2;

block.SampleTimes = [0 0];

% NUMBER OF CONTINUOUS STATES
block.NumContStates = 2;

% -----------------------------------------------------------------
% The MATLAB S-function uses an internal registry for all
% block methods. You should register all relevant methods
% (optional and required) as illustrated below. You may choose
% any suitable name for the methods and implement these methods
% as local functions within the same file. See comments
% provided for each function for more information.
% -----------------------------------------------------------------

block.RegBlockMethod('InitializeConditions', @InitializeConditions);
block.RegBlockMethod('Outputs', @Outputs);     % Required
block.RegBlockMethod('Derivatives', @Derivatives);
block.RegBlockMethod('Terminate', @Terminate); % Required

%end setup

function InitializeConditions(block)

% INITIALIZE THE STATES VALUES:
block.ContStates.Data = [block.DialogPrm(1).Data block.DialogPrm(2).Data]';

%end InitializeConditions

function Outputs(block)

block.OutputPort(1).Data = block.ContStates.Data;

%end Outputs

function Derivatives(block)

D = block.InputPort(1).Data(1);   % Input 01
x2f = block.InputPort(1).Data(2); % Input 02

x1 = block.ContStates.Data(1); % First State
x2 = block.ContStates.Data(2); % Second State

% CONSTANTS FROM THE TANK
umax = .53;
km = .12;
Y = .4;

mu = (umax*x2)/(km + x2);

% CALCULATING THE EVOLUTION OF THE DYNAMICS:
block.Derivatives.Data = [(mu - D)*x1 (D*(x2f - x2) - (mu*x1)/Y)]';

%end Derivatives

function Terminate(block)

%end Terminate

