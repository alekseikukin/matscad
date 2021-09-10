function hull_result = scadHull(varargin)
%scadhull Summary of this function goes here
%   Detailed explanation goes here
hull_result = ['hull(){' newline];
hull_result = [hull_result strjoin(varargin, newline) newline];
hull_result = [hull_result '}' ];
end