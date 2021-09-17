function object = scadColor(color, object, varargin)
%scadColor Summary of this function goes here
%   Detailed explanation goes here
color_result = ['color("' char(color) '"){' newline];
color_result = [color_result char(object.structure) newline];
color_result = ([color_result '}' ]);
object.structure = color_result;
end

