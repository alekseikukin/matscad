file_name = 'example3';
% StartOpenSCAD(file_name);
rect_1 = scadRect([10,10,10]);
rect_2 = scadRect([5.1, 5.1, 5.1], 'color', 'red', 'position', [5, 5, 5]);
structure = scadTranslate([5,5,5], rect_2);
structure = scadRotate(structure, 45, [5, 5, 5]); % rotate around axis [5,5,5] for 45deg
structure = scadHull(char(structure), char(rect_1)); 
structure = scadRotate(structure, [45, -45, 45]) ; % rotate around central point [x, y, z]

disp(structure)
SaveSCAD(file_name, structure);
SaveAsOpenSCAD(file_name);