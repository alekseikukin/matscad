function parameter = GetParamFromFile(parameter_name, varargin)
%GetParamFromFile - return pointed parameters from the file
%%
current_folder = erase(which('SetOpenSCAD'), 'SetOpenSCAD.m');
file_name = [current_folder 'ParamitersOpenSCAD'];
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'file_name'
            file_name = varargin{2};
            if contains(file_name,':')
                file_name = [current_folder file_name];
            end
        otherwise
    end
    varargin(1:2) = [];
end
fileID = fopen(file_name, 'r');
A = fscanf(fileID, '%c');
parameter = extractBetween(A,[parameter_name, ':'], ';');
parameter = parameter{1};
if char(parameter(1)) == ' '
    parameter(1) = [];
end
if char(parameter(end)) == ' '
    parameter(end) = [];
end
fclose(fileID);
end