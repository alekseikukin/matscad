function [fileID, nbytes, status] = SaveSCAD(file_name, structure, varargin)
%SaveSCAD Summary of this function goes here
%   Detailed explanation goes here
file_name = FileExtController(file_name, 'scad');
fileID = fopen(file_name,'w');
nbytes = fprintf(fileID,'%s \n', structure);
status = fclose(fileID);
end

