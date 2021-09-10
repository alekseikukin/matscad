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

% ileID = fopen(file_name,'a');
% fclose(fileID);
% path_cd = cd;
% cd('C:\Program Files\OpenSCAD\');
% '-o' my_model_production.stl -D 'quality="production"' my_model.scad
% cmd = ['"C:\Program Files\OpenSCAD\openscad.exe" ' '-o ' '"' char(path_cd) '\' 'test.stl' '" ' '-D ' '"quality=""production""" ' '"' char(path_cd) '\' file_name '" '];
% status = system(cmd);
% cd(path_cd);
StartOpenSCAD(file_name);
fileID = fopen(file_name,'w');
rect_1 = scadRect(10, 10, 10);
rect_2 = scadRect(5.1, 5.1, 5.1,    'color', 'red');
% rect_2 = scadMultmatrix([60,60,60, 1;...
%     -60,60,60, 2;...
%     -60,-60,60, 3;...
%     0,0,0, 1;...
%     ],rect_2);
% structure = scadDifference(rect_1, rect_2);
structure = scadTranslate([5,5,5], rect_2);

% fprintf(fileID,'%s \n', scadRect(20, 20, 30));
fprintf(fileID,'%s \n', structure);

% fprintf(fileID,'%s \n', scadRect(20, 20, 30, varargin));
% fprintf(fileID,'%s \n', 'translate([2,2,2])cube([10,10,10]);');
fclose(fileID);
SaveAsOpenSCAD(file_name)