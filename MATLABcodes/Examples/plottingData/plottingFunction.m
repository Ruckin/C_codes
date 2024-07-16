function [A] = plottingFunction(varargin)

% CODE FOR INPUT ARGUMENTS TREATMENT IN MATLAB:

switch nargin % USER DEFINED ALL THE INPUTS
    case 6

        SHAPE     = varargin{1};
        X         = varargin{2};
        Y         = varargin{3};
        SIZE      = varargin{4};
        COLOR     = varargin{5};
        LINEWIDTH = varargin{6};

    case 5 % USING THE DEFAULT WIDTHS FOR THE DRAWING

       SHAPE     = varargin{1};
        X         = varargin{2};
        Y         = varargin{3};
        SIZE      = varargin{4};
        COLOR     = varargin{5};
        LINEWIDTH = 1;

    case 4 % USING THE DEFAULT WIDTHS, AND COLORS FOR THE DRAWING

       SHAPE     = varargin{1};
        X         = varargin{2};
        Y         = varargin{3};
        SIZE      = varargin{4};
        COLOR     = [0 0 1];
        LINEWIDTH = 1;

    case 3 % USING THE DEFAULT WIDTHS, COLORS, AND SIZES FOR THE DRAWING

       SHAPE     = varargin{1};
        X         = varargin{2};
        Y         = varargin{3};
        SIZE      = 1;
        COLOR     = [0 0 1];
        LINEWIDTH = 1;

    otherwise

        error('Invalid number of inputs!');

end

% DRAWING NOW

switch SHAPE
    case 'circle'
        

