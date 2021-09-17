function object = scadResize(multiplicators, object, varargin)
%scadResize - Modifies the size of the child object to match the given x,y,
%and z.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters:
% multiplicators - numerical array 1 x 3 of multiplicators [x, y, z]
% object - scadStructure
%

%% default parameters
position = [];
color = [];
param = '';
%% get parameters from varargin
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'position'
            position = varargin{2};
        case 'color'
            color = varargin{2};
        case 'auto'
            auto1 =  varargin{2};
            if max(size(auto1)) > 1
                param = [', auto = [' strjoin(boolean2string(auto1), ', ') ']'];
            elseif max(size(auto1)) == 3
                param = [', auto = ' boolean2string(auto1)];
            else
                error('scadResize: "auto" must contain 1 or 3 parameters')
            end
        otherwise
            error(['scadResize: unknown parameter ' char(string(varargin{1}))])
    end
    varargin(1:2) = [];
end
%% conver multiplicators to string
formatSpec = '[ %d, %d, %d ]';
multiplicators = compose(formatSpec, multiplicators);
%% concatenate string
resize_result = ['resize(' char(multiplicators)  ...
    char(param) '){' newline];
resize_result = [resize_result char(object.structure) newline];
resize_result = [resize_result '}' ];
%% put data to structure
object.structure  = resize_result;
%% change position and colot
if ~isempty(color)
    object = scadColor(color, object);
end
if ~isempty(position)
    object =  scadTranslate(position, object);
end
end

