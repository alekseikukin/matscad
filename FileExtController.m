function file_name = FileExtController(file_name, correct_end, varargin)
%FileExtController check that end sumbols of file name or folder string are
%correct and change it if it isn't correct.
%%
if ~isempty(file_name)
    if size(correct_end) == 1
        if string(file_name(end)) == string(correct_end)
            return
        else
            file_name = [file_name correct_end];
            return
        end
    elseif max(size(correct_end)) == 3 || max(size(correct_end)) == 4
        if correct_end == 4
            correct_end = correct_end(2:end);
        end
        if (max(size(file_name)) > 4) && (string(file_name((max(size(file_name))-3):end)) == string(correct_end))
            return
        else
            if contains(string(file_name), ".")
                k = strfind(file_name,'.');
                file_name = [file_name(1:k(end)) correct_end];
                return
            else
                file_name = [file_name '.' correct_end];
                return
            end
        end
    end
else
    error('FileExtController: file_name must contain at least 1 simbol')
end
end

