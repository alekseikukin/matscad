function object = scadHull(array_of_objects, varargin)
%scadHull  - return the convex hull of objects.
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
hull_result = ['hull(){' newline];
for i = 1:max(size(array_of_objects))
    object = array_of_objects{i};
    hull_result = [hull_result char(object.structure) newline];
end
hull_result = [hull_result '}' ];
object = array_of_objects{1};
object.structure  = hull_result;
if ~isempty(color)
    object = scadColor(color, object);
end
if ~isempty(position)
    object =  scadTranslate(position, object);
end
end