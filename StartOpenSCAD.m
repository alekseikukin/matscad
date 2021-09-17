function status = StartOpenSCAD(file_name, varargin)
%StartOpenSCAD - open GUI of openSCAD with selected file (only for viewing
%structure,  not necessary for convertion structure in .stl and etc)
scadfolder = GetParamFromFile('path');
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'scadfolder'
            scadfolder = varargin{2};
        otherwise
    end
    varargin(1:2) = [];
end
file_name = FileExtController(file_name, 'scad');
path_cd = cd; % get current folder (where function was started)
if ~contains(file_name, ':') % if contain ':' that mean file name include path
    file_name = ['"' char(path_cd) '\' file_name '"'];
else
    file_name = ['"' file_name '"'];
end
fileID = fopen(file_name,'a');
fclose(fileID);
cmd = ['start "' scadfolder 'openscad.exe" ' file_name ];
status = system(cmd); % cmd OpenSCAD can't be used because here is extra parameter "start"
end

