function rotate_result = scadRotate(object, varargin)
%scadrotate Summary of this function goes here
%   Detailed explanation goes here
if isvector(varargin{1}) && max(size(varargin{1})) == 3
    formatSpec = string( [ '[ %d, %d, %d ]' ] );
    rotation_params = varargin{1};
    varargin(1) = [];
elseif isvector(varargin{2}) && max(size(varargin{2})) == 3 && isvector(varargin{1}) && max(size(varargin{1})) == 1
    formatSpec = string( [ 'a = %d, v = [%d, %d, %d]' ] );
    rotation_params = [varargin{1}(:), varargin{2}(1,:)];
    varargin(1:2) = [];
else
end
rotate_result = ['rotate(' char(compose(formatSpec, rotation_params)) '){' newline];
rotate_result = [rotate_result char(object) newline];
rotate_result = ([rotate_result '}' ]);
end

