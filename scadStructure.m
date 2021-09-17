classdef scadStructure
    %scadStructure 
    properties
        structure % string with descriprion of structure in openSCAD
    end
    properties
        path2SCAD % openSCAD Folder path
    end
    methods
        function obj = scadStructure(string, varargin)
            %scadStructure -            
            obj.path2SCAD = 'C:\Program Files\OpenSCAD\';
            if isa(string,scadStructure)
                obj.structure = string.structure;
            else
                obj.structure = '';
                if ischar(string) || isstring(string)
                    varargin = {string; varargin{:}};
                else
                    disp('scadStructure: first paramiter must be a string or a scadStructure');
                end
            end
            while ~isempty(varargin)
                switch lower(varargin{1})
                    case 'path'
                        obj.path2SCAD  = varargin{2};
                    otherwise
                end
                varargin(1:2) = [];
            end
        end
        
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
            result = obj1.structure == obj2.structure;
        end
        function obj = Difference(obj, obj2)
            %Difference - 
            obj = obj - obj2;
        end
    end
end

