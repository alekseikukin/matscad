function status = cmdOpenSCAD(comand, varargin)
%cmdOpenSCAD  - 
scadfolder = GetParamFromFile('path');
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

