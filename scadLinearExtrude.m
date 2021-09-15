function square = scadLinearExtrude(height, varargin)
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
            param = [param ' center= ' boolean2string(varargin{2}) ','];
        case 'convexity'
            param = [param ' convexity= ' num2str(varargin{2}) ','];
        case 'twist'
            param = [param ' twist= ' num2str(varargin{2}) ','];
        case 'slices'
            param = [param ' slices= ' num2str(varargin{2}) ','];
        case 'scale'
            param = [param ' scale= ' num2str(varargin{2}) ','];
        case 'fn'
            param = [param ' $fn= ' num2str(varargin{2}) ','];
        case 'position'
            position = varargin{2};
        case 'color'
            color = varargin{2};
        otherwise
            error(['scadSquare: unknown paramiter - ' varargin{1}])
    end
    varargin(1:2) = [];
end

square = ['linear_extrude(size = ' num2str(height) ...
    param ');' ];
if ~isempty(position)
    square =  scadTranslate(position, square);
end
if ~isempty(color)
    square =  scadColor(color, square);
end
end