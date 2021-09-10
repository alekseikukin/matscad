function resize_result = scadResize(varargin)
%scadresize Summary of this function goes here
%   Detailed explanation goes here
if max(size(varargin)) == 7
    x = num2str_2(varargin{1});
    y = num2str_2(varargin{2});
    z = num2str_2(varargin{3});
    auto_x = num2str_2(varargin{4});
    auto_y = num2str_2(varargin{5});
    auto_z = num2str_2(varargin{6});
    
    varargin(1:3) = [];
elseif max(size(varargin)) == 3
    x = num2str_2(varargin{1}(1));
    y = num2str_2(varargin{1}(2));
    z = num2str_2(varargin{1}(3));
    auto_x = num2str_2(varargin{2}(1));
    auto_y = num2str_2(varargin{2}(2));
    auto_z = num2str_2(varargin{2}(3));
    
    varargin(1) = [];
else
end
resize_result = ['resize([' x ','  y ','  z '],' ...
    ' auto = [' auto_x ','  auto_y ','  auto_z  ']){' newline];
while ~isempty(varargin)
    resize_result = [resize_result varargin{1} newline];
    varargin(1) = [];
end
resize_result = [resize_result '}' ];
end

