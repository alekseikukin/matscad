function object = scadPolyhedron(points, faces, varargin)
% scadPolyhedron - A polyhedron is the most general 3D primitive solid. It
% can be used to create any regular or irregular shape including those with
% concave as well as convex features. Curved surfaces are approximated by a
% series of flat surfaces.
%%%
% Parameters
%
% points Vector of 3d points or vertices. Each point is in turn a vector,
% [x,y,z], of its coordinates. Points may be defined in any order. N points
% are referenced, in the order defined, as 0 to N-1.
%
% triangles [Deprecated: triangles will be removed in future releases. Use
% faces parameter instead] Vector of faces that collectively enclose the
% solid. Each face is a vector containing the indices (0 based) of 3 points
% from the points vector.
%
% faces [Note: Requires version 2014.03] Vector of faces that collectively
% enclose the solid. Each face is a vector containing the indices (0 based)
% of 3 or more points from the points vector. Faces may be defined in any
% order. Define enough faces to fully enclose the solid, with no overlap.
% If points that describe a single face are not on the same plane, the face
% is automatically split into triangles as needed.
%
% convexity Integer. The convexity parameter specifies the maximum number
% of faces a ray intersecting the object might penetrate. This parameter is
% needed only for correct display of the object in OpenCSG preview mode. It
% has no effect on the polyhedron rendering. For display problems, setting
% it to 10 should work fine for most cases.
%
position = [];
color = [];
faces_type = 'faces';
formatSpec = string( [ '[ %d, %d, %d ],' ] );
points = compose(formatSpec, points);
faces2 = '';
for i = faces(1:end)
    i = i{1};
    formatSpec2 = '[';
    for l = 1:max(size(i))
        formatSpec2 = [formatSpec2 ' %d,'];
    end
    formatSpec2(end) = '';
    formatSpec2 = [formatSpec2 ' ],'];
    faces2 = [faces2 compose(formatSpec2, i)];
end
faces2 = [faces2{:}];
points = [points{:}];
faces2(end) = [];
points(end) = [];
param = '';
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'position'
            position = varargin{2};
            varargin(1:2) = [];
        case 'color'
            color = varargin{2};
            varargin(1:2) = [];
        case 'convexity '
            param =[newline ', convexity = ' varargin{2}];
            varargin(1:2) = [];
        case 'triangles'
            faces_type = 'triangles';
            varargin(1) = [];
        case 'faces'
            faces_type = 'faces';
            varargin(1) = [];
        otherwise
            error(['scadpolyhedron: unknown paramiter - ' varargin{1}])
    end
end
polyhedron = (['polyhedron('...
    'points = [' char(points) '], ' newline...
    faces_type ' = [ ' char(faces2) ']' ...
    param ' );' ]);
object = scadStructure();
object.structure = polyhedron;
if ~isempty(color)
    object = scadColor(color, object);
end
if ~isempty(position)
    object =  scadTranslate(position, object);
end

end