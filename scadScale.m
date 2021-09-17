function object = scadScale(multiplicators, object, varargin)
%scadScale - Scales its child elements using the specified vector.
%
position = [];
color = [];
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'position'
            position = varargin{2};
        case 'color'
            color = varargin{2};
        otherwise
            error(['scadScale: unknown parameter ' char(string(varargin{1}))])
    end
    varargin(1:2) = [];
end
%
formatSpec = '[ %d, %d, %d ]';
multiplicators = compose(formatSpec, multiplicators);
%
scale_result = ['scale (' char(multiplicators) '){' newline];
scale_result = [scale_result char(object.structure) newline];
scale_result = [scale_result '}' ];
%
object.structure  = scale_result;
%
if ~isempty(color)
    object = scadColor(color, object);
end
if ~isempty(position)
    object =  scadTranslate(position, object);
end
end