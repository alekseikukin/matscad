function minkowski_result = scadMinkowski(varargin)
%scadminkowski Summary of this function goes here
%   Detailed explanation goes here
minkowski_result = ['minkowski(){' newline];
minkowski_result = [minkowski_result strjoin(varargin, newline) newline];
minkowski_result = [minkowski_result '}' ];
end

