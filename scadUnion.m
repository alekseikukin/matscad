function union_result = scadUnion(varargin)
%scadUnion -  Creates a union of all its child nodes. This is the sum of
%all children (logical or).

if isempty(varargin)
    error("scadunion: There must be at least 2 components")
else
    union_result = varargin{1};
    varargin(1) = [];
    while ~isempty(varargin)
        union_result = [union_result varargin{1}];
        varargin(1) = [];
    end
    union_result.structure = char(['union(){' newline union_result.structure newline '}']);
end
end

