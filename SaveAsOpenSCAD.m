function status = SaveAsOpenSCAD(scad_file_name, varargin)
%SaveAsOpenSCAD  - output specified file instead of running the GUI, the
%file extension specifies the type: stl, off, amf, 3mf, csg, dxf, svg, png,
%echo, ast, term, nef3, nefdbg
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
output_file_extention = 'stl';
scad_file_name = FileExtController(scad_file_name, 'scad');
output_filename = scad_file_name;
extra_params = {};
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'scadfolder'
            extra_params{end+1} = 'scadfolder';
            extra_params{end+1} = FileExtController(varargin{2}, "/");
        case 'output_filename'
            output_filename = varargin{2};
        case {'ofe','output_file_extention'}
            output_file_extention = varargin{2};
        otherwise
    end
    varargin(1:2) = [];
end
output_filename = FileExtController(output_filename, output_file_extention);
quality = 'production';
cmd = ['-o ' ...
     output_filename ...
    ' -D ' '"quality=""' quality '""" '...
    scad_file_name ];
status = cmdOpenSCAD(cmd, extra_params{:});
end

