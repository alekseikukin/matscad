function scale_result = scadScale(varargin)
%scadscale Summary of this function goes here
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
scale_result = ['scale([' x ','  y ','  z ']){' newline];
while ~isempty(varargin)
    scale_result = [scale_result varargin{1} newline];
    varargin(1) = [];
end
scale_result = [scale_result '}' ];
end

