%%%%%%%%%%%%%%%% generate stl file with cheese inside.%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% this work with nightly version 2024 %%%%%%%%%%%%%%%%%%%%%%%
clear;
radius = 40;
thikness = 10;
test_structure = scadStructure('file_name', 'cheese', 'autosave', true); % initiate main structure
% test_structure.OpenGUI(); % start GUI (just see the result)
test_structure.Square([radius,thikness], 'center', false); % add Square in structure
test_structure.RotateExtrude(45,'fn', 100); % rotate Square around Oz
test_structure2 = scadStructure('file_name', 'bubbles', 'autosave', true); % initiate secondary structure
for i =1:50 % adding in secondary structure 50 bubbles
    % generation of paramiters of bubbles
    d = rand() * (thikness*0.3) + (thikness*0.3);
    x = radius;
    y = radius;
    z = thikness*1.4 * rand() - thikness*0.2;
    while (x^2 + y^2) > (radius^2)
        x = (radius - thikness/2) * rand();
        y = (radius - thikness/2) * rand;
    end
    % adding bubbles. if 'fn' will be 50 or more bubbles will be smoother, but saving will take longer
    test_structure2.Sphere(d, 'position', [x, y, z], 'fn', 15); 
end
test_structure = test_structure - test_structure2;
tic
test_structure.SaveAs(); % defauld render
toc
tic
test_structure.SaveAs('render', 'cgal');  % cgal render
toc
tic
test_structure.SaveAs('render', 'manifold'); % manifold render
toc