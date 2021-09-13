function polygon = scadPolygon(points, varargin)
%scadPolygon - Creates a multiple sided shape from a list of x,y
%coordinates. A polygon is the most powerful 2D object. It can create
%anything that circle and squares can, as well as much more. This includes
%irregular shapes with both concave and convex edges. In addition it can
%place holes within that shape.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% parameters:
% size
% single value, polygon with both sides this length
% 2 value array [x,y], rectangle with dimensions x and y
% center
% false (default), 1st (positive) quadrant, one corner at (0,0)
% true, polygon is centered at (0,0)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
position = [];
formatSpec = '[ %d, %d, %d ],';
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'paths'
            paramiters =[paramiters ...
                ', ' 'paths = '...
                ['[' char(strjoin(compose('%d', varargin{2}), ',')) ']']];
        case 'convexity '
            paramiters =[paramiters ', ' 'convexity = ' num2str(varargin{2})];
        case 'position'
            position = varargin{2};
        otherwise
            error(['scadPolygon: unknown paramiter - ' varargin{1}])
    end
    varargin(1:2) = [];
end
points = compose(formatSpec, points);
points = [points{:}];
points(end) = [];
polygon = ['polygon(points = [' points ']'...
    paramiters ');' ];
if ~isempty(position)
    polygon =  scadTranslate(position, polygon);
end
end