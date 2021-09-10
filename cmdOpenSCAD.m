function status = cmdOpenSCAD(comand)
%STARTOPENSCAD Summary of this function goes here
%   Detailed explanation goes here
path_cd = cd;
cd('C:\Program Files\OpenSCAD\');
cmd = ['start openscad.exe ' comand ];
status = system(cmd);
cd(path_cd);
end

