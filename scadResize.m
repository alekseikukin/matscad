function object = scadResize(multiplicators, object, varargin)
%scadResize - 

position = [];
color = [];
param = '';
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'position'
            position = varargin{2};
        case 'color'
            color = varargin{2};
        case 'auto'
            auto1 =  varargin{2};
            if max(size(auto1)) > 1
                param = [', auto = [' strjoin(boolean2string(auto1), ', ') ']'];
            elseif max(size(auto1)) == 3
                param = [', auto = ' boolean2string(auto1)];
            else
                error(['scadResize: unknown parameter ' char(string(varargin{1}))])
            end
        otherwise
            error('scadResize: "auto" must contain 1 or 3 parameters')
    end
    varargin(1:2) = [];
end
%
formatSpec = '[ %d, %d, %d ]';
multiplicators = compose(formatSpec, multiplicators);
%
resize_result = ['resize(' char(multiplicators)  ...
    char(param) ']){' newline];
resize_result = [resize_result char(object.structure) newline];
resize_result = [resize_result '}' ];
%
object.structure  = resize_result;
%
if ~isempty(color)
    object = scadColor(color, object);
end
if ~isempty(position)
    object =  scadTranslate(position, object);
end
end

