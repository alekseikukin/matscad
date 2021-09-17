function [nbytes, status] = SaveSCAD(file_name, object, varargin)
%SaveSCAD - save structure in openSCAD file (*.scad)
file_name = FileExtController(file_name, 'scad');
fileID = fopen(file_name,'w');
nbytes = fwrite(fileID, object.structure);
status = fclose(fileID);
end

