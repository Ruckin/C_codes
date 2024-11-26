% PROJECT OF THE CONTROLLER FOR THE Hoo NORM:
function project = HooControlProject(A, B, C, D, gamma)

disp('The problem formulation:');
% DRAWING THE BLOCK DIAGRAM: FOR Hoo
disp('    ------------------    ');
disp('    |                |    ');
disp('--->|w     G(s)     z|--->');
disp(' -->|u              y|--- ');
disp(' |  |                |  | ');
disp(' |  ------------------  | ');
disp(' |                      | ');
disp(' |        -------       | ');
disp(' ---------|  K  |<------- ');
disp('          -------         ');

%  BUILDING THE LMIS:

% CALCULATING THE GAIN:
project = -1;

end