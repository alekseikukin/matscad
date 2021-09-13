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
cilinder = scadCylinder(70, 5,'d2', 2 ,'center', true,'color', 'red');
cilinder = scadRotate(cilinder, [0, 10, 30]) ; % rotate around central point [x, y, z]
structure = scadDifference(structure, cilinder);
w = 20;
h = 20;
l = 30;
points = [0, -10, 60;0, 10, 60;0, 10, 0;0, -10, 0;60, -10, 60;60, 10, 60; ...
    10, -10, 50;10, 10, 50;10, 10, 30;10, -10, 30;30, -10, 50;30, 10, 50];
faces = {...
    [0,2,3],   [0,1,2],  [0,4,5],  [0,5,1],   [5,4,2],  [2,4,3],...
    [6,8,9],  [6,7,8],  [6,10,11], [6,11,7], [10,8,11],...
    [10,9,8], [0,3,9],  [9,0,6], [10,6, 0],  [0,4,10],...
    [3,9,10], [3,10,4], [1,7,11],  [1,11,5], [1,7,8],  ...
    [1,8,2],  [2,8,11], [2,11,5]
    };
polyhedron = scadPolyhedron(points, faces, 'position', [30,0,0], 'color', 'blue' );
structure = scadUnion(structure, polyhedron);
structure = scadColor('green', structure);
structure = scadCircle(50, 'd', 'fn', 0, 'fa', 12, 'fs', 2)
SaveSCAD(file_name, structure);
SaveAsOpenSCAD(file_name);