function status = cmdOpenSCAD(comand, varargin)
%cmdOpenSCAD  - send a comand to openSCAD
%see list of comands here:
% https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Using_OpenSCAD_in_a_command_line_environment
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
if ispc
    cmd = ['"'  scadfolder 'openscad.exe" ' comand ]; % build command
elseif isunix
    cmd = ['"'  scadfolder 'openscad" ' comand ]; % build command
else
    error('Platform not supported');
end
status = system(cmd);  % run command
cd(path_cd); % go back to first folder
end

