clear;
test1 = scadStructure('file_name', 'test1', 'autosave', true); % initiate main structure
test1.OpenGUI();
test1.Color('red');
test1.Sphere(50, 'position', [0,0,25]);
test2 = scadRect([30,40,25], 'position', [0, 0, 12]);
test2.Color('green');
test1 = test1 - test2;
test2.Translate([-30,-40,0]);
test2.Color('blue');
test1 = test1 + test2;
test1.Translate([-30,-40,0]);
test1.Mirror([1,0,0]);
test1.Scale([3,1,1]);
test1.Rotate(45);
test1.SaveAs('file_name', 'example2')
