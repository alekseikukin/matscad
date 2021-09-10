file_name = 'example3.scad';
StartOpenSCAD(file_name);
rect_1 = scadRect(10, 10, 10);
rect_2 = scadRect(5.1, 5.1, 5.1,    'color', 'red');
structure = scadTranslate([5,5,5], rect_2);
SaveAsOpenSCAD(file_name);