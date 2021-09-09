function status = StartOpenSCAD(file_name, varargin)
%STARTOPENSCAD Summary of this function goes here
%   Detailed explanation goes here
fileID = fopen(file_name,'a');
fclose(fileID);
path_cd = cd;
cd('C:\Program Files\OpenSCAD\');
cmd = ['start openscad.exe ' '"' char(path_cd) '\' file_name '"'];
status = system(cmd);
cd(path_cd);
end

