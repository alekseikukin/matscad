function status = cmdOpenSCAD(comand, varargin)
%STARTOPENSCAD Summary of this function goes here
%   Detailed explanation goes here
scadfolder = 'C:\Program Files\OpenSCAD\';
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'scadfolder'
            scadfolder = varargin{2};
        otherwise
    end
    varargin(1:2) = [];
end
path_cd = cd; % save current location
cmd = ['"'  scadfolder 'openscad.exe" ' comand ]; % build command
status = system(cmd);  % run command
cd(path_cd); % go back to first folder
end

