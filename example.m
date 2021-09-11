file_name = 'example3';
% StartOpenSCAD(file_name);
rect_1 = scadRect([10,10,10]);
rect_2 = scadRect([5.1, 5.1, 5.1], 'color', 'red', 'position', [5, 5, 5]);
structure = scadTranslate([5,5,5], rect_2);
structure = scadRotate(structure, 45, [5, 5, 5]); % rotate around axis [5,5,5] for 45deg
structure = scadHull(char(structure), char(rect_1)); 
structure = scadRotate(structure, [45, -45, 45]) ; % rotate around central point [x, y, z]
sphere = scadSphere(10, 'fn', 35, 'position', [5,0,20])
structure = scadUnion(structure, sphere)
for i =1:2
sphere = scadSphere(7, 'fn', 35, 'position', [rand*20-10,rand*20-10,rand*20])
structure = scadDifference(structure, sphere)
end
cilinder = scadCylinder(50, 5,'d2', 2 ,'center', true,'color', 'red');
cilinder = scadRotate(cilinder, [0, 30, 0]) ; % rotate around central point [x, y, z]
structure = scadUnion(structure, cilinder)

disp(structure)
SaveSCAD(file_name, structure);
SaveAsOpenSCAD(file_name);