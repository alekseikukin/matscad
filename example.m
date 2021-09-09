file_name = 'test.scad';
fileID = fopen(file_name,'w');
fprintf(fileID,'%s \n', 'translate([0,0,0])cube([10,10,10]);');
fprintf(fileID,'%s \n', 'translate([2,2,2])cube([10,10,10]);');
fclose(fileID);

path_cd = cd
cd('C:\Program Files\OpenSCAD\')
cmd = ['start openscad.exe ' '"' char(path_cd) '\' file_name '"']
system(cmd)
cd('C:\Program Files\OpenSCAD\')
fileID = fopen(file_name,'w');
fprintf(fileID,'%s \n', 'translate([20,20,20])cube([10,10,10]);');
fprintf(fileID,'%s \n', 'translate([22,22,22])cube([10,10,10]);');
fclose(fileID);
% cmd = ['openscad.exe']
% system(cmd)
cd('C:\Program Files\OpenSCAD\')
cmd = ['EXIT']
while system(cmd)
%   thisline = system(cmd)
%   if thisline; break; end  %end of file
    %now check whether the string in thisline is a "word", and store it if it is.
    %then
  end
cd(path_cd)
% fileID = fopen(file_name,'w');
% fprintf(fileID, '%s \n',  'translate([20,20,20]) cube([10,10,10]);')
% fclose(fileID);
% fileID = fopen(file_name,'w');
% fwrite(fileID, 'cube([10,10,10])')
% fclose(fileID);
% C:/Program Files/OpenSCAD/Drive/matlab_prog/openscad/test.scad

% x = 0:.1:1;
% A = [x; exp(x)];
% 
% fileID = fopen('exp.txt','w');
% fprintf(fileID,'%s \n', 'translate([0,0,0])cube([10,10,10]);');
% fprintf(fileID,'%s \n', 'translate([2,2,2])cube([10,10,10]);');
% fclose(fileID);