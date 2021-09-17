function object = scadPolygon(points, varargin)
%scadPolygon - Creates a multiple sided shape from a list of x,y
%coordinates. A polygon is the most powerful 2D object. It can create
%anything that circle and squares can, as well as much more. This includes
%irregular shapes with both concave and convex edges. In addition it can
%place holes within that shape.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% points - The list of x,y points of the polygon. : A array n x 2. Note:
% points.
%
% paths - default. cell array of vectors. If no path is specified, all
% points are used in the order listed. single vector The order to traverse
% the points. Uses indices from 0 to n-1. May be in a different order and
% use all or part, of the points listed. multiple vectors Creates primary
% and secondary shapes. Secondary shapes are subtracted from the primary
% shape (like difference). Secondary shapes may be wholly or partially
% within the primary shape. A closed shape is created by returning from the
% last point specified to the first.
%
% convexity - Integer number of "inward" curves, ie. expected path
% crossings of an arbitrary line through the polygon. See below.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
position = [];
parameters = '';
formatSpec = '[ %d, %d ],';
path2SCAS = '';
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'paths'
            paths = [', ' 'paths = ['];
            for i = varargin{2}(1:end)
                i = i{1};
                formatSpec2 = '[';
                for l = 1:max(size(i))
                    formatSpec2 = [formatSpec2 ' %d,'];
                end
                formatSpec2(end) = '';
                formatSpec2 = [formatSpec2 ' ],'];
                paths = [paths compose(formatSpec2, i)];
            end
            paths = [paths{:}];
            paths(end) = [];
            paths = [paths ']'];
            parameters = [parameters paths];
        case 'convexity '
            parameters =[parameters ', ' 'convexity = ' num2str(varargin{2})];
        case 'position'
            position = varargin{2};
        case 'path2scad'
            path2SCAS = varargin{2};
        otherwise
            error(['scadPolygon: unknown paramiter - ' varargin{1}])
    end
    varargin(1:2) = [];
end
points = compose(formatSpec, points);
points = [points{:}];
points(end) = [];
polygon = ['polygon(points = [' points ']'...
    parameters ');' ];
if ~isempty(position)
    polygon =  scadTranslate(position, polygon);
end
if isempty(path2SCAS)
    object = scadStructure('path', path2SCAS);
else
    object = scadStructure();
end
object.structure = polygon;
end