file_name = 'example3';
% StartOpenSCAD(file_name);
rect_1 = scadRect([10,10,10])
rect_2 = scadRect([5.1, 5.1, 5.1], 'color', 'red', 'position', [5,5,5]);
structure = scadTranslate([5,5,5], rect_2)
structure = scadHull(char(structure), char(rect_1))
disp(structure)
SaveSCAD(file_name, structure)
SaveAsOpenSCAD(file_name);