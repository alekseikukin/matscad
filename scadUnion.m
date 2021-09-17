function union_result = scadUnion(varargin)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if isempty(varargin)
    error("scadunion: There must be at least 2 components")
else
    union_result = varargin{1};
    union_result.structure = ['union(){' newline];
    while ~isempty(varargin)
        union_result.structure = [char(union_result.structure) char(varargin{1}.structure) newline];
        varargin(1) = [];
    end
    union_result.structure = [union_result '}' ];
end
end

