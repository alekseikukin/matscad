function status = StartOpenSCAD(file_name, varargin)
%STARTOPENSCAD Summary of this function goes here
%   Detailed explanation goes here
fileID = fopen(file_name,'a');
fclose(fileID);
path_cd = cd;
scadfolder = 'C:\Program Files\OpenSCAD\';
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'scadfolder'
            scadfolder = varargin{2};
        otherwise
    end
    varargin(1:2) = [];
end
% cd('C:\Program Files\OpenSCAD\');
cmd = ['start "' scadfolder 'openscad.exe" ' '"' char(path_cd) '\' file_name '"'];
status = system(cmd);
cd(path_cd);
end

