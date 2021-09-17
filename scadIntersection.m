function intersection_result = scadIntersection(varargin)
%scadIntersection - Creates the intersection of all child nodes. This keeps
%the overlapping portion (logical and).

if isempty(varargin)
    error("scadintersection: There must be at least 2 components")
else
    intersection_result = varargin{1};
    intersection_result.structure = ['difference(){' newline];
    intersection_result.structure = ['intersection(){' newline];
    while ~isempty(varargin)
        intersection_result.structure = [intersection_result.structure char(varargin{1}.structure) newline];
        varargin(1) = [];
    end
    intersection_result.structure = [intersection_result '}' ];
end
end

