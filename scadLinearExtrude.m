function linear_extrude = scadLinearExtrude(object, height, varargin)
%scadLinearExtrude -
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% parameters:
% linear_extrude(height = 5, center = true, convexity = 10, twist = -fanrot, slices = 20, scale = 1.0, $fn = 16)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
position = [];
param = '';
color = [];
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'center'
            param = [param ', center = ' boolean2string(varargin{2})];
        case 'convexity'
            param = [param ', convexity = ' num2str(varargin{2})];
        case 'twist'
            param = [param ', twist = ' num2str(varargin{2})];
        case 'slices'
            param = [param ', slices = ' num2str(varargin{2})];
        case 'scale'
            param = [param ', scale = [' strjoin( num2str(varargin{2}), ',' ) ']' ];
        case 'fn'
            param = [param ', $fn = ' num2str(varargin{2})];
        case 'position'
            position = varargin{2};
        case 'color'
            color = varargin{2};
        otherwise
            error(['scadSquare: unknown paramiter - ' varargin{1}])
    end
    varargin(1:2) = [];
end

linear_extrude = ['linear_extrude(size = ' num2str(height) ...
    param '){' ];
linear_extrude = [linear_extrude char(object) newline];
linear_extrude = ([linear_extrude '}' ]);
if ~isempty(position)
    linear_extrude =  scadTranslate(position, linear_extrude);
end
if ~isempty(color)
    linear_extrude =  scadColor(color, linear_extrude);
end
end