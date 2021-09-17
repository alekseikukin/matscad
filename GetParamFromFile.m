function parameter = GetParamFromFile(parameter_name, varargin)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
file_name = 'ParamitersOpenSCAD';
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'file_name'
            file_name = varargin{2};
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