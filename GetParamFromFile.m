function parameter = GetParamFromFile(parameter_name)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
fileID = fopen('ParamitersOpenSCAD', 'r');
A = fread(fileID);
parameter = extractBetween(A,[parameter_name, ':'], ';');
if char(parameter(1)) == ' '
    parameter(1) = [];
end
if char(parameter(end)) == ' '
    parameter(end) = [];
end
fclose(fileID);
end