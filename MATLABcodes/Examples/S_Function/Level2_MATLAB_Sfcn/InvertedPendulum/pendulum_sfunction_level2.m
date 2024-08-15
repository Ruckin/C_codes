%% CODE LEVEL 2 S-FUNCTION INVETTED PENDULUM SIMULATION IN SIMULINK:

function pendulum_sfunction_level2(block)
setup(block);

% CREATION OF THE BLOCK AND ITS PROPERTIES: SETUP
function setup(block)

% Register number of ports
block.NumInputPorts = 1;
block.NumOutputPorts = 1;

% Register parameters
block.NumDialogPrms = 2;

% Setup port properties to be inherited or dynamic
block.SetPreCompInpPortInfoToDynamic;
block.SetPreCompOutPortInfoToDynamic;

% Override input port properties
block.InputPort(1).Dimensions        = 2;
block.InputPort(1).DatatypeID        = 0;  % double
block.InputPort(1).Complexity        = 'Real';

% block.InputPort(1).DirectFeedthrough = true;
block.InputPort(1).SamplingMode = 'Sample';

% Override output port properties
block.OutputPort(1).Dimensions  = 2;
block.OutputPort(1).SamplingMode = 'Sample';

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

function InitializeConditions(block)

% INITIALIZE THE STATES VALUES:
block.ContStates.Data = [block.DialogPrm(1).Data block.DialogPrm(2).Data]';

%end InitializeConditions

function Outputs(block)

block.OutputPort(1).Data = block.ContStates.Data;

%end Outputs

function Derivatives(block)

u = block.InputPort(1).Data(1);   % INPUT 01
t = block.InputPort(1).Data(2);   % INPUT 02

x1 = block.ContStates.Data(1); % Angular Position (theta) First State
x2 = block.ContStates.Data(2); % Angular velocity (w) Second State

x = [x1 x2]';

% CALL THE PENDULUM MODEL:
dx = pendulum(t, x, u);

% CALCULATING THE EVOLUTION OF THE DYNAMICS:
block.Derivatives.Data = dx;

%end Derivatives

function Terminate(~)

%end Terminate
