function rotate_extrude = scadRotateExtrude(object, angles , varargin)
%scadRotateExtrude -
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters:
% convexity : If the extrusion fails for a non-trival 2D shape, try setting
% the convexity parameter (the default is not 10, but 10 is a "good" value
% to try). See explanation further down.
%
% angle [Note: Requires version 2019.05] : Defaults to 360. Specifies the
% number of degrees to sweep, starting at the positive X axis. The
% direction of the sweep follows the Right Hand Rule, hence a negative
% angle sweeps clockwise.
%
% $fa : minimum angle (in degrees) of each fragment.
%
% $fs : minimum circumferential length of each fragment.
%
% $fn : fixed number of fragments in 360 degrees. Values of 3 or more
% override $fa and $fs
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
param = '';
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'convexity'
            param =[', convexity = ' num2str(varargin{2})];
        case 'fa'
            param =[', $fa = ' num2str(varargin{2})];
        case 'fs'
            param =[', $fs = ' num2str(varargin{2})];
        case 'fn'
            param =[', $fn = ' num2str(varargin{2})];
        otherwise
            error(['scadRotateExtrude: unknown paramiter - ' varargin{1}])
    end
    varargin(1:2) = [];
end
rotate_extrude = ['rotate_extrude( angle  = [' strjoin(cellstr(num2str(angles(:))), ', ') ']' param '){' newline];
rotate_extrude = [rotate_extrude char(object) newline];
rotate_extrude = ([rotate_extrude '}' ]);
end

