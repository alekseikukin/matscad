function object = scadCircle(size1, varargin)
%scadcircle - Creates a circle at the origin. All parameters, except r,
%must be named.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% parameters:
%
%r : circle radius. r name is the only one optional with circle.
% circle resolution is based on size, using $fa or $fs. For a small, high
% resolution circle you can make a large circle, then scale it down, or you
% could set $fn or other special variables. Note: These examples exceed the
% resolution of a 3d printer as well as of the display screen.
%
% d  : circle diameter (only available in versions later than 2014.03).
%
% $fa : minimum angle (in degrees) of each fragment.
%
% $fs : minimum circumferential length of each fragment.
%
% $fn : fixed number of fragments in 360 degrees. Values of 3 or more
% override $fa and $fs
%
% $fa, $fs and $fn must be named. click here for more details,.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
size_param = 'r';
center = true;
position = [];
paramiters = '';
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'center'
            center = varargin{2};
            varargin(1:2) = [];
        case 'position'
            position = varargin{2};
            varargin(1:2) = [];
        case 'fa'
            paramiters =[paramiters ', ' '$fa = ' num2str(varargin{2})];
            varargin(1:2) = [];
        case 'fs'
            paramiters =[paramiters ', ' '$fs = ' num2str(varargin{2})];
            varargin(1:2) = [];
        case 'fn'
            paramiters =[paramiters ', ' '$fn = ' num2str(varargin{2})];
            varargin(1:2) = [];
        case 'd'
            size_param = 'd';
            varargin(1) = [];
        case 'r'
            size_param = 'r';
            varargin(1) = [];
        otherwise
            error(['scadcircle: unknown paramiter - ' varargin{1}])
    end
end
if max(size(size1)) == 1
    size1 = num2str(size1);
else
    size1 = ['[' char(strjoin(compose('%d', size1), ',')) ']'];
end
circle = ['circle(' size_param ' = ' size1  paramiters ');' ];
if ~isempty(position)
    circle =  scadTranslate(position, circle);
end
object = scadStructure();
object.structure = circle;
end