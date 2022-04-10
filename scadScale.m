function object = scadScale(multiplicators, object, varargin)
%scadScale - Scales its child elements using the specified vector.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters:
% multiplicators - numerical array 1 x 3 of multiplicators [x, y, z]
% object - scadStructure
%% default parameters
position = [];
color = [];
%% get parameters from varargin
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'position'
            position = varargin{2};
        case 'color'
            color = varargin{2};
        otherwise
            error(['scadScale: unknown parameter ' char(string(varargin{1}))])
    end
    varargin(1:2) = [];
end
%% conver multiplicators to string
formatSpec = '[ %d, %d, %d ]';
multiplicators = compose(formatSpec, multiplicators);
%% concatenate string
scale_result = ['scale (' char(multiplicators) '){' newline];
scale_result = [scale_result char(object.structure) newline];
scale_result = [scale_result '}' ];
%% put data to structure
object.structure  = scale_result;
%% change position and colot
if ~isempty(color)
    object = scadColor(color, object);
end
if ~isempty(position)
    object =  scadTranslate(position, object);
end
end