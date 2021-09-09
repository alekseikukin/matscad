function intersection_result = scadIntersection(varargin)
%scadIntersection Summary of this function goes here
%   Detailed explanation goes here
if isempty(varargin)
    error("scadintersection: There must be at least 2 components")
else
    intersection_result = ['intersection(){' newline];
    while ~isempty(varargin)
        intersection_result = [intersection_result varargin{1} newline];
        varargin(1) = [];
    end
    intersection_result = [intersection_result '}' ];
end
end

