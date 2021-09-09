function union_result = scadUnion(varargin)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
if isempty(varargin)
    error("scadUnion: There must be at least 2 components")
else
    union_result = ['union(){' newline];
    while ~isempty(varargin)
        union_result = [union_result varargin{1} newline];
        varargin(1) = [];
    end
    union_result = [union_result '}' ];
end
end

