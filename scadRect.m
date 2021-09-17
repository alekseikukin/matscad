function object = scadRect(xyz_span, varargin)
%SCADADDRECT Summary of this function goes here
%   Detailed explanation goes here
% add check is x_span, y_span, z_span string/char or number
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

