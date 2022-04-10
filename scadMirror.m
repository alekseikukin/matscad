function object = scadMirror(surface, object, varargin)
%scadMirror - Mirrors the child element on a plane through the origin. The
%argument to mirror() is the normal vector of a plane intersecting the
%origin through which to mirror the object.
%%%
% surface  - mirror's surface (numerical vector 1 x 3 [x, y, z])
% 
% object - scadStructure
position = [];
color = [];
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'position'
            position = varargin{2};
        case 'color'
            color = varargin{2};
        otherwise
    end
    varargin(1:2) = [];
end
formatSpec = '[ %d, %d, %d ]';
surface = compose(formatSpec, surface);
mirror_result = ['mirror(' surface{1} '){' newline];
mirror_result = [mirror_result char(object.structure) newline];
mirror_result = [mirror_result '}' ];
object.structure  = mirror_result;
if ~isempty(color)
    object = scadColor(color, object);
end
if ~isempty(position)
    object =  scadTranslate(position, object);
end
end

