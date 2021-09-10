function string_1 = FileExtController(string_1, correct_end, varargin)
%FileExtController check that end sumbols of file name or folder string are
%correct and change it if it isn't correct.
%   Detailed explanation goes here
if size(correct_end) == 1
    if string(string_1(end)) == string(correct_end)
        return
    else
        string_1 = [string_1 correct_end];
        return
    end
elseif size(correct_end) == 3 || size(correct_end) == 4
    if correct_end == 4
        correct_end = correct_end(2:end);
    end
    if string(string_1((max(size(string_1))-3):end)) == string(correct_end)
        return
    else
        if contains(string(string_1), ".")
            k = strfind(string_1,'.');
            string_1 = [string_1(1:k(end)) correct_end];
            return
        else
            string_1 = [string_1 '.' correct_end];
            return
        end
    end
    
    
    
    
end

