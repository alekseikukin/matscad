function rectangle = scadRect(x_span, y_span, z_span, varargin)
%SCADADDRECT Summary of this function goes here
%   Detailed explanation goes here
position = [0,0,0];
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


rectangle = [...
    'translate([' num2str(position(1)) ', ' ...
    num2str(position(2)) ', ' ...
    num2str(position(3)) ...
    '])'];
if ~isempty(color)
    rectangle = [rectangle ' color( "' color '" )' ];
end

% add check is x_span, y_span, z_span string/char or number
rectangle = [ rectangle ' cube([' num2str(x_span) ', ' ...
    num2str(y_span) ', ' ...
    num2str(z_span) ...
    ']) ' ';' ];
end

