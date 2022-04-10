# List of functions

## Functions for design

[scadStructure](scadStructure.m) - class that contain description of structure as [openSCAD](https://openscad.org/) code.

[SaveAsOpenSCAD(), scadStructure.SaveAs()](SaveAsOpenSCAD.m) -  output specified file instead of running the GUI, thefile extension specifies the type: stl, off, amf, 3mf, csg, dxf, svg, png,echo, ast, term, nef3, nefdbg.

[SaveSCAD(), scadStructure.Save()](SaveSCAD.m) -  save structure in openSCAD file (*.scad).

[StartOpenSCAD(), scadStructure.OpenGUI()](StartOpenSCAD.m) - open GUI of openSCAD with selected file (only for viewingstructure,  not necessary for convertion structure in .stl and etc).

[scadCircle(), scadStructure.Circle()](scadCircle.m) - Creates a circle at the origin. All parameters, except r,must be named.

[scadColor(), scadStructure.Color()](scadColor.m) - set a color of the object.

[scadCylinder(), scadStructure.Cylinder()](scadCylinder.m) -  Return scadStructure with cylinder discription

[scadDifference(), scadStructure.Difference()](scadDifference.m) - Subtracts the 2nd (and all further) child nodes from thefirst one (logical and not).

[scadHull(), scadStructure.Hull()](scadHull.m) - return the convex hull of objects.

[scadImport(), scadStructure.Import()](scadImport.m) - Imports a file for use in the current OpenSCAD model. Thefile extension is used to determine which type.

[scadIntersection(), scadStructure.Intersection()](scadIntersection.m) - Creates the intersection of all child nodes. This keepsthe overlapping portion (logical and).

[scadLinearExtrude(), scadStructure.LinearExtrude()](scadLinearExtrude.m) - Linear Extrusion is a operation that takes a 2D objectas input and generates a 3D object as a result.

[scadMinkowski(), scadStructure.Minkowski()](scadMinkowski.m) - Displays the minkowski sum of objects

[scadMirror(), scadStructure.Mirror()](scadMirror.m) - Mirrors the child element on a plane through the origin. Theargument to mirror() is the normal vector of a plane intersecting theorigin through which to mirror the object.

[scadMultmatrix(), scadStructure.Multmatrix()](scadMultmatrix.m) - Multiplies the geometry of all child elements with thegiven affine transformation matrix, where the matrix is 4×3 - a vector of3 row vectors with 4 elements each, or a 4×4 matrix with the 4th rowalways forced to [0,0,0,1].

[scadPolygon(), scadStructure.Polygon()](scadPolygon.m) - Creates a multiple sided shape from a list of x,ycoordinates. A polygon is the most powerful 2D object. It can createanything that circle and squares can, as well as much more. This includesirregular shapes with both concave and convex edges. In addition it canplace holes within that shape.

[scadPolyhedron(), scadStructure.Polyhedron()](scadPolyhedron.m) -  A polyhedron is the most general 3D primitive solid. It can be used to create any regular or irregular shape including those with concave as well as convex features. Curved surfaces are approximated by a series of flat surfaces.

[scadProjection(), scadStructure.Projection()](scadProjection.m) - Using the scadProjection function, you can create 2ddrawings from 3d models. It works byprojecting a 3D model to the (x,y) plane, with z at 0. If cut=true, onlypoints with z=0 are considered (effectively cutting the object), withcut=false(the default), points above and below the plane are considered aswell (creating a proper projection).

[scadRect(), scadStructure.Rect()](scadRect.m) - create rectangle with edges [x, y, z] = xyz_span.

[scadResize(), scadStructure.Resize()](scadResize.m) - Modifies the size of the child object to match the given x,y,and z.

[scadRotate(), scadStructure.Rotate()](scadRotate.m) - Rotates its child 'a' degrees about the axis of thecoordinate system or around an arbitrary axis.

[scadRotateExtrude(), scadStructure.RotateExtrude()](scadRotateExtrude.m) - Rotational extrusion spins a 2D shape around theZ-axis to form a solid which has rotational symmetry.

[scadScale(), scadStructure.Scale()](scadScale.m) - Scales its child elements using the specified vector.

[scadSphere(), scadStructure.Sphere()](scadSphere.m) - Creates a sphere at the origin of the coordinate system.

[scadSquare(), scadStructure.Square()](scadSquare.m) - Creates a square or rectangle in the first quadrant. Whencenter is true the square is centered on the origin. Argument names areoptional if given in the order shown here.

[scadText(), scadStructure.Text()](scadText.m) - The text module creates text as a 2D geometric object, usingfonts installed on the local system or provided as separate font file.

[scadTranslate(), scadStructure.Translate()](scadTranslate.m) - move object to point [x, y, z] = points.

[scadUnion(), scadStructure.Union()](scadUnion.m) - Creates a union of all its child nodes. This is the sum ofall children (logical or).

## Secondary functions

[boolean2string()](boolean2string.m) - convert boolean to string.

[FileExtController()](FileExtController.m) -  check that end sumbols of file name or folder string arecorrect and change it if it isn't correct.

[GetParamFromFile()](GetParamFromFile.m) - return pointed parameters from the file.

[cmdOpenSCAD()](cmdOpenSCAD.m) -  send a comand to openSCADsee list of comands here:  https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Using_OpenSCAD_in_a_command_line_environment.

[SetOpenSCAD](SetOpenSCAD.m) - set paramiters for correct work of OpenSCAD.