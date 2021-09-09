function translate_result = scadTranslate(varargin)
%scadTranslate Summary of this function goes here
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
translate_result = ['translate([' x ','  y ','  z ']){' newline];
while ~isempty(varargin)
    translate_result = [translate_result varargin{1} newline];
    varargin(1) = [];
end
translate_result = [translate_result '}' ];
end

