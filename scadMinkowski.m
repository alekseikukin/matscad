function object = scadMinkowski(array_of_objects, varargin)
%scadMinkowski - Displays the minkowski sum of objects
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
minkowski_result = ['minkowski(){' newline];
for i = 1:max(size(array_of_objects))
    object = array_of_objects{i};
    minkowski_result = [minkowski_result char(object.structure) newline];
end
minkowski_result = [minkowski_result '}' ];
object = array_of_objects{1};
object.structure  = minkowski_result;
if ~isempty(color)
    object = scadColor(color, object);
end
if ~isempty(position)
    object =  scadTranslate(position, object);
end
end