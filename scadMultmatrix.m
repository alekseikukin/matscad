function multmatrix_result = scadMultmatrix(points, object, varargin)
%scadMultmatrix Multiplies the geometry of all child elements with the
%given affine transformation matrix, where the matrix is 4×3 - a vector of
%3 row vectors with 4 elements each, or a 4×4 matrix with the 4th row
%always forced to [0,0,0,1].
%   Detailed explanation goes here
formatSpec = string(['[ %d, %d, %d , %d],' newline]);
points = compose(formatSpec, points);
% points = [points{:}];
multmatrix_result = ['multmatrix([' points{:} ']){' newline];
multmatrix_result = [multmatrix_result object newline];
multmatrix_result = [multmatrix_result '}' ];
end