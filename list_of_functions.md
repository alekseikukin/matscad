[scadStructure](scadStructure.m) - 

[FileExtController](FileExtController.m) -  check that end sumbols of file name or folder string arecorrect and change it if it isn't correct.

[GetParamFromFile](GetParamFromFile.m) - return pointed parameters from the file

[SaveAsOpenSCAD](SaveAsOpenSCAD.m) -  output specified file instead of running the GUI, thefile extension specifies the type: stl, off, amf, 3mf, csg, dxf, svg, png,echo, ast, term, nef3, nefdbg

[SaveSCAD](SaveSCAD.m) -  save structure in openSCAD file (*.scad)

[StartOpenSCAD](StartOpenSCAD.m) - open GUI of openSCAD with selected file (only for viewingstructure,  not necessary for convertion structure in .stl and etc)

[boolean2string](boolean2string.m) - convert boolean to string.

[cmdOpenSCAD](cmdOpenSCAD.m) -  send a comand to openSCADsee list of comands here:  https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Using_OpenSCAD_in_a_command_line_environment

[scadCircle](scadCircle.m) - Creates a circle at the origin. All parameters, except r,must be named.

[scadColor](scadColor.m) - set a color of the object

[scadCylinder](scadCylinder.m) -  Return scadStructure with cylinder discription

[scadDifference](scadDifference.m) - Subtracts the 2nd (and all further) child nodes from thefirst one (logical and not).

[scadHull](scadHull.m) - return the convex hull of objects.

[scadImport](scadImport.m) - Imports a file for use in the current OpenSCAD model. Thefile extension is used to determine which type.

[scadIntersection](scadIntersection.m) - Creates the intersection of all child nodes. This keepsthe overlapping portion (logical and).

[scadLinearExtrude](scadLinearExtrude.m) - Linear Extrusion is a operation that takes a 2D objectas input and generates a 3D object as a result.

[scadMinkowski](scadMinkowski.m) - Displays the minkowski sum of objects

[scadMirror](scadMirror.m) - Mirrors the child element on a plane through the origin. Theargument to mirror() is the normal vector of a plane intersecting theorigin through which to mirror the object.

[scadMultmatrix](scadMultmatrix.m) - Multiplies the geometry of all child elements with thegiven affine transformation matrix, where the matrix is 4×3 - a vector of3 row vectors with 4 elements each, or a 4×4 matrix with the 4th rowalways forced to [0,0,0,1].

[scadPolygon](scadPolygon.m) - Creates a multiple sided shape from a list of x,ycoordinates. A polygon is the most powerful 2D object. It can createanything that circle and squares can, as well as much more. This includesirregular shapes with both concave and convex edges. In addition it canplace holes within that shape.

[scadPolyhedron](scadPolyhedron.m) -  A polyhedron is the most general 3D primitive solid. It can be used to create any regular or irregular shape including those with concave as well as convex features. Curved surfaces are approximated by a series of flat surfaces.

[scadProjection](scadProjection.m) - Using the scadProjection function, you can create 2ddrawings from 3d models. It works byprojecting a 3D model to the (x,y) plane, with z at 0. If cut=true, onlypoints with z=0 are considered (effectively cutting the object), withcut=false(the default), points above and below the plane are considered aswell (creating a proper projection).

[scadRect](scadRect.m) - create rectangle with edges [x, y, z] = xyz_span;

[scadResize](scadResize.m) - Modifies the size of the child object to match the given x,y,and z.

[scadRotate](scadRotate.m) - Rotates its child 'a' degrees about the axis of thecoordinate system or around an arbitrary axis.

[scadRotateExtrude](scadRotateExtrude.m) - Rotational extrusion spins a 2D shape around theZ-axis to form a solid which has rotational symmetry.

[scadScale](scadScale.m) - Scales its child elements using the specified vector.

[scadSphere](scadSphere.m) - Creates a sphere at the origin of the coordinate system.

[scadSquare](scadSquare.m) - Creates a square or rectangle in the first quadrant. Whencenter is true the square is centered on the origin. Argument names areoptional if given in the order shown here.

[scadText](scadText.m) - The text module creates text as a 2D geometric object, usingfonts installed on the local system or provided as separate font file.

[scadTranslate](scadTranslate.m) - move object to point [x, y, z] = points

[scadUnion](scadUnion.m) - Creates a union of all its child nodes. This is the sum ofall children (logical or).
