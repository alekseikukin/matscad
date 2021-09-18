classdef scadStructure < handle
    %scadStructure
    properties (Access = public,Dependent = false)
        structure % string with descriprion of structure in openSCAD
        file_name % file name to save a structure
    end
    %     properties
    %     end
    methods % initialization methods
        function obj = scadStructure(varargin)
            %scadStructure -
            obj.file_name = '';
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
                        
                    otherwise
                        error(['scadStructure: unknown parameter ' char(string(varargin{1}))]);
                end
                varargin(1:2) = [];
            end
        end
    end
    methods % Boolean operations
        function obj = plus(obj1,obj2)
            %plus
            obj = obj1;
            obj = scadUnion(obj, obj2);
        end
        function obj = minus(obj1,obj2)
            %minus
            obj = obj1;
            obj = scadDifference(obj, obj2);
        end
        function obj = or(obj1,obj2)
            %or
            obj = obj1;
            obj = scadUnion(obj, obj2);
        end
        function obj = and(obj1,obj2)
            %and
            obj = obj1;
            obj = scadIntersection(obj, obj2);
        end
        function result = eq(obj1,obj2)
            %eq - return resalt of comparation of 2 objects
            result = (string(obj1.structure) == string(obj2.structure));
        end
        function obj = Difference(obj, obj2)
            %Difference - exclude object from current object
            obj = obj - obj2;
        end
        function obj = Intersection(obj, obj2)
            %Intersection - return intersected area of 2 objects
            obj = obj && obj2;
        end
        function obj = Union(obj, obj2)
            %Union - return union  of 2 objects
            obj = obj + obj2;
        end
        function obj = horzcat(obj1,obj2)
            %horzcat - add second structure in the end of first structure.
            obj = obj1;
            obj.structure = [obj.structure newline obj2.structure];
        end
        
    end
    methods % transformations
        function obj = Projection(obj,varargin)
            obj = scadProjection(obj, varargin{:});
        end
        function obj = Rotate(obj, angles, varargin)
            obj = scadRotate(angles, obj, varargin{:});
        end
        function obj = Color(obj, color, varargin)
            obj = scadColor(color, obj, varargin{:});
        end
        function obj = Translate(obj, points,  varargin)
            obj = scadTranslate(points, obj, varargin{:});
        end
        function obj = Mirror(obj, surface, varargin)
            obj = scadMirror(surface, obj, varargin{:});
        end
        function obj = Scale(obj, multiplicators, varargin)
            obj = scadScale(multiplicators, obj, varargin{:});
        end
        function obj = Resize(obj, multiplicators, varargin)
            obj = scadResize(multiplicators, obj, varargin{:});
        end
        function obj = Multmatrix(obj, points, varargin)
            obj = scadMultmatrix(points, obj, varargin{:});
        end
        function obj = RotateExtrude(obj, angles, varargin)
            obj = scadRotateExtrude(angles, obj, varargin{:});
        end
        function obj = LinearExtrude(obj, height, varargin)
            obj = scadLinearExtrude(height, obj, varargin{:});
        end        
    end
    methods % adding a structure
        function obj = Square(obj, size1, varargin)
            if isempty(obj.structure)
                obj = [obj scadSquare(size1, varargin{:})];
            else
                obj = obj + scadSquare(size1, varargin{:});
            end
        end
        function obj = Circle(obj, size1, varargin)
            if isempty(obj.structure)
                obj = [obj scadCircle(size1, varargin{:})];
            else
                obj = obj + scadCircle(size1, varargin{:});
            end
        end
        function obj = Import(obj, file_name, varargin)
            if isempty(obj.structure)
                obj = [obj scadImport(file_name, varargin{:})];
            else
                obj = obj + scadImport(file_name, varargin{:});
            end
        end
        function obj = Cylinder(obj, h, d, varargin)
            if isempty(obj.structure)
                obj = [obj scadCylinder(h, d, varargin{:})];
            else
                obj = obj + scadCylinder(h, d, varargin{:});
            end
        end
        function obj = Sphere(obj, diam, varargin)
            if isempty(obj.structure)
                obj = [obj scadSphere(diam, varargin{:})];
            else
                obj = obj + scadSphere(diam, varargin{:});
            end
        end
        function obj = Rect(obj, xyz_span, varargin)
            if isempty(obj.structure)
                obj = [obj scadRect(xyz_span, varargin{:})];
            else
                obj = obj + scadRect(xyz_span, varargin{:});
            end
        end
        function obj = Polygon(obj, points, varargin)
            if isempty(obj.structure)
                obj = [obj scadPolygon(points, varargin{:})];
            else
                obj = obj + scadPolygon(points, varargin{:});
            end
        end
        function obj = Text(obj, text1, varargin)
            if isempty(obj.structure)
                obj = [obj scadText(text1, varargin{:})];
            else
                obj = obj + scadText(text1, varargin{:});
            end
        end
        function obj = Polyhedron(obj, points, faces, varargin)
            if isempty(obj.structure)
                obj = [obj scadPolyhedron(points, faces, varargin{:})];
            else
                obj = obj + scadPolyhedron(points, faces, varargin{:});
            end
        end
    end
    methods % files functions
        function [obj, nbytes, status] = Save(obj, varargin)
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
                obj.file_name = [path file_name1];
            end
            [nbytes, status] = SaveSCAD(obj.file_name, obj, varargin2{:});
            return
        end
        function obj = SaveAs(obj, varargin)
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
            SaveAsOpenSCAD(sa_file_name, varargin2{:});
        end
        function obj = OpenGUI(obj, varargin)
            obj.Save();
            StartOpenSCAD(obj.file_name, varargin{:});
        end
    end
end