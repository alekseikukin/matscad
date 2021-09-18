function union_result = scadUnion(varargin)
%scadUnion -  Creates a union of all its child nodes. This is the sum of
%all children (logical or).

if isempty(varargin)
    error("scadunion: There must be at least 2 components")
else
    union_result = chekforunion(varargin{1});
    varargin(1) = [];
    while ~isempty(varargin)
        union_result = [union_result chekforunion(varargin{1})];
        varargin(1) = [];
    end
    union_result.structure = char(['union(){' newline union_result.structure newline '}']);
end

end

function string1 = chekforunion(string1)
while 1
    if isempty(string1.structure)
        break
    end
    string1.structure(strfind(string1.structure,'  ')) = [];
    string1.structure(strfind(string1.structure,[' ' newline])) = [];
    string1.structure(strfind(string1.structure,[newline ' '])) = [];
    string1.structure(strfind(string1.structure,[newline newline])) = [];
    k = strfind(string1.structure,'union');
    if ~isempty(k) && (k(1) == 1)
        k2 = strfind(string1.structure,'{');
        k3 = strfind(string1.structure,'}');
        string1.structure = string1.structure((k2(1) + 1):(k3(end) - 1));
    else
        break
    end
end
end