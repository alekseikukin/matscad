function projection_result = scadProjection(object, varargin)
%scadProjection - Using the projection() function, you can create 2d
%drawings from 3d models, and export them to the dxf format. It works by
%projecting a 3D model to the (x,y) plane, with z at 0. If cut=true, only
%points with z=0 are considered (effectively cutting the object), with
%cut=false(the default), points above and below the plane are considered as
%well (creating a proper projection).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
param = '';
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'cut'
            param =['cut = ' boolean2string(varargin{2})];
        otherwise
            error(['scadProjection: unknown paramiter - ' varargin{1}])
    end
    varargin(1:2) = [];
end
projection_result = ['projection(' param '){' newline];
projection_result = [projection_result char(object) newline];
projection_result = ([projection_result '}' ]);
end

