function multmatrix_result = scadMultmatrix(points, object, varargin)
%scadmultmatrix Summary of this function goes here
%   Detailed explanation goes here
formatSpec = string(['[ %d, %d, %d ]' newline]);
points = compose(formatSpec, points);
points = [points{:}];
multmatrix_result = ['multmatrix([' points ']){' newline];
multmatrix_result = [multmatrix_result object newline];
multmatrix_result = [multmatrix_result '}' ];
end