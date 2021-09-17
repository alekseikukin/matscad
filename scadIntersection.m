function intersection_result = scadIntersection(varargin)
%scadIntersection Summary of this function goes here
%   Detailed explanation goes here
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

