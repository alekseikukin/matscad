function difference_result = scadDifference(varargin)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
if isempty(varargin)
    error("scadDifference: There must be at least 2 components")
else
    difference_result = varargin{1};
    difference_result.structure = ['difference(){' newline];
    while ~isempty(varargin)
        difference_result.structure = [char(difference_result.structure) char(varargin{1}.structure) newline];
        varargin(1) = [];
    end
    difference_result.structure = [difference_result '}' ];
end
end

