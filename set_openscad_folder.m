% change path
[file_name, path2openscad] = uigetfile('*.exe',...
    'Select openscad.exe file','C:\Program Files\OpenSCAD\openscad.exe');
% [file_name, path2openscad] = uigetfile('*.exe',...
%     'Select openscad.exe file','C:\Program Files\OpenSCAD (Nightly)\openscad.exe');
if ~isempty(path2openscad) && string(file_name) == "openscad.exe"
    SetOpenSCAD('path', path2openscad);
else
    disp('folder was not selected')
end