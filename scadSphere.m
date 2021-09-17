function object = scadSphere(diam, varargin)

%Parameters
% r Radius. This is the radius of the sphere. The resolution of the sphere
% is based on the size of the sphere and the $fa, $fs and $fn variables.
% For more information on these special variables look at:
% OpenSCAD_User_Manual/Other_Language_Features
% d
% Diameter. This is the diameter of the sphere.
% $fa
% Fragment angle in degrees
% $fs
% Fragment size in mm
% $fn
% Resolution
position = [];
color = [];
size = 'd';
param = '';
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'fa'
            param = [param ' $fa = ' num2str(varargin{2}) ','];
            varargin(1:2) = [];
        case 'fs'
            param = [param ' $fs = ' num2str(varargin{2}) ',']   ;
            varargin(1:2) = [];
        case 'fn'
            param = [param ' $fn = ' num2str(varargin{2}) ',']  ;
            varargin(1:2) = [];
        case 'position'
            position = varargin{2};
            varargin(1:2) = [];
        case 'color'
            color = varargin{2};
            varargin(1:2) = [];
        case 'r'
            size = 'r';
            varargin(1) = [];
        case 'd'
            size = 'd';
            varargin(1) = [];
        otherwise
            error(['scadSphere: unknown paramiter - ' varargin{1}])
    end
end
if ~isempty(param)
    param = [', ' param];
    param(end) = [];
end
sphere = (['sphere(' size '=' num2str(diam) param ')' ';' ]);
object = scadStructure();
object.structure  = sphere;
if ~isempty(color)
    object = scadColor(color, object);
end
if ~isempty(position)
    object =  scadTranslate(position, object);
end
end

