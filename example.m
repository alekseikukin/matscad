file_name = 'example3.scad';
% fileID = fopen(file_name,'a');
% fprintf(fileID,'%s \n', 'translate([0,0,0])cube([10,10,10]);');
% fprintf(fileID,'%s \n', 'translate([2,2,2])cube([10,10,10]);');
% fclose(fileID);

% path_cd = cd
% cd('C:\Program Files\OpenSCAD\')
% cmd = ['start openscad.exe ' '"' char(path_cd) '\' file_name '"']
% system(cmd)
% cd(path_cd)
% StartOpenSCAD(file_name)

ileID = fopen(file_name,'a');
fclose(fileID);
path_cd = cd;
% cd('C:\Program Files\OpenSCAD\');
% '-o' my_model_production.stl -D 'quality="production"' my_model.scad
cmd = ['"C:\Program Files\OpenSCAD\openscad.exe" ' '-o ' '"' char(path_cd) '\' 'test.stl' '" ' '-D ' '"quality=""production""" ' '"' char(path_cd) '\' file_name '" '];
status = system(cmd);
cd(path_cd);

fileID = fopen(file_name,'a');
rect_1 = scadRect(20, 20, 30);
rect_2 = scadRect(10, 10, 40,...
    'position', [5,5,-5],...
    'color', 'red');
structure = scadDifference(rect_1, rect_2)
structure = scadTranslate([5,5,5], structure)
% fprintf(fileID,'%s \n', scadRect(20, 20, 30));
fprintf(fileID,'%s \n', structure);

% fprintf(fileID,'%s \n', scadRect(20, 20, 30, varargin));
% fprintf(fileID,'%s \n', 'translate([2,2,2])cube([10,10,10]);');
fclose(fileID);