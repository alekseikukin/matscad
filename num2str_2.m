function x = num2str_2(x)
%num2str_2 Check arg, if string do nothing, else convert to string
%   Detailed explanation goes here
if ~isstring(x)
    x = num2str(x);
end
end

