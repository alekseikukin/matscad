function translate_result = scadTranslate(x, y, z)
%scadTranslate Summary of this function goes here
%   Detailed explanation goes here
x = num2str_2(x);
y = num2str_2(y);
z = num2str_2(z);
translate_result = ['translate([' x ','  y ','  z ']){' newline];
while ~isempty(varargin)
    translate_result = [translate_result varargin{1} newline];
    varargin(1) = [];
end
translate_result = [translate_result '}' ];
end

