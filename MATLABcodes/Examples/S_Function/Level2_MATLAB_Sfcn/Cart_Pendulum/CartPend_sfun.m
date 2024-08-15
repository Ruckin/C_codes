%% FREDERICO CASARA ANTONIAZZI - 06/03/2024
%  CODIGO PARA A IMPLEMENTACAO DE S-FUNCTION LEVEL 2 PARA A SIMULACAO DE UM
%  PENDULO INVERTIDO SOBRE UM CARRINHO, BASEADO EM VIDEO AULA DE TURIX 
%  DYNAMICS.

function CartPend_sfun(block)

setup(block);

%endfunction

function setup(block)

% Register number of ports
block.NumInputPorts  = 1;
block.NumOutputPorts = 1;

% Register parameters
block.NumDialogPrms = 4;

% Setup port properties to be inherited or dynamic
block.SetPreCompInpPortInfoToDynamic;
block.SetPreCompOutPortInfoToDynamic;

% Override input port properties
block.InputPort(1).Dimensions        = 1;
block.InputPort(1).DatatypeID        = 0;  % double
block.InputPort(1).Complexity        = 'Real';
% block.InputPort(1).DirectFeedthrough = true;
block.InputPort(1).SamplingMode = 'Sample';

% Override output port properties
block.OutputPort(1).Dimensions  = 4;
block.OutputPort(1).SamplingMode = 'Sample';

block.SampleTimes = [0 0];

% NUMBER OF CONTINUOUS STATES
block.NumContStates = 4;

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
block.ContStates.Data = [block.DialogPrm(1).Data block.DialogPrm(2).Data ...
                         block.DialogPrm(3).Data block.DialogPrm(4).Data]';

%end InitializeConditions

function Outputs(block)

block.OutputPort(1).Data = block.ContStates.Data;

%end Outputs

function Derivatives(block)

u = block.InputPort(1).Data(1);   % Input 01

x1 = block.ContStates.Data(1); % Linear Position (x) First State
x2 = block.ContStates.Data(2); % Linear velocity (v) Second State
x3 = block.ContStates.Data(3); % Rotation Displacement (theta) Thrid State
x4 = block.ContStates.Data(4); % Rotation Velocity (w) Fourth State

x = [x1 x2 x3 x4]';

% CONSTANT OF THE MODEL:
m = 1;    % ROD MASS
M = 5;    % CART MASS
L = 2;    % ROD LENGTH
g = 9.81; % GRAVITY
d = 1;    % FRICCTION COEFFICIENT
I = .006; % MOMENTUM OF INERTIA OF THE ROD

% CALL THE PENDULUM MODEL:
dx = pendulumCartModel(x, u, m, M, L, g, d, I);

% CALCULATING THE EVOLUTION OF THE DYNAMICS:
block.Derivatives.Data = dx;

%end Derivatives

function Terminate(~)

%end Terminate
