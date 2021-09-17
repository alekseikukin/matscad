function SetOpenSCAD(varargin)
%SetOpenSCAD - set paramiters for correct work of OpenSCAD
current_folder = erase(which('SetOpenSCAD'), 'SetOpenSCAD.m');

fileID = fopen([current_folder 'ParamitersOpenSCAD'], 'w');
A = fread(fileID);
while ~isempty(varargin)
    k = strfind(A,string(varargin{1})) ;
    if ~isempty(k) || (max(size(k))) ~= 1
        for i = 1:(max(size(k)))
            A = eraseBetween(A, varargin{1}, newline,'Boundaries','inclusive');
        end
        A = [A newline varargin{1} ':'  varargin{2} ';' newline];
    else
        A = replaceBetween(A, varargin{1}, ';', varargin{2});
    end
    varargin(1:2) = [];
end
fwrite(fileID,A);
fclose(fileID);

end

