classdef scadStructure
    %SCADSTRUCTURE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        structure
    end
    
    methods
        function obj = scadStructure()
            %SCADSTRUCTURE Construct an instance of this class
            %   Detailed explanation goes here
            obj.structure = '';
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.Property1 + inputArg;
        end
    end
end

