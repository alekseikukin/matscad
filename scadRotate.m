function object = scadRotate(angles, object, varargin)
%scadRotate  - Rotates its child 'a' degrees about the axis of the
%coordinate system or around an arbitrary axis.
%%
param = '';
formatSpec = '[ %d, %d, %d ]';
while ~isempty(varargin)
    switch lower(varargin{1})
        case 'axis'
            param = [param ', v = ' char(compose(formatSpec, varargin{1}))];
        otherwise
            error(['scadRotate: unknown parameter' char(string(varargin{1}))])
    end
    varargin(1:2) = [];
end

if max(size(angles)) == 1
    angles = num2str(angles);
elseif max(size(angles)) == 3
    angles =['a = ' char(compose(formatSpec, angles))];
else
    error('scadRotate: angle must be vector 1 x 3 [x_angle, y_angle, z_angle] or double')
end
rotate_result = ['rotate(' angles param '){' newline];
rotate_result = [rotate_result char(object.structure) newline];
rotate_result = ([rotate_result '}' ]);
object.structure = rotate_result;
end

