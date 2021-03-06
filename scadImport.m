function object = scadImport(file_name,varargin)
%scadImport - Imports a file for use in the current OpenSCAD model. The
%file extension is used to determine which type.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3D formats:
% STL 
% OFF
% AMF 
% 3MF 
% 2D formats:
% DXF
% SVG 
% Other:
% CSG can be imported using include<> or loaded like an SCAD file, PNG can
% be imported using surface()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters
%
% file_name - A string containing the path to file.:If the give path is not
% absolute, it is resolved relative to the importing script. Note that when
% using include<> with a script that uses import(), this is relative to the
% script doing the include<>.
%
% convexity An Integer. The convexity parameter specifies the maximum
% number of front sides (back sides) a ray intersecting the object might
% penetrate. This parameter is needed only for correctly displaying the
% object in OpenCSG preview mode and has no effect on the polyhedron
% rendering. Optional.
%
% layer -  For DXF import only, specify a specific layer to import.
% Optional.
%
param = '';
position = [];
color = [];
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'convexity'
            param = [param ', convexity = ' num2str( varargin{2})];
        case 'layer'
            param = [param ', layer = ' num2str( varargin{2})];
        case 'position'
            position = varargin{2};
        case 'color'
            color = varargin{2};
        otherwise
            error(['scadImport: unknown paramiter - ' varargin{1}])
    end
    varargin(1:2) = [];
end
object = scadStructure();
object.structure = ['import("' char(file_name) '"' char(param) ');'];
if ~isempty(position)
    object =  scadTranslate(position, object);
end
if ~isempty(color)
    object =  scadColor(color, object);
end
end

