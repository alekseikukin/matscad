function mirror_result = scadMirror(varargin)
%scadMirror Summary of this function goes here
%   Detailed explanation goes here
if max(size(varargin)) == 4
    x = num2str_2(varargin{1});
    y = num2str_2(varargin{2});
    z = num2str_2(varargin{3});
    varargin(1:3) = [];
elseif max(size(varargin)) == 2
    x = num2str_2(varargin{1}(1));
    y = num2str_2(varargin{1}(2));
    z = num2str_2(varargin{1}(3));
    varargin(1) = [];
else
end
mirror_result = ['mirror([' x ','  y ','  z ']){' newline];
while ~isempty(varargin)
    mirror_result = [mirror_result varargin{1} newline];
    varargin(1) = [];
end
mirror_result = [mirror_result '}' ];
end

