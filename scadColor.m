function object = scadColor(color, object, varargin)
%scadColor - set a color of the object
%%
color_result = ['color("' char(color) '"){' newline];
color_result = [color_result char(object.structure) newline];
color_result = ([color_result '}' ]);
object.structure = color_result;
end

