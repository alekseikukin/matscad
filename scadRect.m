function object = scadRect(xyz_span, varargin)
%scadRect - create rectangle with edges [x, y, z] = xyz_span;
%%
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
formatSpec = string( [ '[ %d, %d, %d ]' ] );
rectangle = (['cube(' char(compose(formatSpec, xyz_span)) ')' ';' ]);
object = scadStructure();
object.structure  = rectangle;
if ~isempty(color)
    object = scadColor(color, object);
end
if ~isempty(position)
  object =  scadTranslate(position, object);
end

end

