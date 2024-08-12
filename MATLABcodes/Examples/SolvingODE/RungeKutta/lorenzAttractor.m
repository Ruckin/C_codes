%% CODE FOR SAVING THE FUNCTION:
%  12/08/2024
%  INTENDED TO SHOW HOW USE A FUNCTION CALL IN A MAIN PROGRAM AND SEND FOR
%  ANOTHER FUNCTION
%

%% CREATING THE FUNCTION:

function dy = lorenzAttractor(t, y, sigma, beta, rho)


dy = [sigma*(y(2) - y(1));
      y(1)*(rho - y(3)) - y(2);
      y(1)*y(2) - beta*y(3)];
