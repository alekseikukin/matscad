function rectangle = scadRect(xyz_span, varargin)
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
if ~isempty(color)
    rectangle = scadColor(color, rectangle);
end
if ~isempty(position)
  rectangle =  scadTranslate(position, rectangle);
end

end

