function color_result = scadColor(color, object, varargin)
%scadColor Summary of this function goes here
%   Detailed explanation goes here
color_result = ['color(' color '){' newline];
color_result = [color_result object newline];
color_result = [color_result '}' ];
end

