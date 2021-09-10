function status = SaveAsOpenSCAD(scad_file_name, varargin)
%STARTOPENSCAD Summary of this function goes here
%   Detailed explanation goes here
output_file_extention = 'stl';
extra_params = {};
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'scadfolder'
            extra_params{end+1} = 'scadfolder';
            extra_params{end+1} = varargin{2};
        case {'ofe','output_file_extention'}
            output_file_extention = varargin{2};
        otherwise
    end
    varargin(1:2) = [];
end




quality = 'production';
cmd = ['-o ' ...
    output_filename '.' output_file_extention ...
    ' -D ' '"quality="" ' quality '"""'...
    scad_file_name ];
cmdOpenSCAD(cmd, extra_params{:});
end

