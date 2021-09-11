function cylinder = scadCylinder(h, d, varargin)

% cylinder(h = height, r1 = BottomRadius, r2 = TopRadius, center = true/false);
% Parameters
% h : height of the cylinder or cone
% r  : radius of cylinder. r1 = r2 = r.
% r1 : radius, bottom of cone.
% r2 : radius, top of cone.
% d  : diameter of cylinder. r1 = r2 = d / 2. [Note: Requires version 2014.03]
% d1 : diameter, bottom of cone. r1 = d1 / 2. [Note: Requires version 2014.03]
% d2 : diameter, top of cone. r2 = d2 / 2. [Note: Requires version 2014.03]
% center
% false (default), z ranges from 0 to h
% true, z ranges from -h/2 to +h/2
% $fa : minimum angle (in degrees) of each fragment.
% $fs : minimum circumferential length of each fragment.
% $fn : fixed number of fragments in 360 degrees. Values of 3 or more override $fa and $fs
position = [];
color = [];
size = 'd';
size2 = size;
param = '';
d2 = d;
center = false;
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'fa'
            param = [param ' $fa = ' num2str(varargin{2}) ','];
            varargin(1:2) = [];
        case 'fs'
            param = [param ' $fs = ' num2str(varargin{2}) ',']   ;
            varargin(1:2) = [];
        case 'd2'
            d2 = varargin{2};
            size2 = 'd';
            varargin(1:2) = [];
        case 'r2'
            d2 = varargin{2};
            size2 = 'r';
            varargin(1:2) = [];
        case 'center'
            center = varargin{2};
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
            error(['scadcylinder: unknown paramiter - ' varargin{1}])
    end
end
if ~isempty(param)
    param = [', ' param];
    param(end) = [];
end
cylinder = (['cylinder(' size '1=' num2str(d) ', '...
    size2 '2=' num2str(2) ...
    ', h=' num2str(d2)...
    ', center='  num2str(center)...
    param ')' ';' ]);
if ~isempty(color)
    cylinder = scadColor(color, cylinder);
end
if ~isempty(position)
    cylinder =  scadTranslate(position, cylinder);
end

end