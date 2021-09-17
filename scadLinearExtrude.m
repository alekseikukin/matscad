function object = scadLinearExtrude(object, height, varargin)
%scadLinearExtrude -Linear Extrusion is a operation that takes a 2D object
%as input and generates a 3D object as a result.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% parameters:
% 
% object - 2D scadStructure for extrudion
% 
% height - distance
% 
% center - if true, center placed in center of structure
% 
% convexity -  If the extrusion fails for a non-trival 2D shape, try
% setting the convexity parameter (the default is not 10, but 10 is a
% "good" value to try)
% 
% twist - Twist is the number of degrees of through which the shape is
% extruded. Setting the parameter twist = 360 extrudes through one
% revolution. The twist direction follows the left hand rule.
% 
% slices -  defines the number of intermediate points along the Z axis of
% the extrusion
% 
% scale - Scales the 2D shape by this value over the height of the
% extrusion. Scale can be a scalar or a vector 1 x 2
% 
% fn - number of fragments
% 
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
            param = [param ', scale = [' strjoin(cellstr(num2str(varargin{2}(:))), ', ') ']' ];
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
linear_extrude = [linear_extrude char(object.structure) newline];
linear_extrude = ([linear_extrude '}' ]);
if ~isempty(position)
    linear_extrude =  scadTranslate(position, linear_extrude);
end
if ~isempty(color)
    linear_extrude =  scadColor(color, linear_extrude);
end
object.structure = linear_extrude;
end