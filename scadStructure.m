classdef scadStructure < handle
    %scadStructure
    %%
    properties (Access = public,Dependent = false)
        structure % string with descriprion of structure in openSCAD
        file_name % file name to save a structure
        autosave % save file with structure in scad file after each operation
    end
    methods % initialization methods
        function obj = scadStructure(varargin)
            %scadStructure -
            obj.file_name = '';
            obj.autosave  = false;
            if ~isempty(varargin) && isa(varargin{1}, 'scadStructure')
                obj.structure = varargin{1}.structure;
                varargin(1) = [];
            else
                obj.structure = '';
            end
            while ~isempty(varargin)
                switch lower(varargin{1})
                    case 'file_name'
                        obj.file_name = varargin{2};
                    case 'autosave'
                        obj.autosave = varargin{2};
                    otherwise
                        error(['scadStructure: unknown parameter ' char(string(varargin{1}))]);
                end
                varargin(1:2) = [];
            end
            obj.AutoSave();
        end
    end
    methods % Boolean operations
        function obj = plus(obj1,obj2)
            %plus - union objects
            obj = obj1;
            if isempty(obj.structure)
                obj = [obj obj2];
            else
                obj = scadUnion(obj, obj2);
            end
            obj.AutoSave();
        end
        function obj = minus(obj1,obj2)
            %minus - exclude areas intersection areas from first object
            obj = obj1;
            obj = scadDifference(obj, obj2);
            obj.AutoSave();
        end
        function obj = or(obj1,obj2)
            %or - union objects
            obj = obj1;
            obj = scadUnion(obj, obj2);
            obj.AutoSave();
        end
        function obj = and(obj1,obj2)
            %and - return intersection area of objects
            obj = obj1;
            obj = scadIntersection(obj, obj2);
            obj.AutoSave();
        end
        function result = eq(obj1,obj2)
            %eq - return resalt of comparation of 2 objects
            result = (string(obj1.structure) == string(obj2.structure));
        end
        function obj = Difference(obj, obj2)
            %Difference - exclude object from current object
            obj = obj - obj2;
            obj.AutoSave();
        end
        function obj = Intersection(obj, obj2)
            %Intersection - return intersected area of 2 objects
            obj = obj & obj2;
            obj.AutoSave();
        end
        function obj = Union(obj, obj2)
            %Union - return union of objects
            obj = obj + obj2;
            obj.AutoSave();
        end
        function obj = horzcat(obj1,obj2)
            %horzcat - add second structure in the end of first structure.
            obj = obj1;
            obj.structure = [obj.structure newline obj2.structure];
            obj.AutoSave();
        end
    end
    methods % transformations
        function obj = Projection(obj,varargin)
            %Projection - Using the scadProjection function, you can create 2d
            %drawings from 3d models. It works by
            %projecting a 3D model to the (x,y) plane, with z at 0. If cut=true, only
            %points with z=0 are considered (effectively cutting the object), with
            %cut=false(the default), points above and below the plane are considered as
            %well (creating a proper projection)
            obj = scadProjection(obj, varargin{:});
            obj.AutoSave();
        end
        function obj = Rotate(obj, angles, varargin)
            %Rotate - turn the object at an angle
            obj = scadRotate(angles, obj, varargin{:});
            obj.AutoSave();
        end
        function obj = Color(obj, color, varargin)
            %Color - set colot of object (new color overwrite all previous)
            obj = scadColor(color, obj, varargin{:});
            obj.AutoSave();
        end
        function obj = Translate(obj, points,  varargin)
            %Translate - move object to new coordinates
            obj = scadTranslate(points, obj, varargin{:});
            obj.AutoSave();
        end
        function obj = Mirror(obj, surface, varargin)
            %Mirror - add mirror object
            obj = scadMirror(surface, obj, varargin{:});
            obj.AutoSave();
        end
        function obj = Scale(obj, multiplicators, varargin)
            %Scale - change size of object
            obj = scadScale(multiplicators, obj, varargin{:});
            obj.AutoSave();
        end
        function obj = Resize(obj, multiplicators, varargin)
            %Resize - change size of object
            obj = scadResize(multiplicators, obj, varargin{:});
            obj.AutoSave();
        end
        function obj = Multmatrix(obj, points, varargin)
            obj = scadMultmatrix(points, obj, varargin{:});
            obj.AutoSave();
        end
        function obj = RotateExtrude(obj, angles, varargin)
            %RotateExtrude - Rotational extrusion spins a 2D shape around
            %the Z-axis to form a solid which has rotational symmetry
            obj = scadRotateExtrude(angles, obj, varargin{:});
            obj.AutoSave();
        end
        function obj = LinearExtrude(obj, height, varargin)
            %LinearExtrude - Linear Extrusion is a operation that takes a
            %2D object as input and generates a 3D object as a result
            obj = scadLinearExtrude(height, obj, varargin{:});
            obj.AutoSave();
        end
    end
    methods % adding a structure
        function obj = Square(obj, size1, varargin)
            %Square - Creates a square or rectangle in the first quadrant
            obj = obj + scadSquare(size1, varargin{:});
        end
        function obj = Circle(obj, size1, varargin)
            %Circle - Creates a circle at the origin
            obj = obj + scadCircle(size1, varargin{:});
        end
        function obj = Import(obj, file_name, varargin)
            %Import - Imports a file for use in the current OpenSCAD model
            obj = obj + scadImport(file_name, varargin{:});
        end
        function obj = Cylinder(obj, h, d, varargin)
            %Cylinder - Return scadStructure with cylinder
            obj = obj + scadCylinder(h, d, varargin{:});
        end
        function obj = Sphere(obj, diam, varargin)
            %Sphere - Creates a sphere
            obj = obj + scadSphere(diam, varargin{:});
        end
        function obj = Rect(obj, xyz_span, varargin)
            %Rect - create rectangle
            obj = obj + scadRect(xyz_span, varargin{:});
        end
        function obj = Polygon(obj, points, varargin)
            %Polygon - Creates a multiple sided shape from a list of x,y
            %coordinates
            obj = obj + scadPolygon(points, varargin{:});
        end
        function obj = Text(obj, text1, varargin)
            %Text - The text module creates text as a 2D geometric object
            obj = obj + scadText(text1, varargin{:});
        end
        function obj = Polyhedron(obj, points, faces, varargin)
            %Polyhedron - can be used to create any regular or irregular
            %shape
            obj = obj + scadPolyhedron(points, faces, varargin{:});
        end
    end
    methods % files functions
        function [obj, nbytes, status] = Save(obj, varargin)
            %Save - save structure to .scad file
            varargin2 = {};
            while ~isempty(varargin)
                switch lower(varargin{1})
                    case 'file_name'
                        obj.file_name = varargin{2};
                        varargin(1:2) = [];
                    otherwise
                        varargin2{end + 1} = varargin{1};
                        varargin2{end + 1} = varargin{2};
                        varargin(1:2) = [];
                end
            end
            if isempty(obj.file_name)
                [file_name1, path ] = uiputfile('*.scad', 'Save file as');
                if ~isempty(file_name1)
                    obj.file_name = [path file_name1];
                else
                    error("file wasn't selected")
                end
            end
            [nbytes, status] = SaveSCAD(obj.file_name, obj, varargin2{:});
            return
        end
        function obj = SaveAs(obj, varargin)
            %SaveAs - export file in special file format (by default .stl)
            varargin2 = {};
            obj.Save();
            sa_file_name = obj.file_name;
            while ~isempty(varargin)
                switch lower(varargin{1})
                    case 'file_name'
                        sa_file_name = varargin{2};
                        varargin(1:2) = [];
                    otherwise
                        varargin2{end + 1} = varargin{1};
                        varargin2{end + 1} = varargin{2};
                        varargin(1:2) = [];
                end
            end
                        disp('sa_file_name')

            disp(sa_file_name)
            SaveAsOpenSCAD(obj.file_name, 'output_filename', sa_file_name, varargin2{:});
        end
        function obj = OpenGUI(obj, varargin)
            %OpenGUI - star GUI of openSCAD
            obj.Save();
            StartOpenSCAD(obj.file_name, varargin{:});
        end
        function obj = AutoSave(obj,varargin)
            %AutoSave - save scad file if option is on
            if obj.autosave
                obj.Save(varargin{:});
            end
        end
    end
end