function object = scadSquare(size1, varargin)
%scadSquare - Creates a square or rectangle in the first quadrant. When
%center is true the square is centered on the origin. Argument names are
%optional if given in the order shown here.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% parameters:
%
% size - single value, square with both sides this length
% 2 value array [x,y], rectangle with dimensions x and y
%
% center -  false (default), 1st (positive) quadrant, one corner at (0,0)
% true, square is centered at (0,0)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
center = true;
position = [];
color = [];
%
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'center'
            center = varargin{2};
        case 'position'
            position = varargin{2};
        case 'color'
            color = varargin{2};
        otherwise
            error(['scadSquare: unknown paramiter - ' varargin{1}])
    end
    varargin(1:2) = [];
end
%
if max(size(size1)) == 1
    size1 = num2str(size1);
else
    size1 = ['[' char(strjoin(compose('%d', size1), ',')) ']'];
end
%
square = ['square(size = ' size1 ','...
    ' center =' boolean2string(center) ');' ];
object = scadStructure();
%
object.structure = square;
%
if ~isempty(color)
    object = scadColor(color, object);
end
if ~isempty(position)
    object =  scadTranslate(object, circle);
end
end