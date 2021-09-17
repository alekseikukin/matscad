function object = scadMultmatrix(points, object, varargin)
%scadMultmatrix Multiplies the geometry of all child elements with the
%given affine transformation matrix, where the matrix is 4×3 - a vector of
%3 row vectors with 4 elements each, or a 4×4 matrix with the 4th row
%always forced to [0,0,0,1].
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
formatSpec = string(['[ %d, %d, %d , %d],' newline]);
points = compose(formatSpec, points);
% points = [points{:}];
multmatrix_result = ['multmatrix([' points{:} ']){' newline];
multmatrix_result = [multmatrix_result char(object.structure)  newline];
multmatrix_result = [multmatrix_result '}' ];
object.structure  = multmatrix_result;
if ~isempty(color)
    object = scadColor(color, object);
end
if ~isempty(position)
    object =  scadTranslate(position, object);
end
end